//Google API Key AIzaSyAalRAEyQNHJFEpSnJdT1Z5v4YP39dpGXQ
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class basic_map extends StatefulWidget {
  @override
  _basic_mapState createState() => _basic_mapState();
}

class _basic_mapState extends State<basic_map> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Basic Map Page With Stack'),
            backgroundColor: Colors.green[700],
          ),
          body: Stack(
            children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
              Spacer(),
              Text(
                'Look daddy I made a widget tree',
                style: TextStyle(fontSize: 30),
              ),
            ],
          )),
    );
  }
}
