import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/core/failure/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userSharedPrefsProvider = Provider<UserSharedPrefs>(
  (ref) {
    return UserSharedPrefs();
  },
);

class UserSharedPrefs {
  late SharedPreferences _sharedPrefernces;
  //Set User Token
  Future<Either<Failure, bool>> setUserToken(String token) async {
    try {
      _sharedPrefernces = await SharedPreferences.getInstance();
      await _sharedPrefernces.setString('token', token);
      return right(true);
    } catch (e) {
      return left(
        Failure(
          error: e.toString(),
        ),
      );
    }
  }

  //Get User Token
  Future<Either<Failure, String?>> getUserToken() async {
    try {
      _sharedPrefernces = await SharedPreferences.getInstance();
      final token = _sharedPrefernces.getString('token');
      return right(token);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }
}
