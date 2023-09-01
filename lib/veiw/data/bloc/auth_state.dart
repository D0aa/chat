
abstract class AuthState {}

class AuthInitial extends AuthState {}
class LoginLoadingState extends AuthState{}
class LoginSuccessState extends AuthState{}
class LoginErrorState extends AuthState{}

class RegisterLoadingState extends AuthState{}
class RegisterSuccessState extends AuthState{}
class RegisterErrorState extends AuthState{}

class GetUsersLoadingState extends AuthState{}
class GetUsersSuccessState extends AuthState{}
class GetUsersErrorState extends AuthState{}

