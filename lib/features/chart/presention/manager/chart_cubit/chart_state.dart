part of 'chart_cubit.dart';

@immutable
abstract class ChartState {}

class ChartInitial extends ChartState {}

class ChartSuccess extends ChartState {
  List<FlSpot> currentDataXPD = [];
  ChartSuccess(this.currentDataXPD);
}

class ChartFailure extends ChartState {}

class ChartInitialM extends ChartState {}

class ChartSuccessM extends ChartState {
  ChartSuccessM();
}

class ChartFailureM extends ChartState {}

class ChartInitials extends ChartState {}

class ChartSuccesss extends ChartState {}

class ChartFailures extends ChartState {}
