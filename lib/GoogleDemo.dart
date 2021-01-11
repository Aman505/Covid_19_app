import 'package:covid19app/state_tally_response.dart';
import 'package:covid19app/statewise_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'NetworkCallDemo.dart';

class GoogleDemo extends StatefulWidget {
  @override
  _MapDataState createState() => _MapDataState();
}

class _MapDataState extends State<GoogleDemo> {
  Future<List<StateData>> total;

  @override
  void initState() {
    total = NetworkCallDemo().fetchTotalRecordList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Covid Tracker',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: FutureBuilder<List<StateData>>(
        future: total,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GoogleDemoTwo(stateData: snapshot.data);
          } else if (snapshot.hasError) {
            return Data(dataerror: snapshot.error);
          }
          return Text('Loading...');
        },
      ),
    );
  }
}

class GoogleDemoTwo extends StatefulWidget {
  List<StateData> stateData;

  GoogleDemoTwo({this.stateData});

  @override
  __MapGoogleStateState createState() => __MapGoogleStateState(data: stateData);
}

class __MapGoogleStateState extends State<GoogleDemoTwo> {
  List<StateData> data;

  __MapGoogleStateState({this.data});

  GoogleMapController _controller;
  List<StateWiseData> coll = [];

  void gettingData() {
    for (var i = 0; i < data.length; i++) {
      if (data[i].state == "Maharastra") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(19.7515, 75.7139)));
      }
      if (data[i].state == "Andhra Pradesh") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(15.9129, 79.7400)));
      }
      if (data[i].state == "Karnataka") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(15.3173, 75.7139)));
      }
      if (data[i].state == "Tamil Nadu") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(11.1271, 78.6569)));
      }
      if (data[i].state == "Uttar Pradesh") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(26.8467, 80.9462)));
      }
      if (data[i].state == "Kerala") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(10.8505, 76.2711)));
      }
      if (data[i].state == "Delhi") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(28.7041, 77.1025)));
      }
      if (data[i].state == "West Bengal") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(22.9868, 87.8550)));
      }
      if (data[i].state == "Odisha") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(20.9517, 85.0985)));
      }
      if (data[i].state == "Telangana") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(18.1124, 79.0193)));
      }
      if (data[i].state == "Bihar") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(25.0961, 85.3131)));
      }
      if (data[i].state == "Assam") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(26.8467, 92.9376)));
      }
      if (data[i].state == "Rajasthan") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(27.0238, 74.2179)));
      }
      if (data[i].state == "Madhya Pradesh") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(22.9734, 78.6569)));
      }
      if (data[i].state == "Gujarat") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(22.2587, 71.1924)));
      }
      if (data[i].state == "Chhattisgarh") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(21.2787, 81.8661)));
      }
      if (data[i].state == "Haryana") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(29.0588, 76.0856)));
      }
      if (data[i].state == "Punjab") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(32.1266, 75.4636)));
      }
      if (data[i].state == "Jharkhand") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(23.6102, 85.2799)));
      }
      if (data[i].state == "Jammu and Kashmir") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(32.7266, 74.8570)));
      }
      if (data[i].state == "Uttarakhand") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(30.0668, 79.0193)));
      }
      if (data[i].state == "Goa") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(15.2993, 74.1240)));
      }
      if (data[i].state == "Puducherry") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(11.9416, 79.8083)));
      }
      if (data[i].state == "Tripura") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(23.9408, 91.9882)));
      }
      if (data[i].state == "Himachal Pradesh") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(31.1048, 77.1734)));
      }
      if (data[i].state == "Manipur") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(24.6637, 93.9063)));
      }
      if (data[i].state == "Chandigarh") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(30.7333, 76.7794)));
      }
      if (data[i].state == "Arunachal Pradesh") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(28.2180, 94.7278)));
      }
      if (data[i].state == "Meghalaya") {
        coll.add(StateWiseData(
            title: 'State: ${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(25.4670, 91.3662)));
      }
      if (data[i].state == "Nagaland") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(26.1584, 94.5624)));
      }
      if (data[i].state == "Ladakh") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(34.152588, 77.577049)));
      }
      if (data[i].state == "Andaman and Nicobar Islands") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(11.7401, 92.6586)));
      }
      if (data[i].state == "Sikkim") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(27.5330, 88.5122)));
      }
      if (data[i].state == "Mizoram") {
        coll.add(StateWiseData(
            title: '${data[i].state}',
            data:
                'Active cases: ${data[i].active}, Recovered: ${data[i].recovered}',
            latLng: LatLng(23.1645, 92.9376)));
      }
    }
  }

  List<Marker> marker = [];

  addmarker(List<StateWiseData> list1) {
    gettingData();
    setState(() {
      for (var i = 0; i < list1.length; i++) {
        marker.add(Marker(
            position: list1[i].latLng,
            infoWindow:
                InfoWindow(title: list1[i].title, snippet: list1[i].data),
            markerId: MarkerId(Random().nextInt(100).toString())));
      }
    });
  }

  final CameraPosition _position =
      CameraPosition(target: LatLng(32.1266, 75.4636));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class Data extends StatelessWidget {
  List dataerror;

  Data({this.dataerror});

  @override
  Widget build(BuildContext context) {
    return Text('$dataerror');
  }
}
