import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
Future<List> pengajuankp() async{
   final response= await http.get("http://192.168.12.35/baru/pengajuankp.php");
   return json.decode(response.body);
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:  new AppBar(title: new Text("Data "),),
        body: new FutureBuilder<List>(
          future:pengajuankp(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ItemList(list: snapshot.data,)
                : new Center(child: new CircularProgressIndicator(),);
          },
      ),
    );
  }}
class ItemList extends StatelessWidget{
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: list==null ? 0: list.length,
      itemBuilder: (context, i){
        return new Text(list[i]['nim']);
      },
    );
}
}