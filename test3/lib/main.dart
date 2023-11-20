import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/controllers/user_controller.dart';
import 'package:test1/utils/routes/routes.dart';
import 'package:test1/utils/routes/routes_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserController()),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        initialRoute: RoutesName.app,
        onGenerateRoute: Routes.generateRoutes,
        // home: App(),
      ),
    );
  }
}
// hcjcwcnckjnc