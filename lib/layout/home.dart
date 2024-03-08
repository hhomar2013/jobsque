import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: Image(
            image: AssetImage("assets/image/Logo.png"),
              width: 81,
              height: 19
          ),
        ),leadingWidth: 150,
      ),
    );
  }
}
