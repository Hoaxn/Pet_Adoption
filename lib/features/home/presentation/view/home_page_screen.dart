import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pet_adoption_app/config/constants/theme_constant.dart';
import 'package:pet_adoption_app/config/routers/app_route.dart';
import 'package:pet_adoption_app/core/common/provider/is_dark_theme.dart';
import 'package:pet_adoption_app/features/home/presentation/view/adoption_screen.dart';
import 'package:pet_adoption_app/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:pet_adoption_app/features/pets/domain/entity/pets_entity.dart';
import 'package:pet_adoption_app/features/pets/presentation/viewmodel/pet_viewmodel.dart';
import 'package:pet_adoption_app/model/home_page_model.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  int selectedAnimalIconIndex = 0;

  late bool isDark;

  List<PetEntity> filteredPets = [];

  @override
  void initState() {
    isDark = ref.read(isDarkThemeProvider);

    super.initState();
  }

  void filterPetsBySpecies(String species) {
    print("Filtering by species: $species");
    setState(
      () {
        final petState = ref.watch(petViewModelProvider);
        filteredPets = petState.pets
            .where(
              (pet) => pet.species.toLowerCase().contains(
                    species.toLowerCase(),
                  ),
            )
            .toList();
        print("Filtered pets count: ${filteredPets.length}");
      },
    );
  }

  Widget buildAnimalIcons(int index) {
    final String animalType = animalTypes[index].toLowerCase();
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(
                () {
                  selectedAnimalIconIndex = index;
                  filterPetsBySpecies(animalType);
                },
              );
            },
            child: Material(
              color: selectedAnimalIconIndex == index
                  // ? Theme.of(context).primaryColor
                  ? Theme.of(context).colorScheme.primary
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
                      // : Theme.of(context).primaryColor,
                      : Theme.of(context).colorScheme.primary,
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
              // color: Theme.of(context).primaryColor,
              color: Theme.of(context).colorScheme.primary,
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> _handleRefresh() async {
  //   final petViewModel = ref.read(petViewModelProvider.notifier);
  //   await petViewModel.getAllPets();
  //   await Future.delayed(const Duration(seconds: 2));
  // }

  Future<void> _handleRefresh() async {
    final petViewModel = ref.read(petViewModelProvider.notifier);
    await petViewModel.getAllPets();

    filterPetsBySpecies(animalTypes[selectedAnimalIconIndex].toLowerCase());
    // await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final deviceWidth = MediaQuery.of(context).size.width;

    final petState = ref.watch(petViewModelProvider);

    void openDrawer() {
      scaffoldKey.currentState?.openDrawer();
    }

    // final internetStatus = ref.watch(connectivityStatusProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: ThemeConstant.secondaryColor),
              child: const Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoute.homeRoute);
              },
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(FontAwesomeIcons.paw),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 15,
                      // color: Theme.of(context).primaryColor,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoute.addPetRoute);
              },
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(FontAwesomeIcons.plus),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    "Add Pet",
                    style: TextStyle(
                      fontSize: 15,
                      // color: Theme.of(context).primaryColor,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.dark_mode),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Row(
                  children: [
                    Text(
                      "Dark Mode",
                      style: TextStyle(
                        fontSize: 15,
                        // color: Theme.of(context).primaryColor,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Switch(
                      value: isDark,
                      onChanged: (value) {
                        setState(
                          () {
                            isDark = value;
                            ref
                                .read(isDarkThemeProvider.notifier)
                                .updateTheme(value);
                          },
                        );
                      },
                    ),
                  ],
                ),
                // Text(
                //   "Settings",
                //   style: TextStyle(
                //     fontSize: 15,
                //     // color: Theme.of(context).primaryColor,
                //     color: Theme.of(context).colorScheme.primary,
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                ref.read(homeViewModelProvider.notifier).logout(context);
              },
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(FontAwesomeIcons.rightFromBracket),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 15,
                      // color: Theme.of(context).primaryColor,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        height: 250,
        color: ThemeConstant.mainColor,
        // animSpeedFactor: 3,
        child: SingleChildScrollView(
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
                      InkWell(
                        onTap: openDrawer,
                        child: const Icon(
                          FontAwesomeIcons.barsStaggered,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w400,
                              // color:
                              //     Theme.of(context).primaryColor.withOpacity(0.6),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.locationDot,
                                // color: Theme.of(context).primaryColor,
                                color: Theme.of(context).colorScheme.primary,
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
                LiquidPullToRefresh(
                  onRefresh: _handleRefresh,
                  color: ThemeConstant.secondaryColor,
                  animSpeedFactor: 3,
                  height: 300,
                  backgroundColor: ThemeConstant.mainColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        // color: Theme.of(context).primaryColor.withOpacity(0.07),
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.07),
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
                              // child: Row(
                              //   children: [
                              //     Icon(
                              //       FontAwesomeIcons.magnifyingGlass,
                              //       color: Colors.grey[500],
                              //     ),
                              //     Expanded(
                              //       child: TextField(
                              //         style: const TextStyle(
                              //           fontSize: 17,
                              //         ),
                              //         decoration: InputDecoration(
                              //           border: const OutlineInputBorder(
                              //             borderSide: BorderSide.none,
                              //           ),
                              //           hintText: "Search ...",
                              //           hintStyle: TextStyle(
                              //             color: Colors.grey[500],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     Icon(
                              //       FontAwesomeIcons.filter,
                              //       color: Colors.grey[500],
                              //     ),
                              //   ],
                              // ),
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
                          // if (petState.isLoading) ...{
                          //   const Center(
                          //     child: CircularProgressIndicator(),
                          //   )
                          // }
                          if (petState.error != null) ...{
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
                              physics: const NeverScrollableScrollPhysics(),
                              // itemCount: petState.pets.length,
                              itemCount: filteredPets.length,
                              itemBuilder: (content, index) {
                                // final pet = petState.pets[index];
                                final pet = filteredPets[index];

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
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          elevation: 5.0,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 20.0,
                                              horizontal: 12.0,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: deviceWidth * 0.4,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                              fontSize: 25.0,
                                                              // color:
                                                              //     Theme.of(context)
                                                              //         .primaryColor,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                            ),
                                                          ),
                                                          Icon(
                                                            pet.gender ==
                                                                    'female'
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
                                                          // color: Theme.of(context)
                                                          //     .primaryColor,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
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
                                                          // color: Theme.of(context)
                                                          //     .primaryColor
                                                          //     .withOpacity(0.8),
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .primary
                                                              .withOpacity(0.8),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Text(
                                                        "${pet.age} years old",
                                                        style: TextStyle(
                                                          // color: Theme.of(context)
                                                          //     .primaryColor
                                                          //     .withOpacity(0.5),
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .primary
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
                                                    : Colors.white,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
