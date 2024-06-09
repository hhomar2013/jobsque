import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobsque/modules/login/login_screen.dart';
import 'package:jobsque/shared/components/components.dart';

class finishRegister extends StatelessWidget {
  const finishRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/image/sai.png')),
          Text('Your account has been set up!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text('We have customized feeds according to your preferences',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: HexColor('#6B7280')
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
          child: Padding(
          padding: const EdgeInsets.all(5),
      child:   ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: HexColor('#3366FF'),
          ),
          onPressed: (){
            navigateTo(context, loginScreen());

          },
          child: Text('Next',
            style: TextStyle(
              color: HexColor('#FFFFFF'),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ))
          ),
      )
    );
  }
}
