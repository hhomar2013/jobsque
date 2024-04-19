import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sqflite/utils/utils.dart';

class oneScreen extends StatelessWidget {
  // const oneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(image: AssetImage('assets/image/Background.png'),fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(15),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color:  Colors.black
                  ),
                  children: <TextSpan>[
                    TextSpan(text:'Find a job, and '),
                    TextSpan(text: 'start building',
                    style: TextStyle(
                      color: HexColor('#3366FF'),
                    )
                    ),
                    TextSpan(text: ' your career\nfrom now on\n'),
                    TextSpan(
                      text: '\nExplore over 25,924 available job roles and\nupgrade your operation now.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      )
                    )
                  ]
                ),
              ),
            ) ,

          ],

        ),
      ),

    );
  }
}
