import 'package:flutter/material.dart';

class DaftarBimbingan extends StatefulWidget {
  DaftarBimbingan({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _DaftarBimbinganState createState() => _DaftarBimbinganState(title);
}

class _DaftarBimbinganState extends State<DaftarBimbingan> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;

  _DaftarBimbinganState(this.title);

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
        title: Text("Daftar Bimbingan KP"),
      ),
    );
  }
}