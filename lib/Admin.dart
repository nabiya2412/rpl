import 'package:flutter/material.dart';
import 'file:///F:/Rpl_project/flutter_app_prjk/lib/Crud/addadmin.dart';
import 'file:///F:/Rpl_project/flutter_app_prjk/lib/Crud/addmhs.dart';

class Admin extends StatefulWidget {
  Admin({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _AdminState createState() => _AdminState(title);
}

class _AdminState extends State<Admin> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  bool isLoading = false;
  Admin adn = new Admin();
  _AdminState(this.title);


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> AddAdmin(title :"Input Data Admin")),
                //then(onGoBack);
              );
            },
          ),
        ],
      ),
    );


  }
}
