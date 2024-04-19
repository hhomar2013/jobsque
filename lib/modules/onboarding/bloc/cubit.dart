import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/modules/onboarding/bloc/state.dart';
import 'package:jobsque/modules/onboarding/on_screen.dart';
import 'package:jobsque/modules/onboarding/three_screen.dart';
import 'package:jobsque/modules/onboarding/two_screen.dart';

class onBoardingCubit extends Cubit<onBoardingState>{
  onBoardingCubit() : super(onBoardingInitial());
  static onBoardingCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> Screens = [
    oneScreen(),
    twoScreen(),
    threeScreen(),
  ];

  void skip_btn(int index){
    print(index);
    emit(onBoardingSkip(index));
    emit(onBoardingNextState(index));
  }

  void nextPage(){
    currentIndex++;
    emit(onBoardingNextState(currentIndex));
  }
}