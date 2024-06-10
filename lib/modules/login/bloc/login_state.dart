abstract class loginState {}
class loginInitial extends loginState{}
class loginChangeColor extends loginState{}
class loginLoadingState extends loginState{}
class loginSuccessState extends loginState{
  final  String uId;
  loginSuccessState(this.uId);
}
class loginCheckedState extends loginState{}
class loginErrorState extends loginState{
  final String onError;
  loginErrorState(this.onError);
}
