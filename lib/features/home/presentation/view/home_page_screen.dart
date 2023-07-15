import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption_app/features/home/presentation/view/adoption_screen.dart';
import 'package:pet_adoption_app/features/pets/presentation/viewmodel/pet_viewmodel.dart';

import '../../../../model/home_page_model.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  int selectedAnimalIconIndex = 0;

  Widget buildAnimalIcons(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(
                () {
                  selectedAnimalIconIndex = index;
                },
              );
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

    final petState = ref.watch(petViewModelProvider);

    // final internetStatus = ref.watch(connectivityStatusProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      FontAwesomeIcons.barsStaggered,
                    ),
                    Column(
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.6),
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
              Padding(
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
                      if (petState.isLoading) ...{
                        const Center(
                          child: CircularProgressIndicator(),
                        )
                      } else if (petState.error != null) ...{
                        Center(
                          child: Text(petState.error!),
                        )
                      } else if (petState.pets.isEmpty) ...{
                        const Center(
                          child: Text("No Pets"),
                        ),
                      } else ...{
                        ListView.builder(
                          padding: const EdgeInsets.only(top: 10.0),
                          shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemCount: petState.pets.length,
                          itemBuilder: (content, index) {
                            final pet = petState.pets[index];

                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdoptionScreen(
                                      pet: pet,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
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
                                                        pet.name,
                                                        style: TextStyle(
                                                          fontSize: 26.0,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                      ),
                                                      Icon(
                                                        pet.gender == 'female'
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
                                                    pet.species,
                                                    style: TextStyle(
                                                      fontSize: 19.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    pet.breed,
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .primaryColor
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    "${pet.age} years old",
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor
                                                          .withOpacity(0.5),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
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
                                            color: pet.color != null &&
                                                    pet.color!.isNotEmpty
                                                ? Color(
                                                    int.parse(
                                                      '0xFF${pet.color?.substring(0)}',
                                                    ),
                                                  )
                                                : Theme.of(context)
                                                    .primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          height: 200.0,
                                          width: deviceWidth * 0.4,
                                        ),
                                        Hero(
                                          tag: pet.name,
                                          child: Image.network(
                                            "http://localhost:3000/uploads/${pet.image}",
                                            height: 220.0,
                                            width: deviceWidth * 0.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      },
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
