import 'package:flutter/material.dart';
import 'package:listcognitoidentity/services/awsuserpool.dart';
import 'package:listcognitoidentity/services/userservice.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:amazon_cognito_identity_dart/sig_v4.dart';
import 'package:listcognitoidentity/User.dart';
import 'package:listcognitoidentity/confirmation.dart';
import 'package:listcognitoidentity/services/storage.dart';

const _region = 'us-east-2';
const _endpoint =
    'https://iparafin.auth.us-east-2.amazoncognito.com';

AwsSigV4Client _awsSigV4Client;
User _user = new User();
Counter _counter = new Counter(0);
bool _isAuthenticated = false;
UserService _userService;

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