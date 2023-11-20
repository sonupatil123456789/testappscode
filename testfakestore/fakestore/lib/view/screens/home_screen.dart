
import 'package:fakestore/controllers/auth_controllers.dart';
import 'package:fakestore/repository/firebase_realtime%20_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseRealTimeDatabase firebaseRealTimeDatabase =
      FirebaseRealTimeDatabase();

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

   return Consumer<AuthControllers>(builder: (BuildContext context, AuthControllers value, Widget? child) { 

     return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User id => ${value.loginUserData?.user?.uid.toString() }"?? ""),
            const SizedBox(height: 20,),
            Text("User phoneNumber => ${value.loginUserData!.user?.phoneNumber.toString() }"?? ""),
          ],
        ),
      ),
    );
    },);
  
  }
}
