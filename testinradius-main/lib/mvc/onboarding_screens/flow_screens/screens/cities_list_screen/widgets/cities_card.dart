import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/cities_list_screen/cities_list_screen_controller.dart';
import 'package:test/theams/coustom_theams.dart';

class CitiesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;

    return Consumer<CitiesListScreenController>(
      builder:
          (BuildContext context, CitiesListScreenController cityScreenValue, Widget? child) {
        final locationData = cityScreenValue.getAllLocation.allLocations;

        if (locationData != null) {
          if (locationData.isEmpty) {
            return Text("No data",
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.black87,
                ));
          }

          return GridView.builder(
            physics: locationData.length <= 5
                ? const NeverScrollableScrollPhysics()
                : null,
            itemCount: locationData.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  cityScreenValue.selectedCardValue(index);
                  cityScreenValue.cityName = locationData[index].location as String;
                  cityScreenValue.cityId = locationData[index].sId as String;
                },
                child: Container(
                  height: hight * 0.16,
                  width: width * 0.20,
                  decoration: BoxDecoration(
                      color: cityScreenValue.selectedValue == index
                          ? CoustomTheams.accentColor
                          : CoustomTheams.white,
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        // CoustomTheams.cityCardBoxShadow,
                        BoxShadow(
                          color: const Color(0xd6d6d6).withOpacity(0.7),
                          offset: const Offset(2, 3),
                          blurRadius: 12,
                          spreadRadius: 4,
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(locationData[index].location.toString(),
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.03,
                            color: cityScreenValue.selectedValue == index
                                ? Colors.white
                                : Colors.black87,
                          ))
                    ],
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // number of items in each row
              mainAxisSpacing: 8.0, // spacing between rows
              crossAxisSpacing: 8.0, // spacing between columns
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: CoustomTheams.accentColor,
            ),
          );
        }
      },
    );
  }
}
