import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/features/auth/domain/entity/user_entity.dart';
import 'package:pet_adoption_app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:pet_adoption_app/features/home/presentation/state/auth_state.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    ref.read(authUseCaseProvider),
  );
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;

  AuthViewModel(this._authUseCase) : super(AuthState(isLoading: false));

  Future<void> registerUser(BuildContext context, UserEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.registerUser(user);
    data.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        // showSnackBar(
        //   message: failure.error,
        //   context: context,
        //   color: Colors.green,
        // );
      },
      (success) {
        state = state.copyWith(
          isLoading: false,
          error: null,
        );
        // showSnackBar(message: "Successfully registered", context: context);
      },
    );
  }

  Future<bool> loginUser(
      BuildContext context, String email, String password) async {
    state = state.copyWith(isLoading: true);
    bool isLogin = false;
    var data = await _authUseCase.loginUser(email, password);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        // showSnackBar(
        //   message: failure.error,
        //   context: context,
        //   color: Colors.red,
        // );
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        // Navigator.pushReplacementNamed(context, AppRoute.homeRoute);
        isLogin = success;
      },
    );

    return isLogin;
  }
}
