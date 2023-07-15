// // // import 'package:flutter/material.dart';
// // // import 'package:pet_adoption_app/features/home/presentation/view/add_pet_screen.dart';
// // // import 'package:pet_adoption_app/features/home/presentation/view/home_page_screen.dart';
// // // import 'package:pet_adoption_app/features/home/presentation/view/menu_screen.dart';

// // // class MenuOpenScreen extends StatefulWidget {
// // //   const MenuOpenScreen({super.key});

// // //   @override
// // //   State<MenuOpenScreen> createState() => _MenuOpenScreenState();
// // // }

// // // class _MenuOpenScreenState extends State<MenuOpenScreen>
// // //     with SingleTickerProviderStateMixin {
// // //   late AnimationController _animationController;

// // //   // late Animation<double> scaleAnimation, smallerScaleAnimation;

// // //   Duration duration = const Duration(milliseconds: 200);

// // //   bool menuIsOpened = true;

// // //   late List<Animation<double>> scaleAnimations;

// // //   late List<Widget> screenSnapshot;

// // //   @override
// // //   void initState() {
// // //     super.initState();

// // //     _animationController = AnimationController(vsync: this, duration: duration);

// // //     // scaleAnimation =
// // //     //     Tween<double>(begin: 1.0, end: 0.7).animate(_animationController);

// // //     // smallerScaleAnimation =
// // //     //     Tween<double>(begin: 1.0, end: 0.6).animate(_animationController);

// // //     scaleAnimations = [
// // //       Tween<double>(begin: 1.0, end: 0.7).animate(_animationController),
// // //       Tween<double>(begin: 1.0, end: 0.6).animate(_animationController),
// // //       Tween<double>(begin: 1.0, end: 0.5).animate(_animationController),
// // //       Tween<double>(begin: 1.0, end: 0.4).animate(_animationController),
// // //       Tween<double>(begin: 1.0, end: 0.3).animate(_animationController),
// // //     ];

// // //     _animationController.forward();

// // //     screenSnapshot = screens.values.toList();
// // //   }

// // //   Map<int, Widget> screens = {
// // //     0: ClipRRect(
// // //       borderRadius: BorderRadius.circular(40.0),
// // //       child: const HomePageScreen(),
// // //     ),
// // //     1: ClipRRect(
// // //       borderRadius: BorderRadius.circular(40.0),
// // //       child: const AddPetScreen(),
// // //     ),
// // //     2: Container(
// // //       decoration: BoxDecoration(
// // //         color: Colors.blue,
// // //         borderRadius: BorderRadius.circular(
// // //           40.0,
// // //         ),
// // //       ),
// // //     ),
// // //     3: Container(
// // //       decoration: BoxDecoration(
// // //         color: Colors.green,
// // //         borderRadius: BorderRadius.circular(
// // //           40.0,
// // //         ),
// // //       ),
// // //     ),
// // //     4: Container(
// // //       decoration: BoxDecoration(
// // //         color: Colors.yellow,
// // //         borderRadius: BorderRadius.circular(
// // //           40.0,
// // //         ),
// // //       ),
// // //     ),
// // //   };

// // //   List<Widget> finalStack() {
// // //     List<Widget> stackToReturn = [];
// // //     stackToReturn.add(
// // //       MenuScreen(
// // //         menuCallback: (selectedIndex) {
// // //           setState(
// // //             () {
// // //               screenSnapshot = screens.values.toList();
// // //               final selectedWidget = screenSnapshot.removeAt(selectedIndex);
// // //               screenSnapshot.insert(0, selectedWidget);
// // //             },
// // //           );
// // //         },
// // //       ),
// // //     );

// // //     screenSnapshot
// // //         .asMap()
// // //         .entries
// // //         .map((screenEntry) => buildScreenStack(screenEntry.key))
// // //         .toList()
// // //         .reversed
// // //         .forEach(
// // //       (screen) {
// // //         stackToReturn.add(screen);
// // //       },
// // //     );

// // //     return stackToReturn;
// // //   }

// // //   Widget buildScreenStack(int position) {
// // //     final deviceWidth = MediaQuery.of(context).size.width;
// // //     return AnimatedPositioned(
// // //       duration: duration,
// // //       top: 0,
// // //       bottom: 0,
// // //       left: menuIsOpened ? deviceWidth * 0.50 - (position * 50) : 0.0,
// // //       right: menuIsOpened ? deviceWidth * -0.45 + (position * 50) : 0.0,
// // //       child: ScaleTransition(
// // //         scale: scaleAnimations[position],
// // //         child: GestureDetector(
// // //           onTap: () {
// // //             if (menuIsOpened) {
// // //               setState(
// // //                 () {
// // //                   menuIsOpened = false;
// // //                   _animationController.reverse();
// // //                 },
// // //               );
// // //             }
// // //           },
// // //           child: AbsorbPointer(
// // //             absorbing: menuIsOpened,
// // //             child: Material(
// // //               animationDuration: duration,
// // //               borderRadius: BorderRadius.circular(menuIsOpened ? 50.0 : 0.0),
// // //               child: screenSnapshot[position],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Stack(
// // //         children: finalStack(),
// // //       ),
// // //     );
// // //   }
// // // }

// import 'package:flutter/material.dart';
// import 'package:pet_adoption_app/features/home/presentation/view/home_page_screen.dart';
// import 'package:pet_adoption_app/features/home/presentation/view/menu_screen.dart';

// class MenuOpenScreen extends StatefulWidget {
//   const MenuOpenScreen({super.key});

//   @override
//   State<MenuOpenScreen> createState() => _MenuOpenScreenState();
// }

// class _MenuOpenScreenState extends State<MenuOpenScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;

//   late Animation<double> scaleAnimation;

//   Duration duration = const Duration(milliseconds: 200);

//   bool menuOpen = false;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(vsync: this, duration: duration);

//     scaleAnimation =
//         Tween<double>(begin: 1.0, end: 0.6).animate(_animationController);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final deviceWidth = MediaQuery.of(context).size.width;

//     return Stack(
//       children: [
//         const MenuScreen(),
//         AnimatedPositioned(
//           top: 0,
//           bottom: 0,
//           left: menuOpen ? deviceWidth * 0.50 : 0.0,
//           right: menuOpen ? deviceWidth * -0.45 : 0.0,
//           duration: duration,
//           child: ScaleTransition(
//             scale: scaleAnimation,
//             child: GestureDetector(
//               onTap: () {
//                 if (menuOpen) {
//                   setState(
//                     () {
//                       menuOpen = false;
//                       _animationController.reverse();
//                     },
//                   );
//                 }
//               },
//               child: AbsorbPointer(
//                 absorbing: menuOpen,
//                 child: Material(
//                   animationDuration: duration,
//                   borderRadius: BorderRadius.circular(menuOpen ? 30.0 : 0.0),
//                   child: HomePageScreen(
//                     menuCallback: () {
//                       setState(
//                         () {
//                           menuOpen = true;
//                           _animationController.forward();
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
