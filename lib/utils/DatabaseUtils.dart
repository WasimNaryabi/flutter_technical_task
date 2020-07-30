import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GetDataBaseUtils{

  DatabaseReference _ContactRef = FirebaseDatabase.instance.reference().child("contacts");
  DatabaseReference _FriendsRef = FirebaseDatabase.instance.reference().child("friends");
  DatabaseReference _LastPaymentRef = FirebaseDatabase.instance.reference().child("last payment");
  DatabaseReference _Payment = FirebaseDatabase.instance.reference().child("payments");
  StorageReference _storage = FirebaseStorage.instance.ref();

  DatabaseReference getContact() {
    return _ContactRef;
  }

  DatabaseReference getFriend() {
    return _FriendsRef;
  }

  DatabaseReference getLastPayment() {
    return _LastPaymentRef;
  }

  DatabaseReference getPayment() {
    return _Payment;
  }

  StorageReference getStorage() {
    return _storage;
  }


}