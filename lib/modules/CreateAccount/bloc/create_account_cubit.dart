import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/modules/CreateAccount/bloc/create_account_state.dart';

class createAccountCubit extends Cubit<createAccountState>{
  createAccountCubit(): super(createAccountInitial());
  static createAccountCubit get(context) => BlocProvider.of(context);



  final List<IconMenu> title  =[
   IconMenu(iconName: Icons.http_sharp, titleIcon: 'UI/UX Designer') ,
   IconMenu(iconName: Icons.photo_camera_front, titleIcon: 'Illustrator Designer') ,
   IconMenu(iconName: Icons.html, titleIcon: 'Developer') ,
   IconMenu(iconName: Icons.manage_accounts, titleIcon: 'Management') ,
   IconMenu(iconName: Icons.lan_outlined, titleIcon: 'Information Technology') ,
   IconMenu(iconName: Icons.travel_explore_outlined, titleIcon: 'Research and Analytics') ,
  ];


}

class IconMenu {
  final IconData iconName;
  final String titleIcon;
  IconMenu({required this.iconName, required this.titleIcon});
}





