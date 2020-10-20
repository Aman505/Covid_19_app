import 'package:covid19app/AlbumUI.dart';
import 'package:covid19app/Google.dart';
import 'package:covid19app/Precautions.dart';
import 'package:covid19app/TotalRecord.dart';
import 'package:covid19app/googledemo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Help.dart';
import 'NetworkCallDemo.dart';
import 'StateData.dart';
import 'Symptoms.dart';
class second extends StatefulWidget {
  @override
  _AlbumUiState createState() => _AlbumUiState();
}
class _AlbumUiState extends State<second> {
  Future<TotalRecord> total;
  @override
  void initState() {
    total=NetworkCallDemo().fetchTotalRecord();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Covid Tracker',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[300],
      ),
      body:  FutureBuilder<TotalRecord>(
        future: total,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return _SecondState(total: snapshot.data);
          } else if (snapshot.hasError) {
            return Statedata(statedata: snapshot.error);
          }
          return Center(child:Loader());
        },
      ),
    );
  }
}
class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 6.0,
      backgroundColor: Colors.black,
    );
  }
}
class _SecondState extends StatelessWidget{
  TotalRecord total;
  _SecondState({this.total});
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children:[
          SizedBox(height: 20.0,),
          Text('Today\'s fight',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),
          Divider(color: Colors.white,
            thickness: 5.0,
            height: 10.0,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,0.0),
            child: Container(
              width: 400.0,
              height: 220.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Container(height: 100.0,
                          width: 200.0,
                          child:  Card(
                            color: Colors.pink[50],
                            child: ListTile(
                              leading:ClipRRect(
                                borderRadius: BorderRadius.circular(3.0),
                                child: Image.asset('Images/active.png',),
                              ),
                              title: Text('${total.active}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0,
                                ),),
                              subtitle: Text('Active',
                                style: TextStyle(
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          ),),
                        ),
                       SizedBox(width: 2.0,),
                    Flexible(
                      child: Container(height: 100.0,
                        width: 200.0,
                        child: Card(
                          color: Colors.green[100],
                          child: ListTile(
                            leading:ClipRRect(
                              child: Image.asset('Images/checked.png',),
                            ),
                            title: Text('${total.confirmed}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                              ),),
                            subtitle: Text('Today/s check',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Container(height: 100.0,
                            width: 200.0,
                            child: Card(
                              color: Colors.lightBlue[100],
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(3.0),
                                  child: Image.asset('Images/tombstone.png'),
                                ),
                                title: Text('${total.deaths}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0,
                                  ),),
                                subtitle: Text('Deaths',
                                style: TextStyle(
                                  fontSize: 10.0,
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    SizedBox(width: 1.0,),
                    Flexible(
                      child: Container(height: 100.0,
                        width: 200.0,
                        child: Card(
                          color: Colors.cyan[50],
                          child: ListTile(
                            leading: ClipRRect(
                          borderRadius: BorderRadius.circular(3.0),
                              child: Image.asset('Images/recovered.png'),
                               ),
                            title: Text('${total.recovered}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                              ),),
                            subtitle: Text('Recovered',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Divider(
          //   thickness: 5.0,
          //   color: Colors.blueGrey,
          // ),
          SizedBox(height: 20.0,),
          InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder:(context)=>Symptoms()));
            },
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,10.0),
                    child: ListTile(
                      leading:ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Hero(
                          tag: 'location-img',
                          child: Image.asset('Images/symptoms.png',
                            height: 60.0,),
                        ),
                      ),
                      title: Text('Symptoms',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder:(context)=>Precautions()));
            },
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,10.0),
                    child: ListTile(
                      leading:ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Hero(
                          tag: 'location2-img',
                          child: Image.asset('Images/precautions.png',
                            height: 60.0,),
                        ),
                      ),
                      title: Text('Precautions',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Divider(color: Colors.blueGrey,
          //   thickness: 5.0,
          //   height: 10.0,
          // ),
          SizedBox(height: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(7.0),
                  child: Image.asset('Images/depositphotos_187636534-stock-illustration-india-map-frame-icon.jpg',
                    height: 60.0,),
                ),
                title: Text('For all the states',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>googledemo()));
                },
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              SizedBox(height: 10.0,),
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(7.0),
                  child: Hero(
                    tag: 'guide',
                    child: Image.asset('Images/Guidelines-800px.jpg'),
                  ),
                ),
                title: Text('Help',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
                }
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class Statedata extends StatelessWidget {
  String statedata;

  Statedata({this.statedata});

  @override
  Widget build(BuildContext context) {
    return Text('${statedata}');
  }
}


