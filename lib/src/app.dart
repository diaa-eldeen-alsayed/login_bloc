import 'package:flutter/material.dart';
import 'Screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider(
      child: MaterialApp(
        title: "Log me in",
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }

}