import 'package:flutter/material.dart';
import 'package:listcognitoidentity/loading.dart';
import 'package:listcognitoidentity/home.dart';
import 'package:listcognitoidentity/singup.dart';
import 'package:listcognitoidentity/detail.dart';
import 'package:listcognitoidentity/login.dart';
import 'package:listcognitoidentity/thread.dart';
import 'package:listcognitoidentity/confirmation.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/signup' : (context) => SignUpScreen(),
    '/confirm' : (context) => ConfirmationScreen(),
    '/login' : (context) => LoginScreen(),
    '/thread' : (context) => Thread(),
    '/detail' : (context) => Detail(),
  },
));

