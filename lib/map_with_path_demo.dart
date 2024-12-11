import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// This widget displays a Google Map with markers and a path (polyline) drawn
/// between two cities: Sydney and Melbourne.
class MapWithPathDemo extends StatefulWidget {
  const MapWithPathDemo({super.key});

  @override
  State<MapWithPathDemo> createState() => _MapWithPathDemoState();
}

class _MapWithPathDemoState extends State<MapWithPathDemo> {
  // Initial camera position for the map (Google's HQ in Mountain View, CA)
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // Marker for Sydney
  static const _sydneyMarker = Marker(
    markerId: MarkerId('Sydney'),
    position: LatLng(-33.86, 151.20),
  );

  // Marker for Melbourne
  static const _melbourneMarker = Marker(
    markerId: MarkerId('Melbourne'),
    position: LatLng(-37.810272, 144.962646),
  );

  // Set of markers to be displayed on the map
  var markers = <Marker>{_sydneyMarker, _melbourneMarker};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Google Map widget with markers and polyline
      body: GoogleMap(
        // Initial position of the camera when the map loads
        initialCameraPosition: _kGooglePlex,

        // Markers to show on the map (Sydney and Melbourne)
        markers: markers,

        // Adding a polyline (path) between Sydney and Melbourne
        polylines: {
          Polyline(
            polylineId: const PolylineId('Path'),
            color: Colors.blue,
            width: 5, // Line thickness
            points: _polylinePointsSydneyToMelbourne(), // Route points
          ),
        },

        // Called when the map is created
        onMapCreated: (GoogleMapController controller) {
          // Adjusting the camera to include both Sydney and Melbourne
          controller.animateCamera(
            CameraUpdate.newLatLngBounds(
              LatLngBounds(
                  southwest: _melbourneMarker.position,
                  northeast: _sydneyMarker.position),
              50, // Padding around the bounds
            ),
          );
        },
      ),
    );
  }

  // List of LatLng points representing the path from Sydney to Melbourne
  List<LatLng> _polylinePointsSydneyToMelbourne() {
    final List<LatLng> points = <LatLng>[];

    // Adding points along the route
    points.add(const LatLng(-33.8602684, 151.2014587));
    points.add(const LatLng(-33.8608935, 151.2014349));
    points.add(const LatLng(-33.8608935, 151.2014349));
    points.add(const LatLng(-33.8609269, 151.202813));
    points.add(const LatLng(-33.8609269, 151.202813));
    points.add(const LatLng(-33.8641334, 151.203077));
    points.add(const LatLng(-33.8641334, 151.203077));
    points.add(const LatLng(-33.87026, 151.2037601));
    points.add(const LatLng(-33.87026, 151.2037601));
    points.add(const LatLng(-33.8725035, 151.2033232));
    points.add(const LatLng(-33.8725035, 151.2033232));
    points.add(const LatLng(-33.8680274, 151.1811675));
    points.add(const LatLng(-33.8680274, 151.1811675));
    points.add(const LatLng(-33.8692945, 151.1762636));
    points.add(const LatLng(-33.8692945, 151.1762636));
    points.add(const LatLng(-33.8728539, 151.169913));
    points.add(const LatLng(-33.8728539, 151.169913));
    points.add(const LatLng(-33.9403974, 151.0847966));
    points.add(const LatLng(-33.9403974, 151.0847966));
    points.add(const LatLng(-33.9566124, 150.8768554));
    points.add(const LatLng(-33.9566124, 150.8768554));
    points.add(const LatLng(-33.9718418, 150.873719));
    points.add(const LatLng(-33.9718418, 150.873719));
    points.add(const LatLng(-34.7164055, 150.0040517));
    points.add(const LatLng(-34.7164055, 150.0040517));
    points.add(const LatLng(-35.8403572, 147.2023738));
    points.add(const LatLng(-35.8403572, 147.2023738));
    points.add(const LatLng(-36.1075604, 146.9032934));
    points.add(const LatLng(-36.1075604, 146.9032934));
    points.add(const LatLng(-37.683866, 144.9852453));
    points.add(const LatLng(-37.683866, 144.9852453));
    points.add(const LatLng(-37.6902351, 144.9782093));
    points.add(const LatLng(-37.6902351, 144.9782093));
    points.add(const LatLng(-37.6990516, 144.8968941));
    points.add(const LatLng(-37.6990516, 144.8968941));
    points.add(const LatLng(-37.7022878, 144.8930279));
    points.add(const LatLng(-37.7022878, 144.8930279));
    points.add(const LatLng(-37.7098506, 144.8908298));
    points.add(const LatLng(-37.7098506, 144.8908298));
    points.add(const LatLng(-37.7316643, 144.8908309));
    points.add(const LatLng(-37.7316643, 144.8908309));
    points.add(const LatLng(-37.7800189, 144.938969));
    points.add(const LatLng(-37.7800189, 144.938969));
    points.add(const LatLng(-37.787836, 144.9406948));
    points.add(const LatLng(-37.787836, 144.9406948));
    points.add(const LatLng(-37.7893536, 144.9422625));
    points.add(const LatLng(-37.7893536, 144.9422625));
    points.add(const LatLng(-37.794769, 144.9491907));
    points.add(const LatLng(-37.794769, 144.9491907));
    points.add(const LatLng(-37.7965305, 144.9512023));
    points.add(const LatLng(-37.7965305, 144.9512023));
    points.add(const LatLng(-37.8008152, 144.9570781));
    points.add(const LatLng(-37.8008152, 144.9570781));
    points.add(const LatLng(-37.8025342, 144.9579751));
    points.add(const LatLng(-37.8025342, 144.9579751));
    points.add(const LatLng(-37.8061977, 144.959674));
    points.add(const LatLng(-37.8061977, 144.959674));
    points.add(const LatLng(-37.8068986, 144.9658217));
    points.add(const LatLng(-37.8068986, 144.9658217));
    points.add(const LatLng(-37.8087879, 144.9663211));
    points.add(const LatLng(-37.8087879, 144.9663211));
    points.add(const LatLng(-37.8100403, 144.9625515));

    return points;
  }
}
