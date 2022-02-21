import 'package:corona/bloc/corona_cubit.dart';
import 'package:corona/view/corona_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => CoronaCubit())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CoronaView(),
      ),
    );
  }
}
