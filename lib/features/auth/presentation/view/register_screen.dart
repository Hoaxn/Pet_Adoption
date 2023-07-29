import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption_app/config/constants/theme_constant.dart';
import 'package:pet_adoption_app/features/auth/domain/entity/user_entity.dart';
import 'package:pet_adoption_app/features/auth/presentation/viewmodel/auth_view_model.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  // checkCameraPermission() async {
  //   if (await Permission.camera.request().isRestricted ||
  //       await Permission.camera.request().isDenied) {
  //     await Permission.camera.request();
  //   }
  // }

  // File? _img;
  // Future _browseImage(WidgetRef ref, ImageSource imageSource) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: imageSource);
  //     if (image != null) {
  //       setState(() {
  //         _img = File(image.path);
  //         ref.read(authViewModelProvider.notifier).uploadImage(_img!);
  //       });
  //     } else {
  //       return;
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  final _key = GlobalKey<FormState>();

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _phoneNumController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Stack(
        children: [
          // Image.network(
          //   'https://c4.wallpaperflare.com/wallpaper/772/84/49/dog-shiba-inu-sleeping-wallpaper-preview.jpg',
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          Form(
            key: _key,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ThemeConstant.secondaryColor,
                    ThemeConstant.mainColor
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 100,
                      horizontal: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Color.fromARGB(255, 55, 0, 255),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.lock,
                          size: 100,
                        ),
                        const SizedBox(height: 50),
                        const Text(
                          "Register Here",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 50),
                        // InkWell(
                        //   onTap: () {
                        //     showModalBottomSheet(
                        //       backgroundColor: Colors.grey[300],
                        //       context: context,
                        //       isScrollControlled: true,
                        //       shape: const RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.vertical(
                        //           top: Radius.circular(20),
                        //         ),
                        //       ),
                        //       builder: (context) => Padding(
                        //         padding: const EdgeInsets.all(20),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceAround,
                        //           children: [
                        //             ElevatedButton.icon(
                        //               onPressed: () {
                        //                 checkCameraPermission();
                        //                 _browseImage(ref, ImageSource.camera);
                        //                 Navigator.pop(context);
                        //                 // Upload image it is not null
                        //               },
                        //               icon: const Icon(Icons.camera),
                        //               label: const Text('Camera'),
                        //             ),
                        //             ElevatedButton.icon(
                        //               onPressed: () {
                        //                 _browseImage(ref, ImageSource.gallery);
                        //                 Navigator.pop(context);
                        //               },
                        //               icon: const Icon(Icons.image),
                        //               label: const Text('Gallery'),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   child: SizedBox(
                        //     height: 200,
                        //     width: 200,
                        //     child: CircleAvatar(
                        //       radius: 50,
                        //       backgroundImage: _img != null
                        //           ? FileImage(_img!)
                        //           : const AssetImage('assets/images/google.png')
                        //               as ImageProvider,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: _fnameController,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 55, 0, 255),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.person_2_outlined,
                              color: Color.fromARGB(255, 55, 0, 255),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter First Name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _lnameController,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 55, 0, 255),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.person_2_outlined,
                              color: Color.fromARGB(255, 55, 0, 255),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Last Name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _phoneNumController,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 55, 0, 255),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.phone_iphone,
                              color: Color.fromARGB(255, 55, 0, 255),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Phone Number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _cityController,
                          decoration: InputDecoration(
                            hintText: 'City',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 55, 0, 255),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                              color: Color.fromARGB(255, 55, 0, 255),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter City';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _countryController,
                          decoration: InputDecoration(
                            hintText: 'Country',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 55, 0, 255),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                              color: Color.fromARGB(255, 55, 0, 255),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Country';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 55, 0, 255),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                              color: Color.fromARGB(255, 55, 0, 255),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 55, 0, 255),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.key_outlined,
                              color: Color.fromARGB(255, 55, 0, 255),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    isObscure = !isObscure;
                                  },
                                );
                              },
                            ),
                          ),
                          obscureText: isObscure,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        InkWell(
                          onTap: () {
                            if (_key.currentState!.validate()) {
                              var user = UserEntity(
                                firstName: _fnameController.text,
                                lastName: _lnameController.text,
                                phoneNumber: _phoneNumController.text,
                                city: _cityController.text,
                                country: _countryController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                image:
                                    ref.read(authViewModelProvider).imageName ??
                                        '',
                              );

                              ref
                                  .read(authViewModelProvider.notifier)
                                  .registerUser(context, user);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
