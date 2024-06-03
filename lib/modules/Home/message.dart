import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/modules/Home/bloc/home_cubit.dart';
import 'package:jobsque/modules/Home/bloc/home_state.dart';
import 'package:jobsque/shared/components/components.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeState>(
        builder:(context, state) {
            var cubit = HomeCubit.get(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.fromBorderSide(BorderSide(
                                  color: Colors.grey
                              ))

                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.search_normal,
                                color: Colors.grey,
                              ),
                              contentPadding: const EdgeInsets.all(15),
                              border: InputBorder.none,
                              hintText: "Search Message ...",
                            ),
                          ),
                        ),
                      ),
                    ),//Search
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.fromBorderSide(
                                  BorderSide(
                                      color: Colors.grey
                                  )
                              )
                          ),
                          child: IconButton(
                              onPressed: (){
                                showModalBottomSheet(context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: double.infinity,
                                      height: 300,
                                      child:  Padding(
                                        padding: EdgeInsets.all(30),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Message filters',style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,

                                            ),),
                                            Divider(),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                  border: Border.fromBorderSide(BorderSide(
                                                      color: Colors.grey
                                                  ))

                                              ),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  suffixIcon: Icon(
                                                    Icons.keyboard_arrow_right_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                  contentPadding: const EdgeInsets.all(15),
                                                  border: InputBorder.none,
                                                  hintText: "Unread",
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                  border: Border.fromBorderSide(BorderSide(
                                                      color: Colors.grey
                                                  ))

                                              ),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  suffixIcon: Icon(
                                                    Icons.keyboard_arrow_right_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                  contentPadding: const EdgeInsets.all(15),
                                                  border: InputBorder.none,
                                                  hintText: "Spam",
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                  border: Border.fromBorderSide(BorderSide(
                                                      color: Colors.grey
                                                  ))

                                              ),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  suffixIcon: Icon(
                                                    Icons.keyboard_arrow_right_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                  contentPadding: const EdgeInsets.all(15),
                                                  border: InputBorder.none,
                                                  hintText: "Archived",
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },);
                              },
                              icon: Icon(
                                Iconsax.setting_4,
                                size: 30,
                              )),
                        ),
                      ),
                    ),//Notification Icon
                  ],
                ),//Header Search Bar
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                maxRadius: 25,
                                child: Stack(
                                  alignment: AlignmentDirectional.centerStart,
                                  children: [
                                    Image(
                                      image: AssetImage('assets/image/Twitter1.png'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                  ],
                )
              ],
            );
        },
        listener:(context, state) {}
    ),
    );

  }


}

