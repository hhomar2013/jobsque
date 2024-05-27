abstract class createAccountState {}
class createAccountInitial extends createAccountState{}
class createAccountChangeColor extends createAccountState{}
class createAccountLoadingState extends createAccountState{}
class createAccountSuccessState extends createAccountState{
}
class createAccountErrorState extends createAccountState{
  final String onError;
  createAccountErrorState(this.onError);
}
