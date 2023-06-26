import 'package:flutter/material.dart';
import 'package:pet_adoption_app/components/text_fields.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _speciesController = TextEditingController();
  final _breedController = TextEditingController();
  final _genderController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFields(
              controller: _nameController,
              hintText: "Name",
              obscureText: false,
            ),
            const SizedBox(height: 10),
            TextFields(
              controller: _ageController,
              hintText: "Age",
              obscureText: false,
            ),
            const SizedBox(height: 10),
            TextFields(
              controller: _speciesController,
              hintText: "Species",
              obscureText: false,
            ),
            const SizedBox(height: 10),
            TextFields(
              controller: _breedController,
              hintText: "Breed",
              obscureText: false,
            ),
            const SizedBox(height: 10),
            TextFields(
              controller: _genderController,
              hintText: "Gender",
              obscureText: false,
            ),
            const SizedBox(height: 10),
            TextFields(
              controller: _descriptionController,
              hintText: "Description",
              obscureText: false,
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement image selection
                    },
                    child: const Text('Select Image'),
                  ),
                ),
                const SizedBox(width: 16.0),
                const Text(
                  'No image selected', // TODO: Display selected image filename
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement adding the pet
              },
              child: const Text('Add Pet'),
            ),
          ],
        ),
      ),
    );
  }
}
