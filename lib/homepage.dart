
import 'package:flutter/material.dart';
import 'package:flutter_app_prjk/jadwalkp.dart';
import 'package:flutter_app_prjk/kp.dart';
import 'package:flutter_app_prjk/mahasiswa.dart';
import 'package:flutter_app_prjk/main.dart';
import 'package:flutter_app_prjk/prakp.dart';
import 'package:flutter_app_prjk/suratketkp.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  final String nama, email, foto;
  HomePage({this.nama, this.email, this.foto, this.title});
  final String title;
  @override
  _HomePageState createState() => _HomePageState();

  Future<HomePage> fromJson(decode) {}
 }

class _HomePageState extends State<HomePage> {

  Future<void> _signOut() async {
    await GoogleSignIn().signOut();

    Navigator.pushReplacement(context,
        MaterialPageRoute(
            builder: (context) => Login()
        )
    );
  }
  //Future<List> getData() async{

  //}

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
                 accountEmail: Text("nabiya.eltarani@si.ukdw.ac.id"),
                 currentAccountPicture: CircleAvatar(
                   backgroundColor: Colors.orange,
                   child: Text(
                     "NE",
                     style: TextStyle(fontSize: 40.0),
                   ),
                 ),
               ),

                     ListTile(
                       title: Text("Surat Keterangan KP"),
                       trailing: Icon(Icons.people),
                       subtitle: Text("Surat Keterangan KP"),
                       onTap: (){
                         Navigator.pop(context);
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => SuratKetKP(title: "Surat Keterangan KP")),
                         );
                       },
                     ),
                     ListTile(
                       title: Text("Pengajuan PraKP"),
                       trailing: Icon(Icons.add_box_outlined),
                       subtitle: Text("Pengajuan PraKP"),
                       onTap: (){
                         Navigator.pop(context);
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => PraKP(title: "Pengajuan PraKP")),
                         );
                       },
                     ),
                     ListTile(
                       title: Text("Pengajuan KP"),
                       trailing: Icon(Icons.add_box_outlined),
                       subtitle: Text("Pengajuan KP"),
                       onTap: (){
                         Navigator.pop(context);
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => KP(title: "Pengajuan KP")),
                         );
                       },
                     ),
                     ListTile(
                       title: Text("Jadwal KP"),
                       trailing: Icon(Icons.add_box_outlined),
                       subtitle: Text("Jadwal KP"),
                       onTap: (){
                         Navigator.pop(context);
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => JadwalKP(title: "Jadwal KP")),
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
                      MaterialPageRoute(builder: (context) => Login(title: "Logout")),
                  );
                },
             ),

                 ],
                ),
               ),

    //menu dashboard
         //body: Container(
           ////padding: EdgeInsets.all(30.0),
           //child:
            ///GridView.count(crossAxisCount: 2,
             //children: <Widget> [
             //Card(
              //margin: EdgeInsets.all(8.0),
               //child: InkWell(
                 //onTap: () {
                 //Navigator.push(
                 //context,
                 //MaterialPageRoute(builder: (context) => Mahasiswa(title: "Data Mahasiswa"))
                //);
                //},
                ///splashColor: Colors.orangeAccent,
                 //child: Center(
                  //child: Column(
                   //mainAxisSize: MainAxisSize.min,
                   //children: <Widget>[
                    //Icon(Icons.book, size:70.0,),
                    //Text("Data Mahasiswa", style: new TextStyle(fontSize: 17.0))
               //],
             // ),
             //),
            // ),
            // ),
            //  ],
              //  ),
               //   ),

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

