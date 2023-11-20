import 'dart:collection';
import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bluetooth_app/Homepage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// const String Brandlogo = 'assets/Logo.svg';

String Name = 'Shreyas Patil';
String Imagepath = "";
int Number = 2343234678;

final ImagePicker imgpicker = ImagePicker();
String base64string = "";

int? Getphoneno;
String? GetName = "";
String? Getprofilepicture;

class Fill_details extends StatefulWidget {
  const Fill_details({Key? key}) : super(key: key);

  @override
  State<Fill_details> createState() => _Fill_detailsState();
}

class _Fill_detailsState extends State<Fill_details> {
  @override
  void initState() {
    super.initState();
    setlocalstoragedata();
  }

  openImage() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if (pickedFile != null) {
        Imagepath = pickedFile.path;
        File imagefile = File(Imagepath); //convert Path to File
        Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
        base64string =
            base64.encode(imagebytes); //convert bytes to base64 string
        WidgetsFlutterBinding.ensureInitialized();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('Onboarding', false);
        await prefs.setInt('Phoneno', Number);
        await prefs.setString('Name', Name);
        await prefs.setString('Image', base64string);
        print("this is decoded $GetName ");
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  setlocalstoragedata() async {
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    Getprofilepicture = prefs.getString('Image');
    Getphoneno = prefs.getInt('Phoneno');
    GetName = prefs.getString('Name');
    print(Getprofilepicture);
    setState(() {});

    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return Home_page(Myname: null, Mynumber: null, Mypic: null);
    // }));
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: screenwidth * 0.86,
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Creat",
                    style: TextStyle(
                        color: HexColor("#000000"),
                        fontSize: 46,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Account",
                    style: TextStyle(
                        color: HexColor("#000000"),
                        fontSize: 46,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 320,
                    height: 600,
                    color: Colors.amber,
                    child: Column(children: [
                      buildTextField(
                          'Enter Your Email Here...', false, 'remove_red_eye'),
                      const SizedBox(height: 40),
                      buildTextField2('Enter Your Password Here...', true,
                          'remove_red_eye'),
                      const SizedBox(height: 28),
                      GestureDetector(
                        onTap: () {},
                        child: GestureDetector(
                          onTap: () => openImage(),
                          // onTap: () {},
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Forgot password",
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 50),
                          primary: Color.fromARGB(255, 107, 255, 77),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () => setlocalstoragedata(),
                        // onPressed: () =>
                        child: const Text(
                          'Log In',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      // Text(GetName!),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: (Getprofilepicture != null
                              ? Image.memory(
                                  base64Decode(Getprofilepicture!),
                                  fit: BoxFit.cover,
                                  // width: 40,
                                  // height: 40,
                                )
                              : Text("data loading")),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget buildTextField(
      String placeholder, bool isPasswordTextField, String icname) {
    return TextField(
        autocorrect: true,
        decoration: InputDecoration(
          hintText: placeholder,
          suffixIcon: Icon(
            Icons.emoji_people,
            color: HexColor('#1FAEFF'),
          ),
          hintStyle: TextStyle(color: HexColor("#636363")),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            // borderSide: BorderSide(color: Colors.black26, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            // borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2),
          ),
        ));
  }

  Widget buildTextField2(
      String placeholder, bool isPasswordTextField, String icname) {
    return TextField(
        autocorrect: true,
        decoration: InputDecoration(
          hintText: placeholder,
          suffixIcon: Icon(
            Icons.phone_forwarded,
            color: HexColor('#1FAEFF'),
          ),
          hintStyle: TextStyle(color: HexColor("#636363")),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            // borderSide: BorderSide(color: Colors.black26, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            // borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2),
          ),
        ));
  }
}
