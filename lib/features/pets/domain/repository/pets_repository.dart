import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/core/failure/failure.dart';
import 'package:pet_adoption_app/features/pets/data/repository/pets_remote_repo_impl.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/adoption_form_entity.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/pets_entity.dart';

final petRepositoryProvider = Provider<IPetRepository>(
  (ref) => ref.read(petRemoteRepositoryProvider),
);

abstract class IPetRepository {
  Future<Either<Failure, bool>> addPet(PetEntity pet);
  Future<Either<Failure, Response>> getAllPets();
  Future<Either<Failure, bool>> deletePet(String id);
  Future<Either<Failure, bool>> adoptPet(AdoptionFormEntity adoptFormData);
}
