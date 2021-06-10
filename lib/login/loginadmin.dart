import 'package:flutter/material.dart';
import 'package:flutter_app_prjk/Admin.dart';
import 'package:flutter_app_prjk/dashboardadmin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAdmin extends StatefulWidget {
  LoginAdmin({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _LoginAdminState createState() => _LoginAdminState(title);
}

class _LoginAdminState extends State<LoginAdmin> {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String username, password;
  bool showPassword = false;
  final String title;

  _LoginAdminState(this.title);
  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if (isLogin == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboardadmin(title: "Home",)),
      );
    }
  }

  @override
  void initState() {
    navigateLogin();
  }

  Future<void> _signIn() async {
    final googleUser = await GoogleSignIn().signIn();

    ////print(googleUser.email);
    Navigator.pushReplacement(context,
        MaterialPageRoute(
            builder: (context) => Dashboardadmin(nama: googleUser.displayName, email: googleUser.email, foto: googleUser.photoUrl,)
        ));
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
                    Text("Login Sebagai Admin", style: TextStyle(color: Colors.white, fontSize: 40),),
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
                                        MaterialPageRoute(builder: (context) =>Dashboardadmin(title: "Halaman Login",)),
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