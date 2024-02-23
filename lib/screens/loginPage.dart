import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/customSnackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String name;
  late String password;

  // List<LoginDetailsResponse> loginDetails = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage('assets/login.png'), fit: BoxFit.cover),
          ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/128/11985/11985615.png"),
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 35 ,right: 35, top: 27),
                      child: Text(
                          "Esta canción me transporta al paraíso, donde solo hay"
                          " calma, amor y alegría. Gracias Farruko y Pedro Capó por re",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                              fontSize: 10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 35, top: 27),
                      child:  Text(
                        'Welcome Back',
                        style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w500,
                            color: Colors.amber.shade600,
                            fontSize: 35)
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: nameController,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15, height: 0.8),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black45,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              hintText: "Username or E-mail",
                              hintStyle: const TextStyle(
                                  color: Colors.black38, fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: passwordController,
                            style: const TextStyle(
                                color: Colors.black38,
                                fontSize: 15,
                                height: 0.8),
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black45,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  color: Colors.black38, fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text(
                                'Sign in',
                                style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                    fontSize: 30)
                              ),
                                CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.amber.shade200,
                                child: Builder(builder: (context) {
                                  return IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: CustomSnack(
                                                  title: 'Welcome Back !',
                                                  img:
                                                      'https://freesvg.org/storage/img/thumb/1540280887.png',
                                                  subtitle:
                                                      'This is an example error message that will be shown in the body of snackbar!',
                                                )));
                                        Navigator.pushNamed(
                                            context, 'home');
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        size: 25,
                                      ));
                                }),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                style: const ButtonStyle(),
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.amber,
                                      fontSize: 15),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 15,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Widget modernSnckbar(BuildContext context) {
//   return Scaffold(
//     body: Center(
//       child: TextButton(
//           onPressed: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   behavior: SnackBarBehavior.floating,
//                   elevation: 0,
//                   backgroundColor: Colors.transparent,
//                   content: Stack(clipBehavior: Clip.none, children: [
//                     Container(
//                       padding: EdgeInsets.all(15),
//                       height: 90,
//                       decoration: BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(20),
//                         border:
//                         Border.all(color: Colors.amber.shade500, width: 0.5),
//                       ),
//                       child: const Row(
//                         children: [
//                           SizedBox(
//                             width: 90,
//                           ),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   overflow: TextOverflow.clip,
//                                   'Welcome Back!',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.w300),
//                                 ),
//                                 SizedBox(
//                                   width: 40,
//                                 ),
//                                 Text(
//                                   maxLines: 2,
//                                   textAlign: TextAlign.center,
//                                   'This is an example error message that will be shown in the body of materialBanner!',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w200),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Positioned(
//                         bottom: -38,
//                         child: ClipRRect(
//                           child: Stack(
//                             children: [
//                               Image(
//                                 height: 120,
//                                 image: NetworkImage(
//                                     'https://freesvg.org/img/1692013346sphinx1c.png'),
//                                 fit: BoxFit.fill,
//                               ),
//                             ],
//                           ),
//                         ))
//                   ]),
//                 ));
//             Navigator.pushNamed(context, 'homescreen');
//           },
//           child: const Text("Log In")),
//     ),
//   );
// }

// Positioned positionedImage(String image) {
//   return Positioned(
//       child: ClipRRect(
//     child: Stack(
//       children: [
//         Image(
//           height: 90,
//           image: NetworkImage(image),
//           fit: BoxFit.fill,
//         ),
//         const SizedBox(
//           height: 30,
//         )
//       ],
//     ),
//   ));
// }
}
