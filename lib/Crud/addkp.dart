import 'package:flutter/material.dart';
import 'package:flutter_app_prjk/kp.dart';
import 'package:http/http.dart' as http;

class AddKP extends StatefulWidget {
  AddKP({Key key, @required this.title,this.list,this.index}) : super(key: key);
  final String title;
  final List list;
  final int index;

  @override
  _AddKPState createState() => _AddKPState(title);
}

class _AddKPState extends State<AddKP> {
  List<String> semester=["Genap", "Ganjil"];
  String _semester="Ganjil";
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddKPState(this.title);
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  TextEditingController controllerSemester = new TextEditingController();
  TextEditingController controllerTahun = new TextEditingController();
  TextEditingController controllerJudul_Kp = new TextEditingController();
  TextEditingController controllerNim = new TextEditingController();
  TextEditingController controllerTools = new TextEditingController();
  TextEditingController controllerSpesifikasi = new TextEditingController();
  TextEditingController controllerPenguji = new TextEditingController();
  TextEditingController controllerLembaga = new TextEditingController();
  TextEditingController controllerPimpinan = new TextEditingController();
  TextEditingController controllerNoTelp = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();
  TextEditingController controllerStatus = new TextEditingController();
  TextEditingController controllerDokumen = new TextEditingController();

  void AddKP(){
    var url="http://192.168.12.35/baru/addkp.php";

    http.post(url, body: {
      "semester": controllerSemester.text,
      "tahun": controllerTahun.text,
      "judul_kp": controllerJudul_Kp.text,
      "nim": controllerNim.text,
      "tools": controllerTools.text,
      "spesifikasi": controllerSpesifikasi.text,
      "penguji": controllerPenguji.text,
      "lembaga": controllerLembaga.text,
      "pimpinan": controllerPimpinan.text,
      "notelp": controllerNoTelp.text,
      "alamat": controllerAlamat.text,
      "status": controllerStatus.text,
      "dokumen": controllerDokumen.text,
    });
  }

  void pilihSemester(String value){
    setState(() {
      _semester=value;
    });
  }

  @override
  void initState() {
    super.initState();
    if(widget.index != null){

      controllerSemester.text = widget.list[widget.index]['semester'];
      controllerTahun.text = widget.list[widget.index]['tahun'];
      controllerJudul_Kp.text = widget.list[widget.index]['judul_kp'];
      controllerNim.text = widget.list[widget.index]['nim'];
      controllerSpesifikasi.text = widget.list[widget.index]['spesifikasi'];
      controllerPenguji.text = widget.list[widget.index]['penguji'];
      controllerTahun.text = widget.list[widget.index]['tahun'];
      controllerLembaga.text = widget.list[widget.index]['lembaga'];
      controllerPimpinan.text = widget.list[widget.index]['pimpinan'];
      controllerNoTelp.text = widget.list[widget.index]['notelp'];
      controllerAlamat.text = widget.list[widget.index]['alamat'];
      controllerStatus.text = widget.list[widget.index]['status'];
      controllerDokumen.text = widget.list[widget.index]['dokumen'];
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Pengajuan KP"),
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
                controller: controllerTahun,
                decoration: new InputDecoration(
                  hintText: "2021",
                  labelText: "Tahun",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),

              ),
              TextFormField(
                controller: controllerNim,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Nim",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                controller: controllerJudul_Kp,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Judul KP",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                controller: controllerSpesifikasi,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Spesifikasi",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                controller: controllerTools,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Tools",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                controller: controllerPenguji,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Dosen Penguji",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
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
                controller: controllerStatus,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Status",
                  //icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              TextFormField(
                controller: controllerDokumen,
                decoration: new InputDecoration(
                  hintText: "",
                  labelText: "Dokumen",
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
                  KP();
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