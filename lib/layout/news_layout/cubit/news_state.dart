part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}
final class BottomNavBarState extends NewsState {}
final class ChangeAppModeState extends NewsState {}
final class NewsBusinessLoading extends NewsState {}
final class BusinessSuccessState extends NewsState {}
final class BusinessErrorState extends NewsState {
  final String error;

  BusinessErrorState(this.error);
}

final class NewsSportsLoading extends NewsState {}
final class SportsSuccessState extends NewsState {}
final class SportsErrorState extends NewsState {
  final String error;

  SportsErrorState(this.error);
}

final class NewsScienceLoading extends NewsState {}
final class ScienceSuccessState extends NewsState {}
final class ScienceErrorState extends NewsState {
  final String error;

  ScienceErrorState(this.error);
}



final class NewsSearchLoading extends NewsState {}
final class SearchSuccessState extends NewsState {}
final class SearchErrorState extends NewsState {
  final String error;

  SearchErrorState(this.error);
}



