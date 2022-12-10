import 'package:flutter/material.dart';
import 'package:shopapp/constants/global_variable.dart';
import 'package:shopapp/features/auth/screens/auth_screen.dart';
import 'package:shopapp/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
        colorScheme:const ColorScheme.light(
          primary: GlobalVariable.secondaryColor
        ),
        scaffoldBackgroundColor: GlobalVariable.backgroundColor,
        appBarTheme: const AppBarTheme(elevation: 0,
        iconTheme: IconThemeData(

          color: Colors.black
        )
        )
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: const AuthScreen(),
    );
  }
}
