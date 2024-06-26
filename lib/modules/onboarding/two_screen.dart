import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class twoScreen extends StatelessWidget {
  // const twoScreen({super.key});

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
            Image(image: AssetImage('assets/image/bg2.png'),fit: BoxFit.cover),
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
                      TextSpan(text:'Hundreds of jobs are waiting for you to '),
                      TextSpan(text: 'join together\n',
                          style: TextStyle(
                            color: HexColor('#3366FF'),
                          )
                      ),
                      TextSpan(
                          text: '\nImmediately join us and start applying for the\njob you are interested in.',
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
