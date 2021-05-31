import 'package:flutter/material.dart';

class BatasPelKP extends StatefulWidget {
  BatasPelKP({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _BatasPelKPState createState() => _BatasPelKPState(title);
}

class _BatasPelKPState extends State<BatasPelKP> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _BatasPelKPState(this.title);
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Batas Pelaksanaan KP"),
      ),
    );
  }}