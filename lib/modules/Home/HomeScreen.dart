import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/model/userModel.dart';
import 'package:jobsque/modules/Home/bloc/home_cubit.dart';
import 'package:jobsque/modules/Home/bloc/home_state.dart';
import 'package:jobsque/shared/components/components.dart';
import 'package:jobsque/shared/components/constant.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // print(uId);
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..get_suggJob(),
      child: BlocConsumer<HomeCubit,HomeState>(
    builder: (context, state) {
      var cubit = HomeCubit.get(context);
      var suggJob = cubit.SuggestJob[0];
      return Scaffold(


        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi, 👋',
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
                  ), // Welcome Text
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20),
                            child: Container(
                              child: IconButton(onPressed: () {
                                  print('notification');
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
                      )),
                  // Notification icon
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#D1D5DB'),

                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: "Search...",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    prefix: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Iconsax.search_normal,
                        color: Colors.black,
                      ),
                    ),



                  )
              ),
            ),
            Row(
              children: [
                Expanded(

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Suggested Job',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          ),
                        ],
                      ),
                    )
                ),
                Expanded(

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: () {
                            print('View all');
                          },child: Text('View all',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
            Container(
              height: 220,
              margin:  EdgeInsets.symmetric(vertical: 20),
              child: ListView.separated(
                itemCount: cubit.SuggestJob.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) =>   Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 16),
                  child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: 18,vertical: 16),
                    width: 300,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: HexColor('#091A7A'),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Expanded(

                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Image(
                                    height: 30,
                                    width: 30,
                                      image: NetworkImage(
                                        suggJob['image'],
                                      ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:5,vertical: 15),
                              child: Expanded(

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      suggJob['name'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      suggJob['comp_name'] + '.',
                                      style: TextStyle(
                                        color: HexColor('#9CA3AF'),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 23,right: 6),
                              child: Container(
                                height: 30,
                                width: 87,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white12,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      suggJob['job_time_type'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Container(
                                height: 30,
                                width: 87,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white12,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      suggJob['job_type'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text(

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                    suggJob['salary'].toString(),
                                  ),
                                  Text(
                                    '/Month',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: HexColor('#3366FF'),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: TextButton(
                                            onPressed: () {

                                            },
                                            child: Text('Apply Now', style: TextStyle(
                                              color: Colors.white
                                            ),)),
                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20 ),
                    child: Text('Recent Job',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {
                          print('View all');
                        },child: Text('View all',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),


          ],
        ),
      );
    }, listener: (context, state) {

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 16),
        //   child: Container(
        //     height: 183,
        //     width: 300,
        //     decoration: BoxDecoration(
        //       color: HexColor('#091A7A'),
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //   ),
        // );

      }),

    );

  }
}



