import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_prjk/dashboardadmin.dart';
import 'package:flutter_app_prjk/dashboarddosen.dart';
import 'package:flutter_app_prjk/homepage.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPL',
      theme: ThemeData(
      ),
      home: Login(),
    );
  }
}
class Login extends StatefulWidget {
  Login({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState(title);
}

class _LoginState extends State<Login> {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String username, password;
  bool showPassword = false;
  final String title;

  _LoginState(this.title);


  Future<void> _signIn() async {
    final googleUser = await GoogleSignIn().signIn();

    ////print(googleUser.email);

      if(googleUser != null && googleUser.email.contains("si.ukdw.ac.id")){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomePage(nama: googleUser.displayName, email: googleUser.email, foto: googleUser.photoUrl,))
        );
      } else if(googleUser != null && googleUser.email.contains("gmail.com")){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Dashboardadmin(nama: googleUser.displayName, email: googleUser.email, foto: googleUser.photoUrl,))
        );
      } else if(googleUser != null && googleUser.email.contains("students.ukdw.ac.id")){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashboardDosen(nama: googleUser.displayName, email: googleUser.email, foto: googleUser.photoUrl,))
        );
      }
    }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400],
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Silahkan Login ", style: TextStyle(color: Colors.white, fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("SIKP 2021", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60),),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60,),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                                color: Color.fromRGBO(225, 100, 27, 3),
                                blurRadius: 20,
                                offset: Offset(0, 15)
                            )]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Masukkan Email",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,

                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                              ),
                              child: TextField(
                                obscureText: true,
                                controller: myPasswordController,
                                decoration: new InputDecoration(
                                  icon: const Icon(Icons.lock),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(20.0)
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      Text("Forgot Password!", style: TextStyle(color: Colors.grey),),
                      SizedBox(height: 40,),
                      Container(
                        // height: 50,
                        ////margin: EdgeInsets.symmetric(horizontal: 50),
                        ////decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(50),
                          color: Colors.orange[900]
                        // ),
                        //validator: (value) {
                        // if (value.isEmpty){
                        ///return 'Password Tidak Boleh Kosong';
                        //  }
                        // return null;
                        // },
                      ),
                      //child: Center(
                      //child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                      ElevatedButton(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        //color: Colors.black87,
                        onPressed: () async {
                          SharedPreferences pref = await SharedPreferences.getInstance();
                          await pref.setInt("is_login", 1);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>DashboardDosen(title: "Halaman Login",)),
                          );
                          _formKey.currentState.save();
                        },
                      ),
                      // SizedBox(height: 40,),
                      //Text("Login Dengan Google", style: TextStyle(color: Colors.grey),),
                      Row(
                        children: <Widget>[
                          SizedBox(height: 30,),

                          ElevatedButton(
                            child: Text(" Google"),
                            onPressed: (){
                              _signIn();
                              Expanded(
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue
                                  ),
                                  child: Center(
                                    child: Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  ),

                                ),
                              );
                            },
                          ),


                         ElevatedButton(
                           child: Text(
                          "LoginDsn",
                           style: TextStyle(color: Colors.white),
                           ),
                //color: Colors.black87,
                           onPressed: () async {
                           SharedPreferences pref = await SharedPreferences.getInstance();
                           await pref.setInt("is_login", 1);
                           Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(builder: (context) =>DashboardDosen(title: "Halaman Login",)),
                          );
                          _formKey.currentState.save();
                           },
                          ),
                           ElevatedButton(
                             child: Text(
                            "LoginAd",
                            style: TextStyle(color: Colors.white),
                            ),
                //color: Colors.black87,
                            onPressed: () async {
                            SharedPreferences pref = await SharedPreferences.getInstance();
                            await pref.setInt("is_login", 1);
                            Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>Dashboardadmin(title: "Halaman Login",)),
                           );
                           _formKey.currentState.save();
                          },
                         ),
                         ElevatedButton(
                           child: Text(
                           "Login",
                           style: TextStyle(color: Colors.white),
                           ),
                //color: Colors.black87,
                           onPressed: () async {
                           SharedPreferences pref = await SharedPreferences.getInstance();
                           await pref.setInt("is_login", 1);
                            Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(builder: (context) =>HomePage(title: "Halaman Login",)),
                         );
                          _formKey.currentState.save();
                      },
                    ),

            ],
          ),
    ],
        ),
      ),
    ),
    ),
    ],
    ),
      ),
    );
  }
}