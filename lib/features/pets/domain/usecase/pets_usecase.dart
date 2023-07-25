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

  Future<Either<Failure, bool>> addPet(PetEntity pet) {
    return petRepository.addPet(pet);
  }

  Future<Either<Failure, Response>> getAllPets() {
    return petRepository.getAllPets();
  }

  Future<Either<Failure, bool>> deletePet(String id) async {
    return petRepository.deletePet(id);
  }

  Future<Either<Failure, bool>> adoptPet(
      AdoptionFormEntity adoptFormData) async {
    return petRepository.adoptPet(adoptFormData);
  }
}
