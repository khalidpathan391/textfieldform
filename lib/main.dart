import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    const appTitle = 'TITLE';
    return MaterialApp(
        title: appTitle,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(appTitle),
            ),
            body: MyHomePage()));
  }
}





class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name=new TextEditingController();
  TextEditingController author=new TextEditingController();
  TextEditingController mrp=new TextEditingController();
  TextEditingController discount=new TextEditingController();
  TextEditingController subject=new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DOCTOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: name,
              decoration: InputDecoration(

                border: OutlineInputBorder(),
                labelText: 'Enter NAME',

              ), //input decoration
            ),//textfield
          ), //padding
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: author,
              decoration: InputDecoration(

                border: OutlineInputBorder(),

                labelText: 'ENTER AUTHOR',
              ), //input decoration
            ),//textfield
          ),
          Padding(

            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: mrp,
              decoration: InputDecoration(

                border: OutlineInputBorder(),
                labelText: 'ENTER MRP ',

              ), //input decoration
            ),//textfield
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: discount,
              decoration: InputDecoration(

                border: OutlineInputBorder(),
                labelText: 'Enter DISCOUNT',
              ), //input decoration
            ),//textfield
          ),



          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: subject,
              decoration: InputDecoration(

                border: OutlineInputBorder(),
                labelText: 'Enter SUBJECT',
              ), //input decoration
            ),//textfield

          ),
          Center(
            child: RaisedButton(
              padding: const EdgeInsets.all(20),

              textColor: Colors.white,
              color: Colors.blue,
              onPressed: (){addBook();},
              child: Text('save'),
            ),
          ),


        ],
      ),
    );
  }





  Future<void> addBook() async {

    var data = {
      "name":name.text.toString(),
      "author":author.text.toString(),
      "mrp":mrp.text.toString(),
      "discount":discount.text.toString(),
      "subject":subject.text.toString(),

    };
    var response = await http.post(
        Uri.parse(
            ""),
        body: json.encode(data));
    var obj = jsonDecode(response.body);
    if (obj['result'] == "S") {
      print("Record is Saved");
    }
    else
    {
      print("Record is not  Saved");
    }
  }
}