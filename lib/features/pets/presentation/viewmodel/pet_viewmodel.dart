import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/core/common/my_snackbar.dart';
import 'package:pet_adoption_app/features/auth/domain/entity/user_entity.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/adoption_form_entity.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/pets_entity.dart';
import 'package:pet_adoption_app/features/pets/domain/usecase/pets_usecase.dart';
import 'package:pet_adoption_app/features/pets/presentation/state/pet_state.dart';

final petViewModelProvider = StateNotifierProvider<PetViewModel, PetState>(
  (ref) => PetViewModel(
    ref.read(petUseCaseProvider),
  ),
);

class PetViewModel extends StateNotifier<PetState> {
  final PetUseCase petUseCase;
  PetViewModel(this.petUseCase) : super(PetState.initial()) {
    getAllPets();
  }

  Future<void> deletePet(BuildContext context, PetEntity pet) async {
    state.copyWith(isLoading: true);
    var data = await petUseCase.deletePet(pet.petId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state.pets.remove(pet);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Pet delete successfully',
          context: context,
        );
      },
    );
  }

  // Future<void> addPet(PetEntity pet) async {
  //   state.copyWith(isLoading: true);
  //   var data = await petUseCase.addPet(pet);

  //   data.fold(
  //     (l) => state = state.copyWith(isLoading: false, error: l.error),
  //     (r) => state = state.copyWith(isLoading: false, error: null),
  //   );
  // }

  Future<void> addPet(
    BuildContext context,
    PetEntity pet,
    File file,
    Function resetFields,
  ) async {
    state = state.copyWith(isLoading: true);
    var data = await petUseCase.addPet(pet, file);
    data.fold((failure) {
      state = state.copyWith(
        isLoading: false,
        error: failure.error,
      );
      showSnackBar(message: failure.error, context: context, color: Colors.red);
    }, (success) {
      state = state.copyWith(
        isLoading: false,
        error: null,
      );
      showSnackBar(
          message: "Add Pet Successful !",
          context: context,
          color: Colors.green);
      // Call the resetFields function to reset the input fields
      resetFields();
      // Navigator.pushNamed(context, AppRoute.homeRoute);
    });
  }

  Future<void> getAllPets() async {
    state = state.copyWith(isLoading: true);
    var data = await petUseCase.getAllPets();
    data.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        // showSnackBar(message: failure.error, context: context, color: Colors.red);
      },
      (success) {
        final List<PetEntity> pets = [];

        if (success.data.containsKey('pets')) {
          final List<dynamic> items = success.data['pets'];

          pets.addAll(
            items.map<PetEntity>(
              (item) => PetEntity(
                petId: item['_id']?.toString(),
                name: item['name'],
                age: item['age'].toString(),
                species: item['species'],
                breed: item['breed'],
                gender: item['gender'],
                description: item['description'],
                color: item['color'],
                image: item['image'],
              ),
            ),
          );
        }
        state = state.copyWith(
          isLoading: false,
          error: null,
          pets: pets,
        );
      },
    );
  }

  Future<void> adoptPet(
    BuildContext context,
    AdoptionFormEntity product,
    Function resetFields,
  ) async {
    state = state.copyWith(isLoading: true);
    var data = await petUseCase.adoptPet(product);
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
        showSnackBar(
          message: "Pet Adoption Successful !",
          context: context,
          color: Colors.green,
        );
        resetFields();

        // Call the resetFields function to reset the input fields
        // resetFields();
        // Navigator.pushNamed(context, AppRoute.homeRoute);
      },
    );
  }

  // // New method to handle liking a pet
  // Future<void> likePet(
  //     BuildContext context, PetEntity pet, UserEntity user) async {
  //   state.copyWith(isLoading: true);
  //   var data = await petUseCase.likePet(user.id!, pet.petId!);

  //   data.fold(
  //     (l) {
  //       showSnackBar(
  //         message: l.error,
  //         context: context,
  //         color: Colors.red,
  //       );

  //       state = state.copyWith(isLoading: false, error: l.error);
  //     },
  //     (r) {
  //       state.pets[state.pets.indexOf(pet)].isLiked = true;
  //       state = state.copyWith(isLoading: false, error: null);
  //       showSnackBar(
  //         message: 'Pet liked successfully',
  //         context: context,
  //       );
  //     },
  //   );
  // }

  // // New method to handle unliking a pet
  // Future<void> unlikePet(
  //     BuildContext context, PetEntity pet, UserEntity user) async {
  //   state.copyWith(isLoading: true);
  //   var data = await petUseCase.unlikePet(user.id!, pet.petId!);

  //   data.fold(
  //     (l) {
  //       showSnackBar(
  //         message: l.error,
  //         context: context,
  //         color: Colors.red,
  //       );

  //       state = state.copyWith(isLoading: false, error: l.error);
  //     },
  //     (r) {
  //       state.pets[state.pets.indexOf(pet)].isLiked = false;
  //       state = state.copyWith(isLoading: false, error: null);
  //       showSnackBar(
  //         message: 'Pet unliked successfully',
  //         context: context,
  //       );
  //     },
  //   );
  // }

  Future<void> likePet(
      BuildContext context, PetEntity pet, UserEntity user) async {
    state.copyWith(isLoading: true);
    var data = await petUseCase.likePet(user.id!, pet.petId!);

    data.fold(
      (l) {
        showSnackBar(
          message: l.error,
          context: context,
          color: Colors.red,
        );

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        // Update the isLiked property in the state after receiving a successful response
        pet.isLiked = true;
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Pet liked successfully',
          context: context,
        );
      },
    );
  }

  Future<void> unlikePet(
      BuildContext context, PetEntity pet, UserEntity user) async {
    state.copyWith(isLoading: true);
    var data = await petUseCase.unlikePet(user.id!, pet.petId!);

    data.fold(
      (l) {
        showSnackBar(
          message: l.error,
          context: context,
          color: Colors.red,
        );

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        // Update the isLiked property in the state after receiving a successful response
        pet.isLiked = false;
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Pet unliked successfully',
          context: context,
        );
      },
    );
  }
}
