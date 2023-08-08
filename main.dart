import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:
              const Center(child: Text("Google Map\n(Multi Markers, Colors)")),
        ),
        body: MyMarker(),
      ),
    );
  }
}

class MyMarker extends StatefulWidget {
  const MyMarker({super.key});

  @override
  State<MyMarker> createState() => _MyMarkerState();
}

class _MyMarkerState extends State<MyMarker> {
  LatLng showLocation1 = LatLng(3.6084723, 98.6205504);
  LatLng showLocation2 = LatLng(-6.175, 106.8258); //monas
  Set<Marker> marker1 = Set();

  @override
  void initState() {
    //..................................................................................
    marker1.add(Marker(
        markerId: MarkerId("1"),
        position: showLocation1,
        infoWindow: InfoWindow(
          title: "Title1",
          snippet: "Snipped1",
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)));
    //..................................................................................
    marker1.add(Marker(
        markerId: MarkerId("2"),
        position: showLocation2,
        infoWindow: InfoWindow(
          title: "Title1",
          snippet: "Snipped1",
        ),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: showLocation1, zoom: 1),
        markers: marker1,
      ),
    );
  }
}
