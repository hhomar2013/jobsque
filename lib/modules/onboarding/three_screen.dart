import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class threeScreen extends StatelessWidget {
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
            Image(image: AssetImage('assets/image/bg3.png'),fit: BoxFit.cover),
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
                      TextSpan(text:'Get the best '),
                      TextSpan(text: 'choice for\nthe job ',
                          style: TextStyle(
                            color: HexColor('#3366FF'),
                          )
                      ),
                      TextSpan(text: "you've always dreamed of\n"),
                      TextSpan(
                          text: '\nThe better the skills you have, the\ngreater the good job opportunities for you.',
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
