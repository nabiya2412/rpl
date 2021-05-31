import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => new _DetailState();
}

  class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['nama']}")),
      body: new Container(
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
               // new Text(widget.list[widget.index]['id_dosen'], style: new TextStyle(fontSize: 20.0),),
                new Text("Nama Dosen : ${widget.list[widget.index]['nama']}", style: new TextStyle(fontSize: 20.0),),
                new Text("Nik : ${widget.list[widget.index]['nik_dosen']}", style: new TextStyle(fontSize: 20.0),),
                new Text("Email : ${widget.list[widget.index]['email']}", style: new TextStyle(fontSize: 20.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ElevatedButton(
                        child: new Text( "EDIT",
                        style: TextStyle(color: Colors.orange),
                ),
                      onPressed: (){},
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new ElevatedButton(
                      child: new Text( "DELETE",
                        style: TextStyle(color: Colors.black87),
                      ),
                      onPressed: (){},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
