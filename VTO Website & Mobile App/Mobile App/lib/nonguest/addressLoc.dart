import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fypapp/nonguest/deleivery.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../provider/provider1.dart';
import '../../utils/multiText.dart';

class LocAddress extends StatefulWidget {
  var lat;
  var lon;
  LocAddress({super.key,required this.lat,required this.lon});

  @override
  State<LocAddress> createState() => _LocAddressState();
}

class _LocAddressState extends State<LocAddress> {
  
  final _formKey = GlobalKey<FormState>();
  String data = "";
  String value = "home";
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController addres = TextEditingController();
  TextEditingController mail = TextEditingController();

  final Completer<GoogleMapController> _controller = Completer();

    LatLng sourceLocation = LatLng(24.9389017, 67.1215433);
    LatLng destinationLocation = LatLng(24.9389017, 67.1215431);
  
  set(){
       setState(() {
          LatLng sourceLocation = LatLng(24.9389017, 67.1215433);
        LatLng destinationLocation = LatLng(widget.lat, widget.lon);
       });
  
  }
    List<LatLng> polylineCoordinates = [];
  late List<LatLng> polylineCoordinates2;
  double _distance = 0;
  BitmapDescriptor? markerbitmap;

  void getPolyPoints() async {
    PolylinePoints polyLinePoints = PolylinePoints();
    PolylineResult result = await polyLinePoints.getRouteBetweenCoordinates(
            "AIzaSyBgI4CW-pphFQpBRJpxSvZd2URLn1EDV5s",
            PointLatLng(24.9389017, 67.1215433),
            PointLatLng(
                widget.lat, widget.lon))
        as PolylineResult;
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {});
    }
  }

  void _calculateDistance() {
    double totalDistance = 0;
    for (int i = 0; i < polylineCoordinates2.length - 1; i++) {
      double distance = _coordinateDistance(
        polylineCoordinates2[i].latitude,
        polylineCoordinates2[i].longitude,
        polylineCoordinates2[i + 1].latitude,
        polylineCoordinates2[i + 1].longitude,
      );
      totalDistance += distance;
    }
    setState(() {
      _distance = totalDistance;
    });
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  void initState() {
    final Provider11 = Provider.of<Provider1>(context,listen: false);
    set();
    getPolyPoints();

   
    polylineCoordinates2 = [
      LatLng(Provider11.lat!, Provider11.lon!),
      LatLng(24.9389017, 67.1215433)
    ];
    _calculateDistance();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    child: GoogleMap (
                      initialCameraPosition:
                          CameraPosition(target: LatLng(24.9389017, 67.1215433), zoom: 11.5),
                      polylines: {
                        Polyline(
                            polylineId: PolylineId("route"),
                            points: polylineCoordinates,
                            color: Colors.red,
                            width: 2),
                      },
                      markers: {
                        Marker(
                          markerId: MarkerId("source"),
                          position: LatLng(24.9389017, 67.1215433),
                          
                           
                        ),
                        Marker(
                            markerId: MarkerId("destination"),
                            position: LatLng(widget.lat, widget.lon)),
                      },
                    ),
                  ),
                ],
              ),
            ),
           
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Multi(color: Colors.black, subtitle: "Total Distance", weight: FontWeight.bold, size: 16),
                              Multi(color: Colors.green, subtitle: "${_distance.toStringAsFixed(2)} km", weight: FontWeight.bold, size: 16),
                            ],
                          ),
                        ),
                      
                        Container(
                            height: 50.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 15.0, // soften the shadow
                                  spreadRadius: 5.0, //extend the shadow
                                  offset: Offset(
                                    5.0, // Move to right 5  horizontally
                                    5.0, // Move to bottom 5 Vertically
                                  ),
                                )
                              ],
                            ),
                            child: ElevatedButton(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(),
                                    Multi(
                                        color: Color(0xffD7A563),
                                        subtitle: "Done",
                                        weight: FontWeight.w600,
                                        size: 18), // <-- Text
                                    Icon(
                                      // <-- Icon
                                      Icons.arrow_forward,
                                      size: 24.0,
                                      color: Color(0xffD7A563),
                                    ),
                                  ],
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(15.r), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                 Navigator.push(context,
                                      MaterialPageRoute(builder:
                                        (context) =>NDelievery() ));
                              },
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}