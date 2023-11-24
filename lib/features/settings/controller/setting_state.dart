import '../../Authentication/data/LoginModel.dart';
import '../components/models/brand_model.dart';

abstract class SettingState {}

class SettingInitial extends SettingState {}

class GetBrandLoading extends SettingState {}

class GetBrandSuccess extends SettingState {
  List<Brand> brand = [];

  GetBrandSuccess(this.brand);
}

class GetBrandError extends SettingState {}
class UpdateRadioValue extends SettingState {}

class RadioState extends SettingState {
  String lang;

  RadioState(this.lang);
}

class ChangerPasswordVisibility extends SettingState {}

class GetUserLoading extends SettingState {}

class GetUserSuccess extends SettingState {
  final LoginModel brand;
  GetUserSuccess(this.brand);
}

class GetUserError extends SettingState {}

class ChangePasswordLoading extends SettingState {}

class ChangePasswordSuccess extends SettingState {}

class ChangePasswordError extends SettingState {
  final String error;

  ChangePasswordError(this.error);
}

class DeleteUserLoading extends SettingState {}

class DeleteUserSuccess extends SettingState {}

class DeleteUserError extends SettingState {
  final String error;

  DeleteUserError(this.error);
}

class EditUserLoading extends SettingState {}

class EditUserSuccess extends SettingState {}

class EditUserError extends SettingState {
  final String error;

  EditUserError(this.error);
}
