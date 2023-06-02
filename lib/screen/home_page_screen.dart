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

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int selectedAnimalIconIndex = 0;

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

  Widget buildAnimalIcons(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedAnimalIconIndex = index;
              });
            },
            child: Material(
              color: selectedAnimalIconIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              elevation: 6.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  animalIcons[index],
                  size: 30.0,
                  color: selectedAnimalIconIndex == index
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            animalTypes[index],
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(FontAwesomeIcons.barsStaggered),
                  Column(
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.locationDot,
                            color: Theme.of(context).primaryColor,
                          ),
                          const Text(
                            "Kathmandu, ",
                            style: TextStyle(
                              fontSize: 21.0,
                              fontWeight: FontWeight.w600,
                              // fontFamily: "MerriweatherSans",
                            ),
                          ),
                          const Text(
                            "Nepal",
                            style: TextStyle(
                              fontSize: 21.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                      'https://www.pexels.com/photo/2486168/download/',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Theme.of(context).primaryColor.withOpacity(0.07),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 25.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11.0,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.magnifyingGlass,
                                color: Colors.grey[500],
                              ),
                              Expanded(
                                child: TextField(
                                  style: const TextStyle(
                                    fontSize: 17,
                                  ),
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "Search ...",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                              ),
                              Icon(
                                FontAwesomeIcons.filter,
                                color: Colors.grey[500],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120.0,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 25.0),
                          scrollDirection: Axis.horizontal,
                          itemCount: animalTypes.length,
                          itemBuilder: ((context, index) {
                            return buildAnimalIcons(index);
                          }),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 10.0),
                          itemCount: animals.length,
                          itemBuilder: (content, index) {
                            final animal = animals[index];

                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10.0,
                                left: 25.0,
                                right: 25.0,
                              ),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.circular(30.0),
                                    elevation: 5.0,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20.0,
                                        horizontal: 12.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: deviceWidth * 0.4,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      animal.name,
                                                      style: TextStyle(
                                                        fontSize: 26.0,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Icon(
                                                      animal.isFemale
                                                          ? FontAwesomeIcons
                                                              .venus
                                                          : FontAwesomeIcons
                                                              .mars,
                                                      color: Colors.grey,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  animal.scientificName,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  "${animal.age} years old",
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      FontAwesomeIcons
                                                          .locationDot,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      size: 16.0,
                                                    ),
                                                    const SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    Text(
                                                      "Distance: ${animal.distanceToUser}",
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: animal.backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        height: 200.0,
                                        width: deviceWidth * 0.4,
                                      ),
                                      Image(
                                        image: AssetImage(animal.imageUrl),
                                        height: 220.0,
                                        width: deviceWidth * 0.4,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
