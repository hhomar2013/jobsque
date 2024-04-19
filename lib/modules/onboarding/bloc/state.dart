abstract class onBoardingState{}
class onBoardingInitial extends onBoardingState{}
class onBoardingSkip extends onBoardingState{
  final int currentIndex;
  onBoardingSkip(this.currentIndex);
}
class onBoardingNextState extends onBoardingState{
  final int currentIndex;
  onBoardingNextState(this.currentIndex);
}