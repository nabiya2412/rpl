

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_prjk/Crud/addsuratketkp.dart';
//import 'http/http.dart' as http;
class SuratKetKP extends StatefulWidget {
  SuratKetKP({Key key, @required this.title}) : super(key: key);
  final String title;
  @override
  _SuratKetKPState createState() => new _SuratKetKPState(title);
}

class _SuratKetKPState extends State<SuratKetKP> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  bool isLoading = false;
  SuratKetKP stk = new SuratKetKP();

  _SuratKetKPState(this.title);



  void initState() {
    super.initState();
  }
  Future<List> getData() async  {
    var url = 'http://192.168.12.35/baru/getdatask.php';
    var response = await http.get(url);
    // final response= await http.get("http://192.168.12.35/baru/getdata.php");
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
                MaterialPageRoute(builder: (context)=> AddSuratKetKP(title :"Input Data Pengajuan Surat Keterangan KP")),
                //then(onGoBack);
              );
            },
          ),
        ],
      ),
      body: new FutureBuilder<List>(
        future: getData() ,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                List list = snapshot.data;
                return ListTile(
                  leading: GestureDetector(child: Icon(Icons.edit),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddSuratKetKP(),),);
                      debugPrint('Edit Clicked');
                    },),
                  title: Text(list[index]['nim']),
                  subtitle: Text(list[index]['nama']),
                  trailing: GestureDetector(child: Icon(Icons.delete),
                    onTap: (){
                      setState(() {
                        http.post(Uri.parse("http:/192.168.12.35/baru/read.php"),body: {
                          'nim' : list[index]['nim'],
                        });
                      });
                      debugPrint('delete Clicked');
                    },),
                );
              }
          )
              : CircularProgressIndicator();
        },
      ),
    );
  }
}
