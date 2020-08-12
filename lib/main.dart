import 'package:flutter/material.dart';
import 'package:loading/detail.dart';
import 'package:loading/widget/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Progress Indicator Demo',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  int _click =0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Progress Indicator Demo"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('$_click', style: TextStyle(color: Colors.deepOrange, fontSize: 30),),
                SizedBox(height: 30,),
                RaisedButton(
                  onPressed: (){
                    _onClick();
                  },
                  child: Text('Submit'),
                ),
                SizedBox(height: 30,),
                RaisedButton(
                  onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen()));
                  },
                  child: Text('Go to Detail'),
                ),

              ],
            ),
          ),
          Center(
            child: _isLoading ? widgetLoading() : null,
          )
        ],
      ),
    );
  }
  _onClick(){
    setState(() {
      _isLoading =true;
      _click+=1;
    });

     Future.delayed(new Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }
}
