import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_adoption_app/config/routers/app_route.dart';
import 'package:pet_adoption_app/core/common/widget/primary_button.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/pets_entity.dart';
import 'package:pet_adoption_app/features/pets/presentation/viewmodel/pet_viewmodel.dart';

class AddPetScreen extends ConsumerStatefulWidget {
  const AddPetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends ConsumerState<AddPetScreen> {
  PetEntity? pet;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  String? _imagePath;

  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  // void _selectImage() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.image,
  //   );
  //   if (result != null) {
  //     setState(() {
  //       _imagePath = result.files.single.path!;
  //     });
  //   }
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Retrieve the passed pet argument
    pet = ModalRoute.of(context)!.settings.arguments as PetEntity?;
    // print("pet ${pet?.petId}");
    // Populate the form fields with the pet data
    if (pet != null) {
      _nameController.text = pet!.name;
      _ageController.text = pet!.age;
      _speciesController.text = pet!.species;
      _breedController.text = pet!.breed;
      _genderController.text = pet!.gender;
      _descriptionController.text = pet!.description;
      _colorController.text = pet!.color ?? '';
    }
  }

  void _resetFields() {
    _nameController.clear();
    _ageController.clear();
    _speciesController.clear();
    _breedController.clear();
    _genderController.clear();
    _descriptionController.clear();
    _colorController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.popAndPushNamed(
                            context,
                            AppRoute.homeRoute,
                          );
                        },
                        child: Icon(
                          FontAwesomeIcons.arrowLeft,
                          // color: Theme.of(context).primaryColor,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        "Add a Pet",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          // color: Theme.of(context).primaryColor,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        "a",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                          // color: Theme.of(context).primaryColor,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.07),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration:
                                const InputDecoration(labelText: 'Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the pet\'s name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _ageController,
                            decoration: const InputDecoration(labelText: 'Age'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the pet\'s age';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _speciesController,
                            decoration:
                                const InputDecoration(labelText: 'Species'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the pet\'s species';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _breedController,
                            decoration:
                                const InputDecoration(labelText: 'Breed'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the pet\'s breed';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _genderController,
                            decoration: const InputDecoration(
                                labelText: 'Gender male or female'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the pet\'s Gender';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _descriptionController,
                            decoration:
                                const InputDecoration(labelText: 'Description'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the pet\'s Description';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _colorController,
                            decoration: const InputDecoration(
                                labelText: 'Color in Hexcode without #'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the pet\'s color';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              PrimaryButton(
                                text: 'Select Image',
                                onPressed: () {
                                  _pickImage(ImageSource.gallery);
                                },
                                buttonWidth: 150,
                                isLoading: false,
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              if (_imageFile != null)
                                Image.file(
                                  _imageFile!,
                                  width: 200,
                                  height: 200,
                                ),
                              if (_imageFile == null &&
                                  pet != null &&
                                  pet!.image != null)
                                Image.network(
                                  'http://localhost:3000/uploads/${pet!.image!}',
                                  fit: BoxFit.contain,
                                  width: 200,
                                  height: 200,
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          PrimaryButton(
                            text:
                                pet != null ? 'Update ${pet?.name}' : 'Add Pet',
                            isLoading:
                                ref.watch(petViewModelProvider).isLoading,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                // Perform add pet operation
                                String name = _nameController.text;
                                String age = _ageController.text;
                                String species = _speciesController.text;
                                String breed = _breedController.text;
                                String gender = _genderController.text;
                                String description =
                                    _descriptionController.text;
                                String color = _colorController.text;
                                String petId = pet?.petId ?? '';

                                PetEntity currentPet = PetEntity(
                                  petId: petId,
                                  name: name,
                                  age: age,
                                  species: species,
                                  breed: breed,
                                  gender: gender,
                                  description: description,
                                  color: color,
                                );
                                await ref
                                    .read(petViewModelProvider.notifier)
                                    .addPet(context, currentPet, _imageFile!,
                                        _resetFields);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
