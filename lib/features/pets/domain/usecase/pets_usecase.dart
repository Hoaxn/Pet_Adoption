import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/core/failure/failure.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/adoption_form_entity.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/pets_entity.dart';
import 'package:pet_adoption_app/features/pets/domain/repository/pets_repository.dart';

final petUseCaseProvider = Provider<PetUseCase>(
  (ref) => PetUseCase(
    petRepository: ref.read(petRepositoryProvider),
  ),
);

class PetUseCase {
  final IPetRepository petRepository;

  PetUseCase({required this.petRepository});

  Future<Either<Failure, bool>> addPet(PetEntity pet, File file) {
    return petRepository.addPet(pet, file);
  }

  Future<Either<Failure, Response>> getAllPets() {
    return petRepository.getAllPets();
  }

  // Future<Either<Failure, bool>> deletePet(String id) async {
  //   return petRepository.deletePet(id);
  // }

  Future<Either<Failure, Response>> deletePet(String petId) async {
    return await petRepository.deletePet(petId);
  }

  Future<Either<Failure, bool>> adoptPet(
      AdoptionFormEntity adoptFormData) async {
    return petRepository.adoptPet(adoptFormData);
  }

  // Future<Either<Failure, bool>> likePet(String petId) async {
  //   return petRepository.likePet(petId);
  // }

  // Future<Either<Failure, bool>> unlikePet(String petId) async {
  //   return petRepository.unlikePet(petId);
  // }

  Future<Either<Failure, bool>> likePet(String userId, String petId) async {
    return petRepository.likePet(userId, petId);
  }

  Future<Either<Failure, bool>> unlikePet(String userId, String petId) async {
    return petRepository.unlikePet(userId, petId);
  }
}
