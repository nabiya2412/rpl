import 'package:flutter/material.dart';

class DaftarRegis extends StatefulWidget {
  DaftarRegis({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _DaftarRegisState createState() => _DaftarRegisState(title);
}

class _DaftarRegisState extends State<DaftarRegis> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;

  _DaftarRegisState(this.title);

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
        title: Text("Input Daftar Registrasi KP"),
      ),
    );
  }
}