

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
//import 'http/http.dart' as http;
class SuratKetKP extends StatefulWidget {
  SuratKetKP({Key key, @required this.title}) : super(key: key);
  final String title;
  @override
  _SuratKetKPState createState() => new _SuratKetKPState(title);
}

class _SuratKetKPState extends State<SuratKetKP> {
  List<String> semester=["Genap", "Ganjil"];
  String _semester="Ganjil";
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final _formKey = GlobalKey<FormState>();


  _SuratKetKPState(this.title);
  void pilihSemester(String value){
    setState(() {
      _semester=value;
    });
  }
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Surat Keterangan KP"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
// TextField(),
              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              new Row(
                children: <Widget>[
                  new Text("Semester", style: new TextStyle(fontSize: 20.0,color: Colors.blue),),
                  new DropdownButton(
                    onChanged: (String value) {
                      pilihSemester(value);
                    },
                    value: _semester,
                    items: semester.map((String value){
                      return new DropdownMenuItem(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "2021",
                  labelText: "Tahun",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),

              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Nim",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Lembaga",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Pimpinan",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "No Telpon",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Alamat",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Fax",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Dokumen",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              SizedBox(
                height: 15,
              ),



              ElevatedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),

                ),
                //color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

