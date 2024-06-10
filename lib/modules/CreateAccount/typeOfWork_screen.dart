import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobsque/modules/CreateAccount/bloc/create_account_cubit.dart';
import 'package:jobsque/modules/CreateAccount/bloc/create_account_state.dart';
import 'package:jobsque/modules/CreateAccount/finish_register.dart';
import 'package:jobsque/shared/components/components.dart';
import 'package:jobsque/shared/components/constant.dart';

class typeOfWorkScreen extends StatelessWidget {
  // typeOfWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode _focusNode = FocusNode();
    bool focus = false;
    int _selectedItem = 0;
    int _selectedItem1 = 0;
    return BlocProvider(
      create: (BuildContext context) => createAccountCubit(),
      child: BlocConsumer<createAccountCubit, createAccountState>(
        builder: (context, state) {
          createAccountCubit cubit = createAccountCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              color: Colors.white,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:  HexColor('#FAFAFA'),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.fromBorderSide(BorderSide(
                                        color: _selectedItem == firstItemIndex ? HexColor('#3366FF') : HexColor('#D1D5DB'),
                                      ))
                                    ),
                                    child: InkWell(
                                        focusNode: _focusNode,
                                        onTap: () {
                                          cubit.toggleSelection(firstItemIndex);
                                          print(typOfWorkNewSelect(firstItemIndex));
                                        },

                                      child: Padding(
                                        padding: const EdgeInsets.all(25),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(100),
                                                border:  Border.fromBorderSide(BorderSide(
                                                  width: 1,
                                                  color: _selectedItem == firstItemIndex ? HexColor('#3366FF') : HexColor('#D1D5DB'),
                                                ),
                                                ),
                                              ) ,
                                              child: CircleAvatar(
                                                child: Icon(cubit
                                                    .title[firstItemIndex].iconName,
                                                  color: _selectedItem == firstItemIndex ? HexColor('#3366FF') : Colors.black,
                                                ) ,
                                                backgroundColor: HexColor('#FAFAFA'),
                                              ),
                                            ),
                                            Text(cubit
                                                .title[firstItemIndex].titleIcon , )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:  HexColor('#FAFAFA'),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.fromBorderSide(BorderSide(
                                          color: _selectedItem1 == secondItemIndex ? HexColor('#3366FF') : HexColor('#D1D5DB'),
                                        ))
                                    ),
                                    child: InkWell(
                                      focusNode: _focusNode,
                                      onTap: () {
                                        cubit.toggleSelection(secondItemIndex);

                                      },

                                      child: Padding(
                                        padding: const EdgeInsets.all(25),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                border:  Border.fromBorderSide(BorderSide(
                                                  width: 1,
                                                  color: _selectedItem1 == secondItemIndex ? HexColor('#3366FF') : HexColor('#D1D5DB'),
                                                ),
                                                ),
                                              ) ,
                                              child: CircleAvatar(
                                                child: Icon(cubit
                                                    .title[secondItemIndex].iconName,
                                                  color: _selectedItem1 == secondItemIndex ? HexColor('#3366FF') : Colors.black,
                                                ) ,
                                                backgroundColor: HexColor('#FAFAFA'),
                                              ),
                                            ),
                                            Text(cubit
                                                .title[secondItemIndex].titleIcon , )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: HexColor('#3366FF'),
                            ),
                            onPressed: (){
                              // if (formKey.currentState!.validate()) {
                              //     cubit.register(
                              //         name: nameController.text,
                              //         email: emailController.text,
                              //         password: passwordController.text
                              //     );
                                  navigateTo(context, finishRegister());
                              // }

                              // navigateTo(context, typeOfWorkScreen());
                            },
                            child: Text('Next',
                              style: TextStyle(
                                color: HexColor('#FFFFFF'),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if(state is typOfWorkNewSelect){
            print(state.index);
              _selectedItem = state.index;
              _selectedItem1 = state.index;
          }
        },
      ),
    );
  }
}
