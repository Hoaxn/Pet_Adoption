import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pet_adoption_app/config/constants/hive_table_constant.dart';
import 'package:pet_adoption_app/features/pets/data/model/pet_hive_model.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(PetHiveModelAdapter());

    // Add dummy data
    await addDummyPet();
  }

  // ======================== Pet Queries ========================
  Future<void> addPet(PetHiveModel pet) async {
    var box = await Hive.openBox<PetHiveModel>(HiveTableConstant.petBox);
    await box.put(pet.petId, pet);
  }

  Future<List<PetHiveModel>> getAllPets() async {
    var box = await Hive.openBox<PetHiveModel>(HiveTableConstant.petBox);
    var pets = box.values.toList();
    box.close();
    return pets;
  }

  // ======================== Insert Dummy Data ========================
  // Pet Dummy Data
  Future<void> addDummyPet() async {
    // check of pet box is empty
    var box = await Hive.openBox<PetHiveModel>(HiveTableConstant.petBox);
    if (box.isEmpty) {
      final pet1 = PetHiveModel(
          name: 'Max',
          age: '4',
          species: 'dog',
          breed: 'golden retriever',
          gender: 'male',
          description: 'friendly and playful');
      final pet2 = PetHiveModel(
          name: 'Luna',
          age: '2',
          species: 'cat',
          breed: 'persian',
          gender: 'female',
          description: 'fiesty and cute');
      // final batch3 = BatchHiveModel(batchName: '30-A');
      // final batch4 = BatchHiveModel(batchName: '30-B');

      List<PetHiveModel> pets = [pet1, pet2];

      // Insert pet with key
      for (var pet in pets) {
        await addPet(pet);
      }
    }
  }

  // ======================== Delete All Data ========================
  Future<void> deleteAllData() async {
    var box = await Hive.openBox<PetHiveModel>(HiveTableConstant.petBox);
    await box.clear();
  }

  // ======================== Close Hive ========================
  Future<void> closeHive() async {
    await Hive.close();
  }

  // ======================== Delete Hive ========================
  Future<void> deleteHive() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.deleteBoxFromDisk(HiveTableConstant.petBox);
    await Hive.deleteFromDisk();
  }
}
