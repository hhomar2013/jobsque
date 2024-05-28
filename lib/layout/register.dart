import 'package:flutter/material.dart';
import 'package:jobsque/modules/CreateAccount/createAccount_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
