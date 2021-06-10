import 'package:flutter/material.dart';

//import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:  Text('LoginPage'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
           // FirebaseAuth.instance.signInWithEmailAndPassword(
              //  email: 'nabiya.eltarani@si.ukdw.ac.id',
                //password: 'Nabiya24');
          },

          child: Text('Login'),
        ),
      ),
    );
  }
}