import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/modules/Home/HomeScreen.dart';
import 'package:jobsque/modules/Home/applied.dart';
import 'package:jobsque/modules/Home/bloc/home_state.dart';
import 'package:jobsque/modules/Home/message.dart';
import 'package:jobsque/modules/Home/profile.dart';
import 'package:jobsque/modules/Home/saved.dart';

class HomeCubit extends Cubit<HomeState> {
    HomeCubit() : super(HomeInitial());
    static HomeCubit get(context) => BlocProvider.of(context);
    int currentIndex = 0;
    List<Widget> screens = [
      HomeScreen(),
      MessageScreen(),
      AppliedScreen(),
      SavedScreen(),
      ProfileScreen(),
    ];

}
