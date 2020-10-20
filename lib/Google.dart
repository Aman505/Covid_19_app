import 'dart:math';
import 'package:covid19app/StateData.dart';
import 'package:covid19app/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'NetworkCallDemo.dart';
import 'collection.dart';
/*class Mapdata extends StatefulWidget {
  @override
  _MapdataState createState() => _MapdataState();
}

class _MapdataState extends State<Mapdata> {
  Future<List<StateData>> total;
  @override
  void initState() {
    total=NetworkCallDemo().fetchTotalRecordList();
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
      body:  FutureBuilder<List<StateData>>(
        future: total,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return _mapGoogleState(stateData: snapshot.data);
          } else if (snapshot.hasError) {
            return Data(dataerror: snapshot.error);
          }
          return Text('Loading...');
        },
      ),
    );
  }
}*/
class Google extends StatefulWidget {
  List<StateData> stateData;
 // _mapGoogleState(/*{this.stateData}*/);
  @override
  __mapGoogleStateState createState() => __mapGoogleStateState(/*data: stateData*/);
}
class __mapGoogleStateState extends State< Google> {
  List<StateData> data;
 /* __mapGoogleStateState({this.data});*/
  GoogleMapController _controller;
  List<collect>coll=[
    collect(title: 'punjab',latlng:LatLng(32.1266,75.4636)),
    collect(title: 'Delhi',latlng:LatLng(28.7041,77.1025)),
    collect(title: 'Jammu',latlng: LatLng(32.7266, 74.8570)),
    collect(title: 'Chandigarh',latlng: LatLng(30.7333,76.7794)),
    collect(title: 'Maharastra',latlng: LatLng(19.7515, 75.7139)),
    collect(title: 'Andhra pradesh',latlng: LatLng(15.9129, 79.7400)),
    collect(title: 'UP',latlng: LatLng(26.8467,80.9462)),
    collect(title: 'Arunachal pradesh',latlng: LatLng(28.2180,94.7278)),
    collect(title: 'Assam',latlng: LatLng(26.8467,92.9376)),
    collect(title: 'Bihar',latlng: LatLng(25.0961,85.3131)),
    collect(title: 'Chhatisgarh',latlng: LatLng(21.2787,81.8661)),
    collect(title: 'Goa',latlng: LatLng(15.2993, 74.1240)),
    collect(title: 'Gujarat',latlng: LatLng(22.2587, 71.1924)),
    collect(title: 'Haryana',latlng: LatLng(29.0588, 76.0856)),
    collect(title: 'Himachal pradesh',latlng: LatLng(31.1048, 77.1734)),
    collect(title: 'Jharkhand',latlng: LatLng(23.6102, 85.2799)),
    collect(title: 'Karnataka',latlng: LatLng(15.3173, 75.7139)),
    collect(title: 'Kerela',latlng: LatLng(10.8505, 76.2711)),
    collect(title: 'Madhya pradesh',latlng: LatLng(22.9734, 78.6569)),
    collect(title: 'Manipur',latlng: LatLng(24.6637, 93.9063)),
    collect(title: 'Meghalaya',latlng: LatLng(25.4670, 91.3662)),
    collect(title: 'Mizoram',latlng: LatLng(23.1645, 92.9376)),
    collect(title: 'Nagaland',latlng: LatLng(26.1584, 94.5624)),
    collect(title: 'Odisha',latlng: LatLng(20.9517, 85.0985)),
    collect(title: 'Rajasthan',latlng: LatLng(27.0238, 74.2179)),
    collect(title: 'Sikkim',latlng: LatLng(27.5330, 88.5122)),
    collect(title: 'Tamil nadu',latlng: LatLng(11.1271,78.6569)),
    collect(title: 'Telangana',latlng: LatLng(18.1124, 79.0193)),
    collect(title: 'Tripura',latlng: LatLng(23.9408, 91.9882)),
    collect(title: 'Uttarakhand',latlng: LatLng(30.0668,79.0193)),
    collect(title: 'West Bengal',latlng: LatLng(22.9868, 87.8550)),
    collect(title: 'Andaman and Nicobar',latlng: LatLng(11.7401, 92.6586)),
    collect(title: 'Ladakh',latlng: LatLng( 34.152588, 77.577049)),
    collect(title: 'Puducherry',latlng: LatLng(11.9416,79.8083)),
  ];

  List<Marker>marker=[];

  addmarker(List<collect>list1){
    setState(() {
      for(var i = 0; i<list1.length;i++){
        marker.add(Marker(position:list1[i].latlng,infoWindow:InfoWindow(title:list1[i].title),markerId: MarkerId(Random().nextInt(100).toString())));
      }
    });
  }

  final CameraPosition _position = CameraPosition(target: LatLng(32.1266,75.4636));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('India'),
      ),
      body: GoogleMap(
    initialCameraPosition: _position,
        mapType: MapType.normal,
        onMapCreated: (controller){
          _controller=controller;
          _controller.animateCamera(CameraUpdate.zoomTo(4));
          addmarker(coll);
        },
        markers: marker.toSet(),
    onTap: (cordinate) {
      _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
    },
      ),
    );
  }
}
/*
class Data extends StatelessWidget {
  List dataerror;
  Data({this.dataerror});
  @override
  Widget build(BuildContext context) {
    return Text('$dataerror');
  }
}*/
