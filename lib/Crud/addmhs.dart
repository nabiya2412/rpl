import 'package:flutter/material.dart';
import 'package:flutter_app_prjk/Mahasiswa.dart';
import 'package:http/http.dart' as http;

class AddMhs extends StatefulWidget {
  AddMhs({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _AddMhsState createState() => _AddMhsState(title);
}

class _AddMhsState extends State<AddMhs> {
  List<String> semester=["Genap", "Ganjil"];
  String _semester="Ganjil";
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final _formKey = GlobalKey<FormState>();

  _AddMhsState(this.title);

  TextEditingController controllerNim = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerSemester = new TextEditingController();
  TextEditingController controllerTahun = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();

  void addMhs(){
    var url="http://192.168.12.35/baru/addmhs.php";

    http.post(url, body: {
      "nim": controllerNim.text,
      "nama": controllerNama.text,
      "semester": controllerSemester.text,
      "tahun": controllerTahun.text,
      "email": controllerEmail.text,

    });
  }
  bool isLoading = false;


void pilihSemester(String value){
    setState(() {
      _semester=value;
    });
}
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Mahasiswa"),
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
                controller: controllerNim,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Nim",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nim tidak boleh kosong';
                  }
                  return null;
                },
              ),

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

              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              TextFormField(
                controller: controllerTahun,
                decoration: new InputDecoration(
                  hintText: "2021-2022",
                  labelText: "Tahun",
                  icon: Icon(Icons.date_range),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
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
                  Mahasiswa();
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