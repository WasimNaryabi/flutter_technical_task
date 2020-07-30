import 'package:firebase_database/firebase_database.dart';
class Contact{
  String name;
  String number;
  String suffix;

  Contact({this.number,this.name, this.suffix});

  Contact.fromSnapshot(DataSnapshot snapshot){

    number = snapshot.value["number"];
    name = snapshot.value["name"];
    suffix = snapshot.value["suffix"];

    toJson(){
      return{
        "number":number,
        "name":name,
        "suffix":suffix,
      };
    }
  }




}