import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/select_cordinates_screen/map_detail_page.dart';
import 'package:test/theams/coustom_theams.dart';

class CoustomGoogleMapView extends StatefulWidget {
  const CoustomGoogleMapView({super.key});

  @override
  State<CoustomGoogleMapView> createState() => _CoustomGoogleMapViewState();
}

class _CoustomGoogleMapViewState extends State<CoustomGoogleMapView> {

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
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Padding(
                padding: const EdgeInsets.only(top: 14),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const MapDetailsPage();
                    }));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    width: width * 0.70,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: CoustomTheams.white),
                    child: Text(
                      "Search palces here ...",
                      style: GoogleFonts.poppins(
                          color: CoustomTheams.blackShade54,
                          fontSize: MediaQuery.of(context).size.width * 0.032,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
