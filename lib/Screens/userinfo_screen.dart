import 'package:flutter/material.dart';
import 'package:technology/Screens/useredit_form.dart';
import 'package:technology/widgets/userinfoupdateless.dart';
import '../models/userinfo.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserEditForm()),
                        ).then((value) {
                          setState(() {});
                        });
                      }),
                ],
              ),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(myMap['imgurl']),
                ),
                SizedBox(width: 20),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        myMap['fullname'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            letterSpacing: 1),
                      ),
                      Text(
                        myMap['profession'],
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            )),
            SizedBox(height: 30),
            Container(
              height: 65,
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.phone),
                      Text(myMap['phonenumber'])
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.email),
                      Text(myMap['email'].toString())
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
              child: Divider(color: Colors.black54),
            ),
            UserInfoUpdateless()
          ],
        ),
      ),
    );
  }
}
