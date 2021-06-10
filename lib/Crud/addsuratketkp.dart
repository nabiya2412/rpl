import 'package:flutter/material.dart';
import 'package:flutter_app_prjk/suratketkp.dart';
import 'package:http/http.dart' as http;
class AddSuratKetKP extends StatefulWidget {
  AddSuratKetKP({Key key, @required this.title,this.list,this.index}) : super(key: key);
  final String title;
  final List list;
  final int index;
  @override
  _AddSuratKetKPState createState() => _AddSuratKetKPState(title);
}

class _AddSuratKetKPState extends State<AddSuratKetKP> {
  List<String> semester=["Genap", "Ganjil"];
  String _semester="Ganjil";
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final _formKey = GlobalKey<FormState>();
  _AddSuratKetKPState(this.title);

  TextEditingController controllerSemester = new TextEditingController();
  TextEditingController controllerTahun = new TextEditingController();
  TextEditingController controllerNim = new TextEditingController();
  TextEditingController controllerLembaga = new TextEditingController();
  TextEditingController controllerPimpinan = new TextEditingController();
  TextEditingController controllerNoTelp = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();
  TextEditingController controllerFax = new TextEditingController();
  TextEditingController controllerStatus = new TextEditingController();
  TextEditingController controllerDokumen = new TextEditingController();

  void AddSuratKetKP(){
    var url="http://192.168.12.35/baru/addsurat.php";

    http.post(url, body: {
      "semester": controllerSemester.text,
      "tahun": controllerTahun.text,
      "nim": controllerNim.text,
      "lembaga": controllerLembaga.text,
      "pimpinan": controllerPimpinan.text,
      "notelp": controllerNoTelp.text,
      "alamat": controllerAlamat.text,
      "fax": controllerFax.text,
      "status": controllerStatus.text,
      "dokumen": controllerDokumen.text,
    });
  }

  void pilihSemester(String value){
    setState(() {
      _semester=value;
    });
  }
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    if(widget.index != null){

      controllerSemester.text = widget.list[widget.index]['semester'];
      controllerTahun.text = widget.list[widget.index]['tahun'];
      controllerNim.text = widget.list[widget.index]['nim'];
      controllerLembaga.text = widget.list[widget.index]['lembaga'];
      controllerPimpinan.text = widget.list[widget.index]['pimpinan'];
      controllerNoTelp.text = widget.list[widget.index]['notelp'];
      controllerAlamat.text = widget.list[widget.index]['alamat'];
      controllerFax.text = widget.list[widget.index]['fax'];
      controllerStatus.text = widget.list[widget.index]['status'];
      controllerDokumen.text = widget.list[widget.index]['dokumen'];
    }

  }


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

              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              TextFormField(
                controller: controllerTahun,
                decoration: new InputDecoration(
                  hintText: "2020-2021",
                  labelText: "Tahun",
                  icon: Icon(Icons.date_range),
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
                controller: controllerNim,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Nim",
                  icon: Icon(Icons.account_circle_rounded),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              TextFormField(
                controller: controllerLembaga,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Lembaga",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              TextFormField(
                controller: controllerPimpinan,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Pimpinan",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                controller: controllerNoTelp,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "No Telpon",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                controller: controllerAlamat,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Alamat",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                controller: controllerFax,
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
                  SuratKetKP();
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