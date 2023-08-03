import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pet_adoption_app/config/constants/theme_constant.dart';
import 'package:pet_adoption_app/core/common/provider/is_dark_theme.dart';
import 'package:pet_adoption_app/core/common/widget/drawer_widget.dart';
import 'package:pet_adoption_app/features/liked_pets/domain/entity/liked_pet_entity.dart';
import 'package:pet_adoption_app/features/liked_pets/presentation/viewmodel/liked_pet_viewmodel.dart';

class LikedPetScreen extends ConsumerStatefulWidget {
  final LikedPetEntity? pet;
  const LikedPetScreen({super.key, this.pet});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LikedPetScreenState();
}

class _LikedPetScreenState extends ConsumerState<LikedPetScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late bool isDark;

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  Future<void> _handleRefresh() async {
    final likedPetViewModel = ref.read(likedPetViewModelProvider.notifier);
    await likedPetViewModel.getLikedPets();

    // await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();
    // Delay the call using Future.microtask to ensure it runs after the widget tree is built
    Future.microtask(
      () {
        _handleRefresh(); // Trigger data refresh when the widget is first created
      },
    );
  }

  Future<bool> showConfirmationDialog(
    BuildContext context,
    LikedPetEntity pet,
  ) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: const Text('Confirm Unlike'),
              content: Text('Are you sure you want to unlike ${pet.name}?'),
              actions: [
                TextButton(
                  onPressed: () {
                    // Close the dialog and return false (cancel)
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // Close the dialog and return true (confirm)
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Unlike'),
                ),
              ],
            );
          },
        ) ??
        false; // If showDialog returns null, consider it as "Cancel".
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    final likedPetState = ref.watch(likedPetViewModelProvider);

    isDark = ref.read(isDarkThemeProvider);

    // final internetStatus = ref.watch(connectivityStatusProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        height: 250,
        color: ThemeConstant.secondaryColor,
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
                            "Liked Pets",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                              // color: Theme.of(context).primaryColor,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.locationDot,
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
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
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
                          ),
                        ),
                        if (likedPetState.isLoading) ...{
                          const Center(
                            child: CircularProgressIndicator(),
                          )
                        } else if (likedPetState.petz.isEmpty) ...{
                          Center(
                            child: Text(
                              "No Liked Pets",
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        } else ...{
                          ListView.builder(
                            padding: const EdgeInsets.only(top: 10.0),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: likedPetState.petz.length,
                            itemBuilder: (content, index) {
                              final pet = likedPetState.petz[index];

                              return InkWell(
                                // onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => AdoptionScreen(
                                //         pet: pet,
                                //       ),
                                //     ),
                                //   );
                                // },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10.0,
                                    left: 20.0,
                                    right: 20.0,
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
                                                            fontSize: 25.0,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () async {
                                                            bool confirmDelete =
                                                                await showConfirmationDialog(
                                                                    context,
                                                                    pet);
                                                            if (confirmDelete) {
                                                              // Handle delete action
                                                              final likedPetViewModel =
                                                                  ref.read(
                                                                      likedPetViewModelProvider
                                                                          .notifier);
                                                              await likedPetViewModel
                                                                  .removeLikedPet(
                                                                context,
                                                                pet.petId!,
                                                              );
                                                            }
                                                            // final likedPetViewModel =
                                                            //     ref.read(
                                                            //         likedPetViewModelProvider
                                                            //             .notifier);
                                                            // await likedPetViewModel
                                                            //     .removeLikedPet(
                                                            //   context,
                                                            //   pet.petId!,
                                                            // );
                                                          },
                                                          child: const Icon(
                                                            FontAwesomeIcons
                                                                .heartCrack,
                                                            color: Colors.red,
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
                                                        color: Theme.of(context)
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
                                                        color: Theme.of(context)
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
                                            tag: pet.petId!,
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
      ),
    );
  }
}
