import 'package:flutter/material.dart';

class AddAdmin extends StatefulWidget {
  AddAdmin({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _AddAdminState createState() => _AddAdminState(title);
}

class _AddAdminState extends State<AddAdmin> {
 // List<String> semester=["Genap", "Ganjil"];
 // String _semester="Ganjil";
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final _formKey = GlobalKey<FormState>();

  _AddAdminState(this.title);

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }
  //void pilihSemester(String value){
   //// setState(() {
    //  _semester=value;
   // });
 // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Admin"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
// TextField(),
              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Nik",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nik tidak boleh kosong';
                  }
                  return null;
                },
              ),
              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "contoh: Nabiya Eltarani",
                  labelText: "Nama Lengkap",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
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