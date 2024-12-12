import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class GeoCodingDemo extends StatefulWidget {
  const GeoCodingDemo({super.key});

  @override
  State<GeoCodingDemo> createState() => _GeoCodingDemoState();
}

class _GeoCodingDemoState extends State<GeoCodingDemo> {
  final _addressCtrl = TextEditingController();
  final _latCtrl = TextEditingController(text: '22.737381');
  final _lngCtrl = TextEditingController(text: '75.818103');

  List<Location>? locationsFromAddress;
  List<Placemark>? placemarksFromLatLng;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _addressCtrl,
                      decoration:
                          const InputDecoration(hintText: 'Enter Address'),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () async {
                        if (_addressCtrl.text.isNotEmpty) {
                          List<Location> locations = await locationFromAddress(
                            _addressCtrl.text,
                          );
                          setState(() {
                            locationsFromAddress = locations;
                          });
                        }
                      },
                      child: const Text('Get Location From Address'),
                    ),
                    if (locationsFromAddress?.isNotEmpty ?? false)
                      Text('Location -> ${locationsFromAddress?[0]}')
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _latCtrl,
                            decoration: const InputDecoration(
                              hintText: 'Latitude',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextField(
                            controller: _lngCtrl,
                            decoration: const InputDecoration(
                              hintText: 'Longitude',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () async {
                        if (_latCtrl.text.isNotEmpty &&
                            _lngCtrl.text.isNotEmpty) {
                          List<Placemark> placemarks =
                              await placemarkFromCoordinates(
                            double.parse(_latCtrl.text),
                            double.parse(_lngCtrl.text),
                          );
                          setState(() {
                            placemarksFromLatLng = placemarks;
                          });
                        }
                      },
                      child: const Text('Get Address From Lat-Lng'),
                    ),
                    if (placemarksFromLatLng?.isNotEmpty ?? false)
                      Text('Placemarks -> ${placemarksFromLatLng?[0]}')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
