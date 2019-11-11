import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './Detail.dart';
import './adddata.dart';

void main() {
  runApp(new MaterialApp(
    title: "My Store",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    final response = await http.get("http://adityo.xyz/api/testing_getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.purpleAccent,
        title: new Text("C R U D"),
      ),

      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.purpleAccent,

        child: new Icon(
          Icons.add),
        onPressed: ()=>Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new AddData(),
            )
        ),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
            list: snapshot.data,
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context)=> new Detail(list:list , index: i,)
                )
            ),
            child: new Card(

              child: new ListTile(
                title: new Text(list[i]['nama']),
                leading: new Icon(Icons.person,color: Colors.pinkAccent,),
                subtitle: new Text("Alamat: ${list[i]['alamat']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
