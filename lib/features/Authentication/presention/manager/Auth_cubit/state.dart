abstract class AuthState{}

class intialState extends AuthState{}
class LoadingSignIn extends AuthState{}
class SuccessSignIn extends AuthState{}
class ErrorSignIn extends AuthState{
  String error;

  ErrorSignIn(this.error);
}
class ErrorSignUp extends AuthState{}
class LoadingSignUp extends AuthState{}
class SuccessSignUp extends AuthState{}
class LoadingOtp extends AuthState{}
class SuccessOtp extends AuthState{}
class ErrorOtp extends AuthState{}
class ErrorLogout extends AuthState{}
class SuccessLogout extends AuthState{}

