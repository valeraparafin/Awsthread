import 'package:amazon_cognito_identity_dart/cognito.dart';

// Setup AWS User Pool Id & Client Id settings here:
const _awsUserPoolId = 'us-east-2_Czjgl0Fgp';
const _awsClientId = '32q5k85bj8ntnto0doje726nrr';
// Setup endpoints here:
const _region = 'us-east-2';
const _endpoint =
    'https://iparafin.auth.us-east-2.amazoncognito.com';

final userPool = new CognitoUserPool(_awsUserPoolId, _awsClientId);