import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/config/routers/app_route.dart';
import 'package:pet_adoption_app/core/common/my_snackbar.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/adoption_form_entity.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/pet_entity.dart';
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

  Future<void> addPet(
    BuildContext context,
    PetEntity pet,
    File file,
    Function resetFields,
  ) async {
    state = state.copyWith(isLoading: true);
    var data = await petUseCase.addPet(pet, file);
    data.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        showSnackBar(
            message: failure.error, context: context, color: Colors.red);
      },
      (success) {
        state = state.copyWith(
          isLoading: false,
          error: null,
        );
        showSnackBar(
          message: "Pet Added Successfully !",
          context: context,
          color: Colors.green,
        );
        // Call the resetFields function to reset the input fields
        resetFields();

        // Navigator.pushNamed(context, AppRoute.homeRoute);
      },
    );
  }

  Future<void> deletePet(BuildContext context, String petId) async {
    state = state.copyWith(isLoading: true);
    var data = await petUseCase.deletePet(petId);
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
        showSnackBar(
          message: "Pet Deleted Successfully !",
          context: context,
          color: Colors.green,
        );
        await getAllPets();

        Navigator.pushNamed(context, AppRoute.homeRoute);
      },
    );
  }

  Future<void> adoptPet(
    BuildContext context,
    AdoptionFormEntity pet,
    Function resetFields,
  ) async {
    state = state.copyWith(isLoading: true);
    var data = await petUseCase.adoptPet(pet);
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
        resetFields();

        // Navigator.pushNamed(context, AppRoute.homeRoute);
      },
    );
  }
}
