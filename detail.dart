import 'package:flutter/material.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.list,this.index});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {

  void deleteData(){
    var url="http://adityo.xyz/api/testing_delete.php";
    http.post(url, body: {
      'id': widget.list[widget.index]['id']
    });
  }

  void confirm (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are You sure want to delete '${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK DELETE!",style: new TextStyle(color: Colors.white),),
          color: Colors.pinkAccent,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context)=> new Home(),
                )
            );
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL",style: new TextStyle(color: Colors.white)),
          color: Colors.blueAccent,
          onPressed: ()=> Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.purpleAccent,
          title: new Text("${widget.list[widget.index]['nama']}")

      ),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[

                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text("nama: ${widget.list[widget.index]['nama']}", style: new TextStyle(fontSize: 18.0),),
                new Text("alamat: ${widget.list[widget.index]['alamat']}", style: new TextStyle(fontSize: 18.0),),


                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT",style: TextStyle(color: Colors.white),),
                      color: Colors.blueAccent,
                      onPressed: ()=>Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context)=>new EditData(list: widget.list,index: widget.index)),
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("DELETE",style: TextStyle(color: Colors.white),),
                      color: Colors.pinkAccent,
                      onPressed: ()=>confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}