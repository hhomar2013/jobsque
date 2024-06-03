import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/modules/CreateAccount/bloc/create_account_cubit.dart';
import 'package:jobsque/modules/CreateAccount/createAccount_screen.dart';
import 'package:jobsque/modules/CreateAccount/typeOfWork_screen.dart';
import 'package:jobsque/modules/Home/HomeScreen.dart';
import 'package:jobsque/modules/Home/bloc/home_cubit.dart';
import 'package:jobsque/modules/Home/bloc/home_state.dart';
import 'package:jobsque/modules/login/login_screen.dart';
import 'package:jobsque/shared/components/components.dart';
import 'package:jobsque/shared/components/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> HomeCubit.get(context)..get_suggJob()..profile(),
      child: BlocConsumer<HomeCubit,HomeState>(
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            key: scaffoldState,
            resizeToAvoidBottomInset: false,
              appBar: AppBar(

              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(15),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  elevation:0,
                  selectedItemColor: HexColor('#3366FF'),
                  type: BottomNavigationBarType.fixed,
                  currentIndex: cubit.currentIndex ,
                  onTap: (value) {
                    cubit.changeBottomNav(value);
                  },
                  items: [
                    BottomNavigationBarItem(icon: Icon(Iconsax.home) ,label: 'Home'),
                    BottomNavigationBarItem(icon: Icon(Iconsax.message) ,label: 'message'),
                    BottomNavigationBarItem(icon: Icon(Iconsax.briefcase) ,label: 'Applied'),
                    BottomNavigationBarItem(icon: Icon(Iconsax.archive_1) ,label: 'Saved'),
                    BottomNavigationBarItem(icon: Icon(Iconsax.profile_tick) ,label: 'Profile'),
                  ],
                ),
              )

          );
      }, listener: (context, state) async {
        // if  (state is HomeGetUserErrorState){
        //   SharedPreferences prefrences = await SharedPreferences.getInstance();
        //   // await prefrences.clear();
        //   await prefrences.remove('uId');
        //
        //   navigateTo(context, loginScreen());
        // }
      },),
    );



  }

}



