import 'package:flutter/material.dart';
import 'package:listcognitoidentity/services/awsuserpool.dart';
import 'package:listcognitoidentity/services/userservice.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:amazon_cognito_identity_dart/sig_v4.dart';
import 'package:listcognitoidentity/User.dart';
import 'package:listcognitoidentity/services/getuservalue.dart';
import 'package:listcognitoidentity/confirmation.dart';
import 'package:listcognitoidentity/services/storage.dart';

class Thread extends StatefulWidget {
  Thread({Key key, this.email}) : super(key: key);
  // Setup endpoints here:



  final String email;

  @override
  _ThreadState createState() => _ThreadState();

}

class _ThreadState extends State<Thread> {
  final _userService = new UserService(userPool);
  AwsSigV4Client _awsSigV4Client;
  User _user = new User();
  Counter _counter = new Counter(0);
  bool _isAuthenticated = false;

  static const _region = 'us-east-2';
  static const _endpoint =
      'https://iparafin.auth.us-east-2.amazoncognito.com';

  Future<UserService> _getValues(BuildContext context) async {
    try {
      await _userService.init();
      _isAuthenticated = await _userService.checkAuthenticated();
      if (_isAuthenticated) {
        // get user attributes from cognito
        _user = await _userService.getCurrentUser();

        // get session credentials
        final credentials = await _userService.getCredentials();
        _awsSigV4Client = new AwsSigV4Client(
            credentials.accessKeyId, credentials.secretAccessKey, _endpoint,
            region: _region, sessionToken: credentials.sessionToken);
      }
      return _userService;
    } on CognitoClientException catch (e) {
      if (e.code == 'NotAuthorizedException') {
        await _userService.signOut();
        Navigator.pop(context);
      }
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: _getValues(context),
        builder: (context, AsyncSnapshot<UserService> snapshot) {
          if (snapshot.hasData) {
            if (!_isAuthenticated) {
              return new Thread();
            }

            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Secure Counter'),
              ),
              body: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      'Welcome ${_user.name}!',
                      style: Theme.of(context).textTheme.display1,
                    ),
                    new Divider(),
                    new Text(
                      'You have pushed the button this many times:',
                    ),
                    new Text(
                      '${_counter.count}',
                      style: Theme.of(context).textTheme.display1,
                    ),
                    new Divider(),
                    new Center(
                      child: new InkWell(
                        child: new Text(
                          'Logout',
                          style: new TextStyle(color: Colors.blueAccent),
                        ),
                        onTap: () {
                          _userService.signOut();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return new Scaffold(
              appBar: new AppBar(title: new Text('Loading...')));
        });
  }
}