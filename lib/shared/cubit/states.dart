abstract class NewStates{}

class NewsInitialState  extends NewStates{}
class ChangeBottomNavBarState extends NewStates{
}
class GetBusinessSuccessState extends NewStates{}
class GetBusinessErrorState extends NewStates{
  final String error;
  GetBusinessErrorState(this.error);
}
class NewsLoadingState extends NewStates{}

class GetSportsSuccessState extends NewStates{}
class GetSportsErrorState extends NewStates{
  final String error;
  GetSportsErrorState(this.error);
}
class SportsLoadingState extends NewStates{}
class GetScienceSuccessState extends NewStates{}
class GetScienceErrorState extends NewStates{
  final String error;
  GetScienceErrorState(this.error);
}
class ScienceLoadingState extends NewStates{}
class ChangeModeState extends NewStates{}