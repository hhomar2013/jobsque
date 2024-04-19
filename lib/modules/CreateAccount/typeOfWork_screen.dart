import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobsque/modules/CreateAccount/bloc/create_account_cubit.dart';
import 'package:jobsque/modules/CreateAccount/bloc/create_account_state.dart';

class typeOfWorkScreen extends StatelessWidget {
  typeOfWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => createAccountCubit(),
      child: BlocConsumer<createAccountCubit, createAccountState>(
        builder: (context, state) {
          createAccountCubit cubit = createAccountCubit.get(context);
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'What type of work are you interested in?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Tell us what you’re interested in so we can customise the app for your needs.',
                      style: TextStyle(
                        color: HexColor('#737379'),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: (cubit.title.length / 2).ceil(),
                        itemBuilder: (context, index) {
                          final firstItemIndex = index * 2;
                          final secondItemIndex = firstItemIndex + 1;

                          return Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    print(state);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Icon(cubit
                                              .title[firstItemIndex].iconName),
                                          Text(cubit
                                              .title[firstItemIndex].titleIcon)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(

                                child: secondItemIndex <
                                    cubit.title.length
                                    ? InkWell(

                                  onTap: () {
                                      emit(createAccountChangeColor());
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // color: isMale ? Colors.blue : Colors.black38 ,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Card(
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Icon(cubit
                                                .title[secondItemIndex]
                                                .iconName),
                                            Text(cubit
                                                .title[secondItemIndex]
                                                .titleIcon)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                    : Container(), // Return an empty container if second item index is out of bounds
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
