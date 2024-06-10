import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/jobsModel.dart';
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
    List<Map> user=[];
    int currentIndex = 0;
    int salary = 0;
    String userName = '';
    List<Map> SuggestJob = [];
    List<Map> allJobs = [];
    List<Widget> screens = [
      HomeScreen(),
      MessageScreen(),
      AppliedScreen(),
      SavedScreen(),
      ProfileScreen(),
    ];
    List <String> pageTitle = [
      'Home',
      'Message',
      'Applied',
      'Saved',
      'Profile',
    ];
    void changeBottomNav(int index){
      currentIndex = index;
      emit(HomeChangeBottomNav());
    }
    late UserModel model_Profile;
    var token = uId.toString();
    void profile(){
      user = [];
      userName = '';
      DioHelper.getData1(token: token,
          url: '/auth/profile/',
      ).then((value){
        emit(HomeGetUserSuccessState());
        model_Profile = UserModel.formJson(value.data['data']);

        value.data['data'].forEach((element){
          user.add(element);
        });

        userName =  model_Profile.name;
        print(user);

      }).catchError((error){
        emit(HomeGetUserErrorState(error.toString()));
        print(error.toString());
      });
    }
    // late jobsModel jobModel;
    void get_suggJob() {
      SuggestJob = [];
      emit(HomeLoadingState());

      DioHelper.getData1(
          token: token,
          url: '/jobs'
      ).then((value) {
        emit(HomeGetListSuccess());
        value.data['data'].forEach((element){
          SuggestJob.add(element);
        });
      });
    }


    void get_all_jobs() {
      allJobs = [];
      emit(HomeLoadingState());

      DioHelper.getData1(
          token: token,
          url: '/jobs/sugest/4'
      ).then((value) {
        emit(HomeGetListSuccess());
        value.data['data'].forEach((element){
          allJobs.add(element);
        });
        print(allJobs);
      });
    }


    void savedJobs(int jobId){
     DioHelper.postData1(
       token: uId.toString(),
         url: '/favorites',
         data: {
           'job_id' : jobId,
           'like' : 1,
         }).then((value) {
        emit(HomeSavedJobsSuccessState());

     });
    }


    String formatNumber(int number) {
      if (number >= 1000) {
        return (number / 1000).toStringAsFixed(1) + ' k';
      }
      return number.toString();
    }

  void checkuId(){
      if(token == ''){
        emit(HomeErrorAuth());
      }else{
        emit(HomeGetListSuccess());
      }
  }

}



