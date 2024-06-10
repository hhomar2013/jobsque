import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/modules/CreateAccount/bloc/create_account_state.dart';
import 'package:jobsque/modules/login/bloc/login_state.dart';
import 'package:jobsque/shared/components/components.dart';
import 'package:jobsque/shared/components/constant.dart';
import 'package:jobsque/shared/network/dio_helper.dart';
import 'package:jobsque/shared/network/local/cash_helper.dart';

class LoginCubit extends Cubit<loginState>{
  LoginCubit(): super(loginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool? isChecked =false;
  final List<dynamic> user =[];
  // Register
  void login({

    required String email,
    required String password,
}) {
    emit(loginLoadingState());
    DioHelper.postData(
        url: '/auth/login',
        data: {'email': email, 'password': password}
    ).then((value) {
      CacheHelper.saveData(key: 'token', value: value.data['token']);
      emit(loginSuccessState());


    }).onError((error, stackTrace) {
      print(error.toString());
      emit(loginErrorState((error.toString())));
    });
  }


    void isCheckedChange(bool value){
      emit(loginLoadingState());
        isChecked = value;
        emit(loginCheckedState());
    }


  final List<IconMenu> title  =[
   IconMenu(iconName: Icons.abc_outlined, titleIcon: 'UI/UX Designer') ,
   IconMenu(iconName: Icons.photo_camera_front, titleIcon: 'Illustrator Designer') ,
   IconMenu(iconName: Icons.html, titleIcon: 'Developer') ,
   IconMenu(iconName: Icons.manage_accounts, titleIcon: 'Management') ,
   IconMenu(iconName: Icons.lan_rounded, titleIcon: 'Information Technology') ,
   IconMenu(iconName: Icons.travel_explore_outlined, titleIcon: 'Research and Analytics') ,
  ];


}


class IconMenu {
  final IconData iconName;
  final String titleIcon;
  IconMenu({required this.iconName, required this.titleIcon});
}








