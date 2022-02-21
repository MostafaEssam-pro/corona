import 'package:corona/service/dio.dart';
import 'package:corona/src/app_root.dart';
import 'package:flutter/material.dart';

void main() {
  DioHelper.init();
  runApp( const AppRoot());

}

