import 'package:flutter/material.dart';

import 'package:fluttertechnicaltask/views/payment_screen.dart';

import 'presenter/presenter.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Technical Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentScreen(new Presenter()),
    );
  }
}

