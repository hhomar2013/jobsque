import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi, Rafif Dian👋',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      Text('Create a better future for yourself here',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:20),
                        child: Container(
                          child: IconButton(onPressed: () {

                          }, icon: Icon(
                              Icons.notifications_outlined,
                            size: 30,
                            ),

                          ),
                            decoration:BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: HexColor('#D1D5DB'),
                              ),
                              borderRadius:  BorderRadius.circular(50)
                            ) ,

                        ),
                      )



                    ],
                  ))
            ],
          ),
        )
      ],
    );
  }
}
