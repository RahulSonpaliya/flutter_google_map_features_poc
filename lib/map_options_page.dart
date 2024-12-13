import 'package:flutter/material.dart';
import 'package:flutter_google_map_features_poc/map_with_path_demo.dart';
import 'package:flutter_google_map_features_poc/place_picker_page.dart';
import 'package:flutter_google_map_features_poc/simple_map_demo.dart';

import 'geocoding_demo.dart';
import 'map_with_marker_clustering.dart';

class MapOptionsPage extends StatelessWidget {
  const MapOptionsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SimpleMapDemo()),
                );
              },
              child: const Text('Simple Map Demo'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MapWithPathDemo()),
                );
              },
              child: const Text('Map With Path Demo'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GeoCodingDemo()),
                );
              },
              child: const Text('GeoCoding Demo'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PlacePickerPage()),
                );
              },
              child: const Text('Place Picker Demo'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const MapWithMarkerClustering()),
                );
              },
              child: const Text('Map With Marker Clustering'),
            ),
          ],
        ),
      ),
    );
  }
}
