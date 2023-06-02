import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Animal {
  String name;
  String scientificName;
  double age;
  String distanceToUser;
  bool isFemale;
  String imageUrl;
  Color backgroundColor;

  Animal({
    required this.name,
    required this.scientificName,
    required this.age,
    required this.distanceToUser,
    required this.isFemale,
    required this.imageUrl,
    required this.backgroundColor,
  });
}

final List<Animal> animals = [
  Animal(
    name: 'Sola',
    scientificName: 'Abyssinian cat',
    age: 2.0,
    distanceToUser: '3.6 km',
    isFemale: true,
    imageUrl: 'lib/assets/images/sola.png',
    backgroundColor: const Color.fromRGBO(203, 213, 216, 1.0),
  ),
  Animal(
    name: 'Orion',
    scientificName: 'Abyssinian cat',
    age: 1.5,
    distanceToUser: '7.8 km',
    isFemale: false,
    imageUrl: 'lib/assets/images/sola.png',
    backgroundColor: const Color.fromRGBO(237, 214, 180, 1.0),
  ),
];

List<String> animalTypes = [
  'Cats',
  'Dogs',
  'Birds',
  'Fish',
  'Fish',
];

List<IconData> animalIcons = [
  FontAwesomeIcons.cat,
  FontAwesomeIcons.dog,
  FontAwesomeIcons.crow,
  FontAwesomeIcons.fish,
  FontAwesomeIcons.fish,
];
