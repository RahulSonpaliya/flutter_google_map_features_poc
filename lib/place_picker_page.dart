import 'package:flutter/material.dart';
import 'package:flutter_google_map_features_poc/secrets.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class PlacePickerPage extends StatelessWidget {
  PlacePickerPage({super.key});

  final _ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              placesAutoCompleteTextField(),
            ],
          ),
        ),
      ),
    );
  }

  placesAutoCompleteTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GooglePlaceAutoCompleteTextField(
        textEditingController: _ctrl,
        googleAPIKey: PLACES_API_KEY,
        inputDecoration: const InputDecoration(
          hintText: "Search your location",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        debounceTime: 400,
        countries: const ["in"],
        isLatLngRequired: true,
        getPlaceDetailWithLatLng: (Prediction prediction) {
          debugPrint("placeDetails${prediction.lat}");
        },
        itemClick: (Prediction prediction) {
          _ctrl.text = prediction.description ?? "";
          _ctrl.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description?.length ?? 0));
        },
        seperatedBuilder: const Divider(),
        containerHorizontalPadding: 10,
        itemBuilder: (context, index, Prediction prediction) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 7),
                Expanded(child: Text(prediction.description ?? "")),
              ],
            ),
          );
        },
        isCrossBtnShown: true,
      ),
    );
  }
}
