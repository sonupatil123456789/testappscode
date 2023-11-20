import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/select_cordinates_screen/page2_controller.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/input_utils.dart';

class MapDetailsPage extends StatefulWidget {
  const MapDetailsPage({super.key});

  @override
  State<MapDetailsPage> createState() => _MapDetailsPageState();
}

class _MapDetailsPageState extends State<MapDetailsPage> {
  String apiKey = "AIzaSyDQSmnsP6MdkExxVrM_zmi8-pMvVEkOP_c";

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(body: Consumer<Page2Controller>(
      builder:
          (BuildContext context, Page2Controller page2Value, Widget? child) {
        return Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: height * 0.07,
                  decoration: BoxDecoration(
                      color: CoustomTheams.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        width: 0,
                        color: CoustomTheams.white,
                      )),
                  child: GooglePlaceAutoCompleteTextField(
                    textEditingController: InputUtils.SEARCH_LOCATIONS,
                    googleAPIKey: apiKey,
                    inputDecoration: InputDecoration(
                      // counter: const SizedBox.shrink(),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      hintText: "Search palces here ...",
                      labelStyle: TextStyle(color: HexColor("#133C58")),
                      hintStyle: GoogleFonts.poppins(
                          color: CoustomTheams.blackShade54,
                          fontSize: MediaQuery.of(context).size.width * 0.032,
                          fontWeight: FontWeight.w600),
                      prefixIcon: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CoustomTheams.white, width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CoustomTheams.white, width: 0),
                      ),
                    ),
                    debounceTime: 800, // default 600 ms,
                    countries: const ["in"], // optional by default null is set
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) async {
                      print("placeDetails======" +
                          prediction.lng.toString() +
                          "==========" +
                          prediction.lng.toString());
                      final GoogleMapController controller =
                          await _controller.future;
                      await controller.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                              bearing: 192.8334901395799,
                              target: LatLng(
                                  double.parse(prediction.lat.toString()),
                                  double.parse(prediction.lng.toString())),
                              tilt: 59.440717697143555,
                              zoom: 19.151926040649414)));
                      setState(() {});
                    },
                    itemClick: (Prediction prediction) {
                      InputUtils.SEARCH_LOCATIONS.text =
                          prediction.description.toString();
                      // controller.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description.length));
                    },
                    itemBuilder: (context, index, Prediction prediction) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.02,
                            ),
                            const Icon(Icons.location_on),
                            SizedBox(
                              width: width * 0.06,
                            ),
                            Expanded(child: Text(prediction.description ?? ""))
                          ],
                        ),
                      );
                    },
                    seperatedBuilder: const Divider(),
                    isCrossBtnShown: true,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ));
  }
}
