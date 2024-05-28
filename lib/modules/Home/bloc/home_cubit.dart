import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/userModel.dart';
import 'package:jobsque/modules/Home/HomeScreen.dart';
import 'package:jobsque/modules/Home/applied.dart';
import 'package:jobsque/modules/Home/bloc/home_state.dart';
import 'package:jobsque/modules/Home/message.dart';
import 'package:jobsque/modules/Home/profile.dart';
import 'package:jobsque/modules/Home/saved.dart';
import 'package:jobsque/shared/components/constant.dart';
import 'package:jobsque/shared/network/dio_helper.dart';

class HomeCubit extends Cubit<HomeState> {
    HomeCubit() : super(HomeInitial());
    static HomeCubit get(context) => BlocProvider.of(context);
    List<dynamic> user=[];
    int currentIndex = 0;
    List<Map> SuggestJob = [];
    List<Widget> screens = [
      HomeScreen(),
      MessageScreen(),
      AppliedScreen(),
      SavedScreen(),
      ProfileScreen(),
    ];

    void changeBottomNav(int index){
      currentIndex = index;
      emit(HomeChangeBottomNav());
    }
    late UserModel model;
    var token = uId.toString();
    void profile(){
      DioHelper.getData1(token: token,
          url: '/auth/profile',
      ).then((value){
        // print(value.data);
        model = UserModel.formJson(value.data);
        // print(model);


      }).catchError((error){
        emit(HomeGetUserErrorState(error.toString()));
      });
    }



    void get_suggJob(){
      DioHelper.getData1(
       token: uId,
          url:'/jobs/sugest/2'
      ).then((value) {
        SuggestJob.add(value.data['data']);
        emit(HomeGetListSuccess());

      });
    }



}

