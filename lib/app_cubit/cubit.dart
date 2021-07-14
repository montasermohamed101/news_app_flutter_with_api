import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/app_cubit/states.dart';
import 'package:news_app_flutter/network/local/cache_helper.dart';




class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  bool isDark = false;


  void changeAppMode({bool fromShared})
  {
    if(fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeModeState());
    }
    else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeState());
      });
    }
  }


}