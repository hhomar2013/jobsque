import 'package:jobsque/model/jobsModel.dart';

abstract class HomeState{}
class HomeInitial extends HomeState{}
class HomeLoadingState extends HomeState{}
class HomeChangeBottomNav extends HomeState{}
class HomeGetUserSuccessState extends HomeState{}
class HomeGetUserErrorState extends HomeState{
  final error ;
  HomeGetUserErrorState(this.error);
}
class HomeGetListSuccess extends HomeState{
  // final jobsModel jobModel;
  // HomeGetListSuccess(this.jobModel);
}

class HomeErrorAuth extends HomeState{}
class HomeSavedJobsSuccessState extends HomeState{}
class HomeSavedJobsErrorState extends HomeState{
  final error ;
  HomeSavedJobsErrorState(this.error);
}