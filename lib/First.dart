import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
class First extends StatefulWidget {
  @override
  _covidState createState() => _covidState();
}
class _covidState extends State<First> {
  void Playsound() {
   final player = AudioCache();
   player.play('audio.mp3');
  }
  Future<bool>_willpop()async{
    return showDialog(context:context,
    builder: (context)=>AlertDialog(
      title: Text('Are you sure!'),
      actions: [
        FlatButton(
          child: Text('yes'),
          onPressed: (){
            Navigator.pop(context,true);
          },
        ),
        FlatButton(
          child: Text('No'),
          onPressed: (){
            Navigator.pop(context,false);
          },
        ),
      ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:_willpop,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('Images/Intro-image.jpg'),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'This app will help you to be aware of the corona virus and will help you to be safe.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 20.0, width: 0.0,),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,10.0),
                    child: ListTile(
                      leading: MyBullet(),
                      title: Text('It will help you finding covid special hospitals '),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,10.0),
              child: ListTile(
                leading: MyBullet(),
                title: Text('Will help you to track different locations of India'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,10.0),
              child: ListTile(
                leading: MyBullet(),
                title: Text('We will make sure that you are always kept updated '),
              ),
            ),
              ],
              ),
            ),
            SizedBox(height: 50.0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(100.0, 15.0, 100.0, 15.0),
                  splashColor: Colors.blue.withAlpha(90),
                  color: Colors.blue[500],
                  onPressed: () {
                    setState(() {
                      Playsound();
                      Navigator.pushNamed(context, '/second');
                    });
                  },
                  child: Text('Get Started',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 12.0,
      width: 12.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
