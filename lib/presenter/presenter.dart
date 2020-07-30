import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertechnicaltask/utils/DatabaseUtils.dart';
import 'package:fluttertechnicaltask/viewmodel/contacts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertechnicaltask/viewmodel/friends.dart';
import 'package:fluttertechnicaltask/viewmodel/payments.dart';
import 'package:fluttertechnicaltask/views/contact_list_screen.dart';
import 'package:fluttertechnicaltask/views/view.dart';
import 'package:image_picker/image_picker.dart';

class AppPresenter{
  void onScreenStart(bool check){

  }

  set screenView(View value){}
}

class Presenter implements AppPresenter{
  File imageURI;
  String _uploadedFileURL;
  GetDataBaseUtils _dbUtils = GetDataBaseUtils();
  Payments _payments = Payments();
  View _view;

  Future getImageFromCamera() async {

    await ImagePicker.pickImage(source: ImageSource.camera).then((image){
        imageURI = image;
        print("Image : $imageURI");
        uploadFile();
        getPaymentDetails();
    });


  }

  Future getImageFromGallery() async {

    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      imageURI = image;
      print("Image : $imageURI");
      uploadFile();
      getPaymentDetails();


  }

  getPaymentDetails() async{

  }

  Future uploadFile() async {
    DateTime now = DateTime.now();
    print("Data and time : $now");
    var storageReference =_dbUtils.getStorage().child("$now");
    print(storageReference);
    StorageUploadTask uploadTask = storageReference.putFile(imageURI);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {

        _uploadedFileURL = fileURL;
        updatePaymentChild();

    });
  }

  Future updatePaymentChild() async{
    await _dbUtils.getPayment().child("wasim ahmad").update({
      "image": _uploadedFileURL
    });
  }

  @override
  void onScreenStart(bool check) async{
    if(check){
      await _dbUtils.getPayment().child("wasim ahmad").once().then((DataSnapshot snapshot){

        _payments.name = snapshot.value["name"];
        _payments.image = snapshot.value["image"];
        _payments.day = snapshot.value["day"];
        _payments.time = snapshot.value["time"];
        _payments.status = snapshot.value["status"];
        _payments.message = snapshot.value["message"];
        _payments.money = snapshot.value["money"];
        _payments.number = snapshot.value["number"];
        print("TRY to call getPayments method");
        _view.getPayments(_payments.name, _payments.number, _payments.image, _payments.money, _payments.status, _payments.time, _payments.day, _payments.message);

      });
    }

  }

  @override
  void set screenView(View value) {
    _view = value;
  }
}