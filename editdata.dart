import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class EditData extends StatefulWidget {
  List list;
  int index;
  EditData({this.list,this.index});


  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {


  TextEditingController controllernama ;
  TextEditingController controlleralamat ;

  void editData() {
    var url="http://adityo.xyz/api/testing_edit.php";
    http.post(url,body: {
      "id": widget.list[widget.index]['id'],
      "nama": controllernama.text,
      "alamat": controlleralamat.text,

    });
  }

  void initState() {
    controllernama= new TextEditingController(text: widget.list[widget.index]['nama']);
    controlleralamat= new TextEditingController(text: widget.list[widget.index]['alamat']);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.purpleAccent,
        title: new Text("Edit Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllernama,
                  decoration: new InputDecoration(
                      hintText: "nama", labelText: "nama"),
                ),
                new TextField(
                  controller: controlleralamat,
                  decoration: new InputDecoration(
                      hintText: "alamat", labelText: "alamat"),
                ),

                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("EDIT DATA",style: TextStyle(color: Colors.white),),
                  color: Colors.purpleAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context)=>new Home()
                        )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
