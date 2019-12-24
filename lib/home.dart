import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:listcognitoidentity/singup.dart';
import 'package:listcognitoidentity/login.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Colors.white,
      body:
      new SafeArea(
        child: new Padding(
          padding: EdgeInsets.fromLTRB(0, 50.0, 0, 0),
        child: Center(
          child: new Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
           /*     Center(
                  child: Text('Welcome',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                      letterSpacing: 0,
                    ),
                  ),
                ), */

               // SizedBox(height: 30.0),
                Image.asset('lib/assets/avatar.jpg',
                  width: 250.0,
                  height: 250.0,
                ),
                SizedBox(height: 20.0),
                Text('Please login or sign up to continue using our app',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                    letterSpacing: .2,
                  ),
                ),
            SizedBox(height: 30.0),
   /*                   Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new RaisedButton(
                              child: new Text(
                                'Social button area',
                                style: new TextStyle(color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              onPressed: () { //social buttons
                                },
                              color: Colors.blue,
                              padding: EdgeInsets.all(15.0),
                            ),
                          ],
                        ),
*/
           SizedBox(height: 30.0),
           new Container(
             padding:
             new EdgeInsets.only(left: 60.0, right: 60.0, bottom: 20.0),
             width: screenSize.width,
             child: new RaisedButton(
               child: new Text(
                 'Sign Up',
                 style: new TextStyle(color: Colors.white,
                   fontSize: 16.0,
                 ),
               ),
               onPressed: () {
                 Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new SignUpScreen()),
              );
            },
            color: Colors.blue,
            padding: EdgeInsets.all(15.0),
          ),
          ),
                SizedBox(height: 5.0,),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child:
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new LoginScreen()),
                        );
                      },
                      child: Text("Login",
                      style: TextStyle (
                        color: Colors.blue[400],
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        letterSpacing: .5
                      ),
                      ),
                    ),
                  ],
                ),
            ]
          ),
        ),
    ),
      ),
    );
  }
}
