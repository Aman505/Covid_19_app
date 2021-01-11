import 'dart:math';
import 'package:covid19app/state_tally_response.dart';
import 'package:covid19app/statewise_data.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'NetworkCallDemo.dart';
import 'statewise_data.dart';

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
  __mapGoogleStateState createState() =>
      __mapGoogleStateState(/*data: stateData*/);
}

class __mapGoogleStateState extends State<Google> {
  List<StateData> data;
  /* __mapGoogleStateState({this.data});*/
  GoogleMapController _controller;
  List<StateWiseData> coll = [
    StateWiseData(title: 'punjab', latLng: LatLng(32.1266, 75.4636)),
    StateWiseData(title: 'Delhi', latLng: LatLng(28.7041, 77.1025)),
    StateWiseData(title: 'Jammu', latLng: LatLng(32.7266, 74.8570)),
    StateWiseData(title: 'Chandigarh', latLng: LatLng(30.7333, 76.7794)),
    StateWiseData(title: 'Maharastra', latLng: LatLng(19.7515, 75.7139)),
    StateWiseData(title: 'Andhra pradesh', latLng: LatLng(15.9129, 79.7400)),
    StateWiseData(title: 'UP', latLng: LatLng(26.8467, 80.9462)),
    StateWiseData(title: 'Arunachal pradesh', latLng: LatLng(28.2180, 94.7278)),
    StateWiseData(title: 'Assam', latLng: LatLng(26.8467, 92.9376)),
    StateWiseData(title: 'Bihar', latLng: LatLng(25.0961, 85.3131)),
    StateWiseData(title: 'Chhatisgarh', latLng: LatLng(21.2787, 81.8661)),
    StateWiseData(title: 'Goa', latLng: LatLng(15.2993, 74.1240)),
    StateWiseData(title: 'Gujarat', latLng: LatLng(22.2587, 71.1924)),
    StateWiseData(title: 'Haryana', latLng: LatLng(29.0588, 76.0856)),
    StateWiseData(title: 'Himachal pradesh', latLng: LatLng(31.1048, 77.1734)),
    StateWiseData(title: 'Jharkhand', latLng: LatLng(23.6102, 85.2799)),
    StateWiseData(title: 'Karnataka', latLng: LatLng(15.3173, 75.7139)),
    StateWiseData(title: 'Kerela', latLng: LatLng(10.8505, 76.2711)),
    StateWiseData(title: 'Madhya pradesh', latLng: LatLng(22.9734, 78.6569)),
    StateWiseData(title: 'Manipur', latLng: LatLng(24.6637, 93.9063)),
    StateWiseData(title: 'Meghalaya', latLng: LatLng(25.4670, 91.3662)),
    StateWiseData(title: 'Mizoram', latLng: LatLng(23.1645, 92.9376)),
    StateWiseData(title: 'Nagaland', latLng: LatLng(26.1584, 94.5624)),
    StateWiseData(title: 'Odisha', latLng: LatLng(20.9517, 85.0985)),
    StateWiseData(title: 'Rajasthan', latLng: LatLng(27.0238, 74.2179)),
    StateWiseData(title: 'Sikkim', latLng: LatLng(27.5330, 88.5122)),
    StateWiseData(title: 'Tamil nadu', latLng: LatLng(11.1271, 78.6569)),
    StateWiseData(title: 'Telangana', latLng: LatLng(18.1124, 79.0193)),
    StateWiseData(title: 'Tripura', latLng: LatLng(23.9408, 91.9882)),
    StateWiseData(title: 'Uttarakhand', latLng: LatLng(30.0668, 79.0193)),
    StateWiseData(title: 'West Bengal', latLng: LatLng(22.9868, 87.8550)),
    StateWiseData(
        title: 'Andaman and Nicobar', latLng: LatLng(11.7401, 92.6586)),
    StateWiseData(title: 'Ladakh', latLng: LatLng(34.152588, 77.577049)),
    StateWiseData(title: 'Puducherry', latLng: LatLng(11.9416, 79.8083)),
  ];

  List<Marker> marker = [];

  addmarker(List<StateWiseData> list1) {
    setState(() {
      for (var i = 0; i < list1.length; i++) {
        marker.add(Marker(
            position: list1[i].latLng,
            infoWindow: InfoWindow(title: list1[i].title),
            markerId: MarkerId(Random().nextInt(100).toString())));
      }
    });
  }

  final CameraPosition _position =
      CameraPosition(target: LatLng(32.1266, 75.4636));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('India'),
      ),
      body: GoogleMap(
        initialCameraPosition: _position,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          _controller = controller;
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
