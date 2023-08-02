import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/core/failure/failure.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/adoption_form_entity.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/pet_entity.dart';
import 'package:pet_adoption_app/features/pets/domain/repository/pets_repository.dart';

final petUseCaseProvider = Provider<PetUseCase>(
  (ref) => PetUseCase(
    petRepository: ref.read(petRepositoryProvider),
  ),
);

class PetUseCase {
  final IPetRepository petRepository;

  PetUseCase({required this.petRepository});

  Future<Either<Failure, Response>> getAllPets() {
    return petRepository.getAllPets();
  }

  Future<Either<Failure, bool>> addPet(PetEntity pet, File file) {
    return petRepository.addPet(pet, file);
  }

  Future<Either<Failure, Response>> deletePet(String petId) async {
    return await petRepository.deletePet(petId);
  }

  Future<Either<Failure, bool>> adoptPet(
      AdoptionFormEntity adoptFormData) async {
    return petRepository.adoptPet(adoptFormData);
  }

  Future<Either<Failure, bool>> saveLikedPet(String? petId) {
    return petRepository.saveLikedPet(petId);
  }

  Future<Either<Failure, Response>> removeLikedPet(String? petId) async {
    return await petRepository.removeLikedPet(petId);
  }

  Future<Either<Failure, Response>> getLikedPets(String? petId) {
    return petRepository.getLikedPets(petId);
  }
}
