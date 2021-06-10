import 'package:flutter/material.dart';
import 'package:flutter_app_prjk/Admin.dart';
import 'package:flutter_app_prjk/bataspelkp.dart';
import 'package:flutter_app_prjk/daftarbimbingan.dart';
import 'package:flutter_app_prjk/daftarregis.dart';
import 'package:flutter_app_prjk/dosen.dart';
import 'package:flutter_app_prjk/jadwalujian.dart';
import 'package:flutter_app_prjk/main.dart';
import 'package:flutter_app_prjk/verifikasi.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardDosen extends StatefulWidget {
  final String nama, email, foto;
  final String title;
  DashboardDosen({this.nama, this.email, this.foto, this.title});
  @override
  _DashboardDosenState createState() => _DashboardDosenState(title);
}

class _DashboardDosenState extends State<DashboardDosen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  Future<void> _signOut() async {
    await GoogleSignIn().signOut();

    Navigator.pushReplacement(context,
        MaterialPageRoute(
            builder: (context) => Login()
        )
    );
  }
  _DashboardDosenState(this.title);

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Nabiya Eltarani"),
                accountEmail: Text("nabiya.eltarani@staff.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    "NE",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),

              ListTile(
                title: Text("Daftar Bimbingan KP"),
                trailing: Icon(Icons.people),
                subtitle: Text("Daftar Bimbingan KP"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DaftarBimbingan(title: "Daftar Bimbingan KP")),
                  );
                },
              ),
              ListTile(
                title: Text("Jadwal Ujian"),
                trailing: Icon(Icons.schedule_outlined),
                subtitle: Text("Jadwal Ujian"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JadwalUjian(title: "Jadwal Ujian")),
                  );
                },
              ),
              ListTile(
                title: Text("Verifikasi"),
                trailing: Icon(Icons.arrow_right),
                subtitle: Text("Verifikasi Pra KP"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Verifikasi(title: "Status KP")),
                  );
                },
              ),
              ListTile(
                title: Text("Jadwal Ujian"),
                trailing: Icon(Icons.add_box_outlined),
                subtitle: Text("Jadwal Ujian"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JadwalUjian(title: "Jadwal Ujian")),
                  );
                },
              ),
              Divider(
                color: Colors.black87,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                title: Text("logout"),
                trailing: Icon(Icons.exit_to_app),
                onTap: () async {
                  SharedPreferences pref = await SharedPreferences
                      .getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),

            ],
          ),
        ),

        //menu dashboard
        body: Container(
          padding: EdgeInsets.all(30.0),
          child:
          GridView.count(crossAxisCount: 2,
            children: <Widget> [
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dosen(title: "Data Dosen"))
                    );
                  },
                  splashColor: Colors.orangeAccent,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.book, size:70.0,),
                        Text("Data Dosen", style: new TextStyle(fontSize: 17.0))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        appBar: AppBar(
          title: Text('SIKP 2021'),
          backgroundColor: Colors.orange[700],
        ),
        backgroundColor: Colors.orangeAccent[100],
        //]body: Container(
        //decoration: BoxDecoration(),
        //child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //c/rossAxisAlignment: CrossAxisAlignment.center,
        //children: <Widget>[
        //Container(
        //width: 150,
        //height: 150,
        //decoration: BoxDecoration(
        // color: Colors.orange,
        //shape:BoxShape.circle,
        //image: DecorationImage(
        //  image: NetworkImage(widget.foto),
        //fit: BoxFit.cover
        // ),
        //),
        ///),
        //SizedBox(height: 20,),
        //Text("Anda Login Sebagai : ${widget.nama}", style: TextStyle(fontSize: 18),),
        //SizedBox(height: 20,),
        //Text("Email Anda : ${widget.email}", style: TextStyle(fontSize: 18),),
        //SizedBox(height: 20,),

        //ElevatedButton(
        //onPressed: (){
        // _signOut();
        // },
        // child: Text("Keluar"),
        // ),
        // ],
        // ),

        // ),

      ),
    );
  }
}

