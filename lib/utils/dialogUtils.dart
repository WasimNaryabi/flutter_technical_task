import 'package:flutter/material.dart';
import 'package:fluttertechnicaltask/presenter/presenter.dart';

class GetDialogUtils{
  Presenter _presenter = Presenter();

  pickImage(BuildContext context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Select Image"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  ListTile(
                    leading: IconButton(
                      icon:Icon(Icons.image),

                    ),
                    title: Text("Gallery"),
                    onTap: () => _presenter.getImageFromGallery(),
                  ),
                  ListTile(
                    leading: IconButton(
                      icon:Icon(Icons.camera_alt),

                    ),
                    title: Text("Camera"),
                    onTap: () => _presenter.getImageFromCamera(),
                  )
                ],
              ),
            ),
          );
        });
  }
}