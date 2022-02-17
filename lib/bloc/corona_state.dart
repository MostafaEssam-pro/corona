part of 'corona_cubit.dart';

@immutable
abstract class CoronaState {}

class CoronaInitial extends CoronaState {}


class CoronaGetSuccessState extends CoronaState{}
class CoronaGetLoadingState extends CoronaState{}
class CoronaGetErrorState extends CoronaState{}
