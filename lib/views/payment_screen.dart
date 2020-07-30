import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertechnicaltask/presenter/presenter.dart';
import 'package:fluttertechnicaltask/utils/DatabaseUtils.dart';
import 'package:fluttertechnicaltask/utils/dialogUtils.dart';
import 'package:fluttertechnicaltask/viewmodel/payments.dart';
import 'package:fluttertechnicaltask/views/contact_list_screen.dart';
import 'package:fluttertechnicaltask/views/view.dart';
import 'package:image_picker/image_picker.dart';


class PaymentScreen extends StatefulWidget {
  final AppPresenter presenter;

  PaymentScreen(this.presenter, {Key key, this.title}) : super(key: key);
  final String title;
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>  implements View{

  GetDialogUtils _dialogUtils = GetDialogUtils();
  var _name;
  var _number;
  var _status;
  var _message;
  var _money;
  var _time;
  var _image;
  var _day;

  @override
  void initState() {
    super.initState();
    this.widget.presenter.screenView = this;
    this.widget.presenter.onScreenStart(true);
  }

  Widget checkNullData(){
    if(_name == null ){
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }else{

      return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.grey[200],
              elevation: 0,
              leading: Icon(
                Icons.arrow_back,color: Colors.black54,
              ),
              centerTitle: true,
              title: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(_status,style: TextStyle(fontSize: 14,color: Colors.black54),),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("$_day ,$_time",style: TextStyle(fontSize: 12,color: Colors.black54),),
                ],
              )
          ),
          body: Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),

                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 1.50,
                      child: GestureDetector(
                        onTap:() => _dialogUtils.pickImage(context),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(_image),
                        ),
                      )
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(_name,style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,),
                SizedBox(
                  height: 10.0,
                ),
                Text(_money,style: TextStyle(fontSize: 30,color: Colors.grey[400]),textAlign: TextAlign.center,),
                SizedBox(
                  height: 10.0,
                ),
                Text(_message,style: TextStyle(fontSize: 20,color: Colors.grey),textAlign: TextAlign.center,),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(50.0)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Icon(
                                  Icons.clear,
                                  size: 30.0,
                                  color: Colors.blueAccent,
                                ),
                              ),

                            ),
                            Text("Decline",style: TextStyle(fontSize: 18,color: Colors.blueAccent),textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap:(){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context)=>ContactListScreen()
                                ));
                              },
                              child: Container(
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(50.0)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Icon(
                                    Icons.done,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                ),

                              ),
                            ),
                            Text("Send",style: TextStyle(fontSize: 18,color: Colors.blueAccent),textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200]
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                        child: ListTile(
                          leading: Text("Phone:",style: TextStyle(fontSize: 20,color: Colors.grey)),
                          trailing: Text(_number,style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child:Text("Something wrong? Get help!",style: TextStyle(fontSize: 20,color: Colors.blueAccent),textAlign: TextAlign.center,),
                      ),
                      SizedBox(
                        height: 30.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return checkNullData();
  }

  @override
  void getPayments(String name, String number, String image, String money, String status, String time, String day, String message) {

    setState(() {
      _name = name;
      _image = image;
      _day = day;
      _time = time;
      _status = status;
      _message = message;
      _money = money;
      _number = number;
      var t =_name;
      print("MVP Name: .... $t");
    });

    


  }
}
