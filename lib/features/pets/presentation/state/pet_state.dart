import 'package:pet_adoption_app/features/pets/domain/entity/liked_pets_entity.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/pet_entity.dart';

class PetState {
  final bool isLoading;
  final String? error;
  final List<PetEntity> pets;
  final List<LikedPetEntity> petz;

  const PetState({
    required this.isLoading,
    required this.error,
    required this.pets,
    required this.petz,
  });

  factory PetState.initial() => const PetState(
        isLoading: false,
        error: null,
        pets: [],
        petz: [],
      );

  PetState copyWith({
    bool? isLoading,
    String? error,
    List<PetEntity>? pets,
    List<LikedPetEntity>? petz,
  }) {
    return PetState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      pets: pets ?? this.pets,
      petz: petz ?? this.petz,
    );
  }

  PetState updatePets(List<PetEntity> newPets) {
    return copyWith(pets: newPets);
  }

  PetState updatePetz(List<LikedPetEntity> newPetz) {
    return copyWith(petz: newPetz);
  }
}
