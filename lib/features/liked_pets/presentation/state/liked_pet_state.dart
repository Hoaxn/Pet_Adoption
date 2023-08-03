import 'package:pet_adoption_app/features/liked_pets/domain/entity/liked_pet_entity.dart';

class LikedPetState {
  final bool isLoading;
  final String? error;
  final List<LikedPetEntity> petz;

  const LikedPetState({
    required this.isLoading,
    required this.error,
    required this.petz,
  });

  factory LikedPetState.initial() => const LikedPetState(
        isLoading: false,
        error: null,
        petz: [],
      );

  LikedPetState copyWith({
    bool? isLoading,
    String? error,
    List<LikedPetEntity>? petz,
  }) {
    return LikedPetState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      petz: petz ?? this.petz,
    );
  }

  LikedPetState updatePetz(List<LikedPetEntity> newPetz) {
    return copyWith(petz: newPetz);
  }
}
