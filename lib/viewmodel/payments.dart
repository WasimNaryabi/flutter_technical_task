import 'package:firebase_database/firebase_database.dart';
class Payments{
  String _name;
  String _number;
  String _image;
  String _money;
  String _status;
  String _time;
  String _day;
  String _message;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get number => _number;

  set number(String value) {
    _number = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get money => _money;

  set money(String value) {
    _money = value;
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  String get time => _time;

  set time(String value) {
    _time = value;
  }

  String get day => _day;

  set day(String value) {
    _day = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }
}