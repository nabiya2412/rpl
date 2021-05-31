import 'package:flutter/material.dart';

class Verifikasi extends StatefulWidget {
  Verifikasi({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _VerifikasiState createState() => _VerifikasiState(title);
}

class _VerifikasiState extends State<Verifikasi> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _VerifikasiState(this.title);
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
        title: Text("Input Pengajuan KP"),
      ),
    );
  }}
