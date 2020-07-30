import 'package:firebase_database/firebase_database.dart';
class Friends{
  String name;
  String number;
  String image;

  Friends({this.image,this.number,this.name});

  Friends.fromSnapshot(DataSnapshot snapshot){

    number = snapshot.value["number"];
    name = snapshot.value["name"];
    image = snapshot.value["image"];



  }
}