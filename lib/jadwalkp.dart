import 'package:flutter/material.dart';

class JadwalKP extends StatefulWidget {
  JadwalKP({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _JadwalKPState createState() => _JadwalKPState(title);
}

class _JadwalKPState extends State<JadwalKP> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;

  _JadwalKPState(this.title);

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),


    );
  }
}
