import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:corona/model/corona.dart';
import 'package:corona/service/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'corona_state.dart';

class CoronaCubit extends Cubit<CoronaState> {
  CoronaCubit() : super(CoronaInitial());
  static CoronaCubit get(context) => BlocProvider.of(context);
  Corona? corona;

  getCorona(String country) {
    emit(CoronaGetLoadingState());
    DioHelper.getData(url:country )
        .then((value) {
      corona = Corona.fromJson(value.data);
      emit(CoronaGetSuccessState());
    }).catchError((error) {
      print('error');
      print(error.toString());
      emit(CoronaGetErrorState());
    });
  }
}
