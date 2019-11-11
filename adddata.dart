import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {


  TextEditingController controllernama  = new TextEditingController();
  TextEditingController controlleralamat  = new TextEditingController();


  void addData(){
    var url="http://adityo.xyz/api/testing_add.php";

    http.post(url, body: {
      "nama": controllernama.text,
      "alamat": controlleralamat.text,

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.purpleAccent,
        title: new Text("Tambah Data"),
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
                  child: new Text("ADD DATA",style: TextStyle(color: Colors.white),),
                  color: Colors.purpleAccent,
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
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
