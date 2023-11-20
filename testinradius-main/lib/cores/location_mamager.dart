import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/input_utils.dart';

class CoustomGoogleMapView extends StatefulWidget {
  const CoustomGoogleMapView({super.key});

  @override
  State<CoustomGoogleMapView> createState() => _CoustomGoogleMapViewState();
}

class _CoustomGoogleMapViewState extends State<CoustomGoogleMapView> {
  late dynamic places = [];

  Future<List<String>> searchPlaces(String query) async {
    const apiKey = "AIzaSyDQSmnsP6MdkExxVrM_zmi8-pMvVEkOP_c";

    final response = await http.get(Uri.parse(
      'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey',
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List<dynamic>;
      places = results.map((result) => result['name'].toString()).toList();
      print("places ====================$places");
      return places;
    } else {
      throw Exception('Failed to load places');
    }
  }

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
    return Container(
      width: width * 0.80,
      height: height * 0.34,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            ListView.builder(
              itemCount: places.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(places.toString());
              },
            ),

            // GoogleMap(
            //   mapType: MapType.normal,
            //   initialCameraPosition: _kGooglePlex,
            //   onMapCreated: (GoogleMapController controller) {
            //     _controller.complete(controller);
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Container(
                width: width * 0.70,
                height: height * 0.05,
                padding: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: CoustomTheams.white,
                ),
                child: TextFormField(
                  controller: InputUtils.SEARCH_LOCATIONS,
                  onFieldSubmitted: (value) {},
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    counter: const SizedBox.shrink(),
                    hintText: "Search palces here ...",
                    labelStyle: TextStyle(color: HexColor("#133C58")),
                    hintStyle: GoogleFonts.poppins(
                        color: CoustomTheams.blackShade54,
                        fontSize: MediaQuery.of(context).size.width * 0.032,
                        fontWeight: FontWeight.w600),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: HexColor("#FFFFFF"), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: HexColor("#FFFFFF"), width: 1),
                    ),
                  ),
                  onChanged: (value) {
                    searchPlaces(value.toString());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
