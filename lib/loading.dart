import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.grey[200],
      body: Center(
        child: SpinKitCircle(
          color: Colors.blue[600],
          size: 150.0,
          duration: Duration(milliseconds: 5000),
        ),
      ),
    );
  }
}
