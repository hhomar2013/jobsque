import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/modules/CreateAccount/bloc/create_account_state.dart';
import 'package:jobsque/shared/components/constant.dart';
import 'package:jobsque/shared/network/dio_helper.dart';
import 'package:jobsque/shared/network/local/cash_helper.dart';

class createAccountCubit extends Cubit<createAccountState>{
  createAccountCubit(): super(createAccountInitial());
  static createAccountCubit get(context) => BlocProvider.of(context);
  final List<dynamic> user =[];
  // Register
  void register({
    required String name,
    required String email,
    required String password,
}) {
    emit(createAccountLoadingState());
    DioHelper.postData(
        url: '/auth/register',
        data: {'name': name, 'email': email, 'password': password}
    ).then((value) {
      emit(createAccountSuccessState());
      CacheHelper.saveData(key: 'token', value: value.data['token']);
      print(value);
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(createAccountErrorState((error.toString())));
    });
  }

  void get_token(){
       uId.toString();
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








