import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/network/local/cache_helper.dart';

import '../../../network/remote/dio_helper.dart';
import '../../../pages/business_screen/business_screen.dart';
import '../../../pages/science_screen/science_screen.dart';
import '../../../pages/sports_screen/sports_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeIndex(index) {
    currentIndex = index;
    if (currentIndex==1){
     getSportsData();
    }
    if (currentIndex==2){
      getScienceData();
    }
    emit(BottomNavBarState());
  }

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> navBarItem = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getBusinessData() {
    emit(NewsBusinessLoading());
    DioHelper.getData(
      url: 'v2/top-headlines', 
      queryParameters: {
      'country': 'us',
      'category': 'business',
      'apiKey': 'cce9f2fc06dc41e396743236958178c8',
    }).then((value) {
      //print(value.data.toString());
      business=value.data['articles'];
      //print(business[0]['author']);
      emit(BusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(BusinessErrorState(error.toString()));
    });
  }

  void getSportsData() {
    emit(NewsSportsLoading());
    if (sports.isEmpty){
     DioHelper.getData(
      url: 'v2/top-headlines', 
      queryParameters: {
      'country': 'us',
      'category': 'sports',
      'apiKey': 'cce9f2fc06dc41e396743236958178c8',
    }).then((value) {
      //print(value.data.toString());
      sports=value.data['articles'];
      //print(business[0]['author']);
      emit(SportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SportsErrorState(error.toString()));
    });
    }else{
       emit(SportsSuccessState());
    }
 
  }

  void getScienceData() {
    emit(NewsScienceLoading());
    if (science.isEmpty){
DioHelper.getData(
      url: 'v2/top-headlines', 
      queryParameters: {
      'country': 'us',
      'category': 'science',
      'apiKey': 'cce9f2fc06dc41e396743236958178c8',
    }).then((value) {
      //print(value.data.toString());
      science=value.data['articles'];
      //print(business[0]['author']);
      emit(ScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ScienceErrorState(error.toString()));
    });
    }else{
       emit(ScienceSuccessState());
    }
    
  }


  void getSearchData(String value) {
    emit(NewsSearchLoading());
    search=[];
   DioHelper.getData(
      url: 'v2/everything', 
      queryParameters: {
      
      'q': '$value',
      'apiKey': 'cce9f2fc06dc41e396743236958178c8',
    }).then((value) {
      //print(value.data.toString());
      search=value.data['articles'];
      //print(business[0]['author']);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState(error.toString()));
    });
  }


 bool isDark=false;
  void changeAppMode({bool? fromShared}){
    if(fromShared != null){
    isDark=fromShared;
        emit(ChangeAppModeState());
    }else
    isDark=!isDark;
    CachHelper.putData(key: 'isDark',value: isDark).then((value){
    emit(ChangeAppModeState());

    });
  }
}
