import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertechnicaltask/presenter/presenter.dart';
import 'package:fluttertechnicaltask/utils/DatabaseUtils.dart';
import 'package:fluttertechnicaltask/viewmodel/contacts.dart';
import 'package:fluttertechnicaltask/viewmodel/friends.dart';
import 'package:fluttertechnicaltask/viewmodel/last_payment.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {

  bool _anchorToBottom = false;
  GetDataBaseUtils _dbUtils = GetDataBaseUtils();
  Widget _showContacts(DataSnapshot res){
    Contact contact = Contact.fromSnapshot(res);

    var item = ListTile(
      leading:  new CircleAvatar(
        radius: 20.0,
        child: new Text(contact.suffix),
        backgroundColor: const Color(0xFF20283e),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.number),
      trailing: Icon(Icons.chevron_right),
    );
   return item;
  }
  Widget _showfriends(DataSnapshot res){
   Friends friends = Friends.fromSnapshot(res);
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(friends.image),
      ),
      title: Text(friends.name),
      subtitle: Text(friends.number),
      trailing: Icon(Icons.chevron_right),
    );
  }
  Widget _showLastPayment(DataSnapshot res){
    LastPayment lastPayment = LastPayment.fromSnapshot(res);
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(lastPayment.image),
      ),
      title: Text(lastPayment.name),
      subtitle: Text(lastPayment.number),
      trailing: Icon(Icons.chevron_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title:  Text("Payments",style: TextStyle(color: Colors.black),),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/15,
                 child:Padding(

            padding: EdgeInsets.only(left:10.0,right: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                filled: true,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(
                      Radius.circular(27.0)),

                ),
                border: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(
                      Radius.circular(27.0)),

                ),
              ),
            ),
          ),),

              Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text("Lastest payments",style: TextStyle(color: Colors.grey,fontSize: 18.0),textAlign: TextAlign.left,),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/9.5,
                        child: FirebaseAnimatedList(
                          key: new ValueKey<bool>(_anchorToBottom),
                          query: _dbUtils.getLastPayment(),
                          reverse: _anchorToBottom,
                          sort: _anchorToBottom
                              ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
                              : null,
                          itemBuilder: (BuildContext context, DataSnapshot snapshot,
                              Animation<double> animation, int index) {
                            return new SizeTransition(
                              sizeFactor: animation,
                              child: _showLastPayment(snapshot),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text("Friends List",style: TextStyle(color: Colors.grey,fontSize: 18.0),textAlign: TextAlign.left,),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/9.5,
                      child: FirebaseAnimatedList(
                        key: new ValueKey<bool>(_anchorToBottom),
                        query: _dbUtils.getFriend(),
                        reverse: _anchorToBottom,
                        sort: _anchorToBottom
                            ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
                            : null,
                        itemBuilder: (BuildContext context, DataSnapshot snapshot,
                            Animation<double> animation, int index) {
                          return new SizeTransition(
                            sizeFactor: animation,
                            child: _showfriends(snapshot),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text("Contacts",style: TextStyle(color: Colors.grey,fontSize: 18.0),textAlign: TextAlign.left,),
              ),
              Expanded(
                child: FirebaseAnimatedList(
                  key: new ValueKey<bool>(_anchorToBottom),
                  query: _dbUtils.getContact(),
                  reverse: _anchorToBottom,
                  sort: _anchorToBottom
                      ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
                      : null,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    return new SizeTransition(
                      sizeFactor: animation,
                      child: _showContacts(snapshot),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
