import 'package:firebase_database/firebase_database.dart';
class LastPayment{
  String name;
  String number;
  String image;

  LastPayment({this.number,this.name, this.image});

  LastPayment.fromSnapshot(DataSnapshot snapshot){

    number = snapshot.value["number"];
    name = snapshot.value["name"];
    image = snapshot.value["image"];



  }
}