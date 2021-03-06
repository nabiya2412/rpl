import 'dart:convert';
import 'file:///F:/Rpl_project/flutter_app_prjk/lib/Crud/adddosen.dart';
import 'package:flutter_app_prjk/Mahasiswa.dart';
import 'package:flutter_app_prjk/detailmhs.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
//import 'dart:html';
//import './Detail.dart';

class Dosen extends StatefulWidget {
  Dosen({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _DosenState createState() => _DosenState(title);
}

class _DosenState extends State<Dosen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  bool isLoading = false;
  Dosen dsn = new Dosen();
  _DosenState(this.title);

  void initState() {
    super.initState();
  }
  Future<List> read() async  {
    final response= await http.get("http:192.168.12.35/baru/read.php");
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
                MaterialPageRoute(builder: (context)=> AddDosen(title :"Input Data Dosen")),
                //then(onGoBack);
              );
            },
          ),
        ],
      ),
      body: new FutureBuilder<List>(
        future:read(),
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
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context)=>  new DetailMhs(list:list , index: i,)
                )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['id_dosen']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Nik : ${list[i]['nik']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}

