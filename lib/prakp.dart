import 'package:flutter/material.dart';





class PraKP extends StatefulWidget {
  PraKP({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _PraKPState createState() => _PraKPState(title);
}

class _PraKPState extends State<PraKP> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _PraKPState(this.title);
  bool isLoading = false;
  List<String> semester=["Genap", "Ganjil"];
  String _semester="Ganjil";
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }
  void pilihSemester(String value){
    setState(() {
      _semester=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Pra KP"),
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
                  labelText: "Tools",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Dosen Penguji",
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
                  labelText: "Alamat",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Status",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
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

