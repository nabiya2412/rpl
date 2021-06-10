import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'file:///F:/Rpl_project/flutter_app_prjk/lib/Crud/addmhs.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DataDiri(),
    );
  }
}
class DataDiri extends StatefulWidget {
  @override
  _DataDiri createState() => _DataDiri();
}

class _DataDiri extends State<DataDiri> {


  Future getData()async{
    var response = await http.get(Uri.parse("http:/192.168.12.35/baru/read.php"));
    return json.decode(response.body);
  }


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Php Mysql Crud'),
      ),

      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                List list = snapshot.data;
                return ListTile(
                  leading: GestureDetector(child: Icon(Icons.edit),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddMhs(),),);
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
