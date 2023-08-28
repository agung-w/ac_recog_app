part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({String? username, String? hand}) = _Initial;
  const factory LoginState.signedIn({required User user}) = _SignedIn;
}
