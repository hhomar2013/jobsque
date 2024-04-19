import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobsque/modules/CreateAccount/createAccount_screen.dart';
import 'package:jobsque/shared/components/components.dart';
import 'package:jobsque/shared/components/constant.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image(
                image: AssetImage("assets/image/Logo.png"),
                width: 100,
                height: 50
            ),
          )
        ],
        // leading: IconButton(
        //   onPressed: (){
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.arrow_back),
        // ),

      ),
      body: createAccountScreen(),
    );
  }
}
