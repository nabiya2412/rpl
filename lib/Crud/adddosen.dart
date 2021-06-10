import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AddDosen extends StatefulWidget {
  AddDosen({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _AddDosenState createState() => _AddDosenState(title);
}

class _AddDosenState extends State<AddDosen> {

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final _formKey = GlobalKey<FormState>();

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerNik = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();


  void addDosen(){
    var url="http://192.168.12.35/baru/adddosen.php";

    http.post(url, body: {
       "nama": controllerNama.text,
       "nik_dosen": controllerNik.text,
       "email": controllerEmail.text,

    });
  }
  _AddDosenState(this.title);

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Dosen"),
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
                controller: controllerNama,
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
              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              TextFormField(
                controller: controllerNik,
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
                controller: controllerEmail,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Email",
                  icon: Icon(Icons.email_outlined),
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
                  addDosen();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}