import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'file:///F:/Rpl_project/flutter_app_prjk/lib/Crud/addjadwal.dart';
import 'file:///F:/Rpl_project/flutter_app_prjk/lib/Crud/addmhs.dart';
import 'package:flutter_app_prjk/detailmhs.dart';
import 'package:http/http.dart' as http;
//import 'lib.dart';

class JadwalUjian extends StatefulWidget {
  JadwalUjian({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _JadwalUjianState createState() => _JadwalUjianState(title);
}

class _JadwalUjianState extends State<JadwalUjian> {

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  bool isLoading = false;

  _JadwalUjianState(this.title);

  void initState() {
    super.initState();
  }
  Future<List> getData() async  {
    final response= await http.get("http://10.0.3.2/baru/getdata.php");
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> AddJadwal(title :"Input Jadwal Ujian")),
                //then(onGoBack);
              );
            },
          ),
        ],
    )
    );

  }
}
