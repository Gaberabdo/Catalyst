part of 'electronics_cubit.dart';

@immutable
abstract class ElectronicsState {}

class ElectronicsInitial extends ElectronicsState {}

//class GetItemsInitial extends ElectronicsState {}

class GetItemsSuccess extends ElectronicsState {}

class GetItemsFailure extends ElectronicsState {
  final String error;
  GetItemsFailure({required this.error});
}
