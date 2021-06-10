import 'dart:convert';
import 'package:flutter_app_prjk/Crud/addkp.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class KP extends StatefulWidget {
  KP({Key key, @required this.title}) : super(key: key);
  final String title;
  @override
  _KPState createState() => new _KPState(title);
}

class _KPState extends State<KP> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  bool isLoading = false;
  KP stk = new KP();

  _KPState(this.title);



  void initState() {
    super.initState();
  }
  Future<List> getDatavr() async  {
    var url = 'http://192.168.12.35/baru/getdatavr.php';
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
                MaterialPageRoute(builder: (context)=> AddKP(title :"Input Data Pengajuan n KP")),
                //then(onGoBack);
              );
            },
          ),
        ],
      ),
      body: new FutureBuilder<List>(
        future: getDatavr() ,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddKP(),),);
                      debugPrint('Edit Clicked');
                    },),
                  title: Text(list[index]['nim']),
                  subtitle: Text(list[index]['semester']),
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
