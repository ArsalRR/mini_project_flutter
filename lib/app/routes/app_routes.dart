part of 'app_pages.dart';
abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const RESET_PASSWORD = _Paths.RESET_PASSWORD;
  static const UPDATE = _Paths.UPDATE;
  static const CREATE = _Paths.CREATE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const RESET_PASSWORD = '/reset-password';
  static const UPDATE = '/update';
  static const CREATE = '/create';
}
