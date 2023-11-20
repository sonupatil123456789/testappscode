import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:test1/controllers/user_controller.dart';
import 'package:test1/utils/routes/routes_name.dart';

import '../../utils/input_field_utils.dart';
import '../components/card.dart';
import '../components/card2.dart';
import '../components/coustom_textfield.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List Categories = [
  "smartphones",
  "laptops",
  "fragrances",
];

class _MainScreenState extends State<MainScreen> {
  late UserController userController = UserController();

  @override
  void initState() {
    userController = Provider.of<UserController>(context, listen: false);
    userController.getAllUsersController(context);

    super.initState();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: DefaultTabController(
        length: Categories.length,
        child: Scaffold(
          key: scaffoldKey,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: HexColor("#0D2A3C"),
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                  ),
                  title: const Text('Page 1'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.train,
                  ),
                  title: const Text('Page 2'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: FloatingActionButton(
            // isExtended: true,
            child: Icon(Icons.add),
            backgroundColor: HexColor("#0D2A3C"),
            onPressed: () {},
          ),
          appBar: AppBar(
            backgroundColor: HexColor("#0D2A3C"),
            leading: InkWell(
              onTap: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                } else {
                  scaffoldKey.currentState!.openDrawer();
                }
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            flexibleSpace: Container(
              // color: Colors.blueAccent,
              height: screenhight * 0.06,
              child: Row(
                children: [
                  Container(
                    width: screenwidth * 0.15,
                    height: screenhight * 0.06,
                  ),
                  Container(
                    width: screenwidth * 0.70,
                    height: screenhight * 0.055,
                    // color: const Color.fromARGB(255, 68, 255, 165),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Howdy Shreyas patil !!",
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w500,
                              fontSize: screenwidth * 0.036,
                              color: HexColor('#FDFDFB')),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: screenwidth * 0.03,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Veena nagar khopoli",
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w300,
                                  fontSize: screenwidth * 0.030,
                                  color: HexColor('#FDFDFB')),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.refine);
                    },
                    child: Container(
                      width: screenwidth * 0.15,
                      height: screenhight * 0.06,
                      child: Icon(
                        Icons.rule,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                width: screenwidth,
                color: HexColor("#133C58"),
                height: screenhight * 0.06,
                child: TabBar(
                    onTap: (value) {
                      print(value);
                    },
                    tabs: List.generate(
                      Categories.length,
                      (index) => Tab(
                        child: Text(
                          Categories[index],
                          style: TextStyle(
                              fontSize: screenwidth * 0.038,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 195, 195, 195)),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: screenhight * 0.01,
              ),
              Container(
                height: screenhight * 0.04,
                width: screenwidth,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenwidth * 0.80,
                      child: TextFormField(
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          onFieldSubmitted: (String value) {},
                          autocorrect: true,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          validator: (value) {},
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: 'Search here',
                            // labelText: labelText,
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 148, 148, 148)),
                            hintStyle: TextStyle(color: HexColor("#636363")),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: HexColor("#133C58"), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: HexColor("#133C58"), width: 1),
                            ),
                          )),
                    ),
                    Container(
                      width: screenwidth * 0.10,
                      height: screenhight * 0.04,
                      child: Icon(
                        Icons.tune,
                        color: HexColor("#0D2A3C"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    /////////////// tab 1
                    Consumer<UserController>(
                      builder: (BuildContext context, value, Widget? child) {
                        // print("value : ${value.products}");

                        var dataListLength = value.users.users;

                        if (value.loading == true || dataListLength == null) {
                          return Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                color: HexColor('#133C58'),
                              ));
                        } else {
                          if (dataListLength.length == 0 ||
                              dataListLength == null) {
                            return Center(
                              child: Text("No data"),
                            );
                          } else {
                            return Container(
                                width: screenwidth,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: value.users.users!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var items = value.users.users![index];
                                    return Card2(
                                        MId: items.id.toString(),
                                        thumbnailImage: items.image.toString(),
                                        title: items.firstName.toString() +
                                            " " +
                                            items.lastName.toString(),
                                        discription: items.company!.department
                                            .toString(),
                                        progressBar: items
                                            .address!.coordinates!.lat as num,
                                        address: items.address!.city.toString(),
                                        age: items.age as num,
                                        univercity:
                                            items.university.toString());
                                  },
                                ));
                          }
                        }
                      },
                    ),

                    ///  tab 2
                    Consumer<UserController>(
                      builder: (BuildContext context, value, Widget? child) {
                        // print("value : ${value.products}");

                        var dataListLength = value.users.users;

                        if (value.loading == true || dataListLength == null) {
                          return Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                color: HexColor('#133C58'),
                              ));
                        } else {
                          if (dataListLength.length == 0 ||
                              dataListLength == null) {
                            return Center(
                              child: Text("No data"),
                            );
                          } else {
                            return Container(
                                width: screenwidth,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: value.users.users!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var items = value.users.users![index];
                                    return Card2(
                                        MId: items.id.toString(),
                                        thumbnailImage: items.image.toString(),
                                        title: items.firstName.toString() +
                                            " " +
                                            items.lastName.toString(),
                                        discription: items.company!.department
                                            .toString(),
                                        progressBar: items
                                            .address!.coordinates!.lat as num,
                                        address: items.address!.city.toString(),
                                        age: items.age as num,
                                        univercity:
                                            items.university.toString());
                                  },
                                ));
                          }
                        }
                      },
                    ),
                    //////////// tab 3
                    Consumer<UserController>(
                      builder: (BuildContext context, value, Widget? child) {
                        var dataListLength = value.users.users;
                        if (value.loading == true || dataListLength == null) {
                          return Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                color: HexColor('#133C58'),
                              ));
                        } else {
                          if (dataListLength.length == 0 ||
                              dataListLength == null) {
                            return Center(
                              child: Text("No data"),
                            );
                          } else {
                            return Container(
                                width: screenwidth,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: value.users.users!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var items = value.users.users![index];
                                    return Card1(
                                        MId: items.id.toString(),
                                        thumbnailImage: items.image.toString(),
                                        title: items.firstName.toString() +
                                            " " +
                                            items.lastName.toString(),
                                        discription: items.company!.department
                                            .toString(),
                                        progressBar: items
                                            .address!.coordinates!.lat as num,
                                        address: items.address!.city.toString(),
                                        age: items.age as num,
                                        univercity:
                                            items.university.toString());
                                  },
                                ));
                          }
                        }
                      },
                    )
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
