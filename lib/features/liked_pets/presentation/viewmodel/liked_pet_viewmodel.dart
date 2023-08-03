import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/core/common/my_snackbar.dart';
import 'package:pet_adoption_app/features/liked_pets/domain/entity/liked_pet_entity.dart';
import 'package:pet_adoption_app/features/liked_pets/domain/usecase/liked_pet_usecase.dart';
import 'package:pet_adoption_app/features/liked_pets/presentation/state/liked_pet_state.dart';

final likedPetViewModelProvider =
    StateNotifierProvider<LikedPetViewModel, LikedPetState>(
  (ref) => LikedPetViewModel(
    ref.read(likedPetUseCaseProvider),
  ),
);

class LikedPetViewModel extends StateNotifier<LikedPetState> {
  final LikedPetUseCase likedPetUseCase;

  LikedPetViewModel(this.likedPetUseCase) : super(LikedPetState.initial()) {
    getLikedPets();
  }

  Future<void> saveLikedPet(
    BuildContext context,
    String? petId,
  ) async {
    state = state.copyWith(isLoading: true);
    var data = await likedPetUseCase.saveLikedPet(petId);
    data.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        showSnackBar(
          message: failure.error,
          context: context,
          color: Colors.red,
        );
      },
      (success) {
        state = state.copyWith(
          isLoading: false,
          error: null,
        );
        // showSnackBar(
        //   message: "Pet Liked Successful !",
        //   context: context,
        //   color: Colors.green,
        // );
      },
    );
  }

  Future<void> removeLikedPet(BuildContext context, String? petId) async {
    state = state.copyWith(isLoading: true);
    var data = await likedPetUseCase.removeLikedPet(petId);
    data.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        showSnackBar(
            message: failure.error, context: context, color: Colors.red);
      },
      (success) async {
        state = state.copyWith(
          isLoading: false,
          error: null,
        );
        // print('success ${success.data}');
        // showSnackBar(
        //   message: "Pet Unliked Successfully !",
        //   context: context,
        //   color: Colors.green,
        // );
        // await getAllPets();

        // Navigator.pushNamed(context, AppRoute.homeRoute);
      },
    );
  }

  Future<void> getLikedPets() async {
    state = state.copyWith(isLoading: true);
    var data = await likedPetUseCase.getLikedPets();
    data.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        // showSnackBar(
        //     message: failure.error, context: context, color: Colors.red);
      },
      (success) {
        final List<LikedPetEntity> petz = [];

        if (success.data != null && success.data.containsKey('likedPets')) {
          final List<dynamic> items = success.data['likedPets'];

          petz.addAll(
            items.map<LikedPetEntity>(
              (item) => LikedPetEntity(
                petId: item['pet']['_id'],
                name: item['pet']['name'],
                age: item['pet']['age'].toString(),
                species: item['pet']['species'],
                breed: item['pet']['breed'],
                gender: item['pet']['gender'],
                description: item['pet']['description'],
                color: item['pet']['color'],
                image: item['pet']['image'],
                // userId: item['user'],
              ),
            ),
          );
        }
        state = state.copyWith(
          isLoading: false,
          error: null,
          petz: petz,
        );
      },
    );
  }
}
