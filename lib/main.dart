import 'package:flutter/material.dart';
import 'back.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  var jsonData;
  var accessToken;
  var scope;
  var tokenType;
  var refreshToken;
  var expirationTime;



  void _incrementCounter() {
    setState(() {
      if(jsonData == ""){
        loadJsonAsset();
      }else{
        jsonData = "";
      }


    });
  }


  //Jsonをstringとしてロード
  Future<void> loadJsonAsset() async{

    String loadData = await rootBundle.loadString('json/accessToken.json');
    Map<String, dynamic> token = json.decode('json/accessToken.json');
    jsonData = token.toString();
    print(token);


  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Push the button and you`ll see',
            ),
            Text(
              '$jsonData',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
