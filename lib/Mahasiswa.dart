import 'dart:convert';
import 'file:///F:/Rpl_project/flutter_app_prjk/lib/Crud/adddosen.dart';
import 'package:flutter_app_prjk/Crud/addmhs.dart';
import 'package:flutter_app_prjk/Mahasiswa.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
//import 'dart:html';
//import './Detail.dart';

class Mahasiswa extends StatefulWidget {
  Mahasiswa({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _MahasiswaState createState() => _MahasiswaState(title);
}

class _MahasiswaState extends State<Mahasiswa> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  bool isLoading = false;
  Mahasiswa mhs = new Mahasiswa();
  _MahasiswaState(this.title);

  void initState() {
    super.initState();
  }
  Future<List> getData() async  {
    final response= await http.get("http:192.168.12.35/baru/getdata.php");
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
                MaterialPageRoute(builder: (context)=> AddMhs(title :"Input Data Mahasiswa")),
                //then(onGoBack);
              );
            },
          ),
        ],
      ),
      body: new FutureBuilder<List>(
        future: getData() ,
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new DsnList()
              : new Center( child:  new CircularProgressIndicator(),);

        },
      ),
    );


  }
}
class DsnList extends StatelessWidget{
  final List list;
  DsnList({this.list});

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context)=>  new AddMhs(),
                )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nim']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("nama : ${list[i]['nama']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
