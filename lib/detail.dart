import 'package:flutter/material.dart';
import 'package:loading/widget/loading.dart';

class DetailScreen extends StatefulWidget {

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen'),centerTitle: true,),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Hello chào', style: TextStyle(color: Colors.blue, fontSize: 24),)
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
  @override
  void initState() {
    super.initState();
    _getData();
  }
  _getData(){
    setState(() {
      _isLoading =true;
    });

    Future.delayed(new Duration(seconds: 4), () {
      setState(() {
        _isLoading = false;
      });
    });
  }
}
