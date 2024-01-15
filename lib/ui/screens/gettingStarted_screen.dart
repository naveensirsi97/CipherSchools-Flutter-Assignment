import 'package:ciperschools_assignment_app/services/auth_services.dart';
import 'package:ciperschools_assignment_app/ui/screens/dashboard/creatorBottomBar.dart';
import 'package:ciperschools_assignment_app/ui/screens/signUp_screen.dart';
import 'package:flutter/material.dart';

class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({super.key});

  @override
  State<GettingStartedScreen> createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFF7B61FF)),
        child: Stack(
          children: [
            Positioned(
              left: width * 0.08,
              top: height * 0.1,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/images/img_4.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: -5,
              top: -5,
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.asset(
                  'assets/images/img.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              right: -35,
              top: -50,
              child: SizedBox(
                width: 190,
                height: 190,
                child: Image.asset(
                  'assets/images/img_1.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
                left: -5,
                bottom: -5,
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset(
                    'assets/images/img_2.png',
                    fit: BoxFit.fill,
                  ),
                )),
            Positioned(
              left: -40,
              bottom: -40,
              child: SizedBox(
                width: 190,
                height: 190,
                child: Image.asset(
                  'assets/images/img_3.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.1,
              left: width * 0.07,
              right: width * 0.05,
              child: SizedBox(
                width: width,
                height: height * 0.2,
                child: Stack(
                  children: [
                    const Positioned(
                      left: 0,
                      top: 0,
                      child: Text(
                        'Welcome to  ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontFamily: 'ABeeZee',
                          fontWeight: FontWeight.w400,
                          height: 1,
                          letterSpacing: -0.80,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 36,
                      top: 58,
                      child: Text(
                        'CipherX.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontFamily: 'Bruno Ace SC',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          letterSpacing: -0.72,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 11,
                      top: 117,
                      child: Text(
                        'The best way to track your expenses.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'ABeeZee',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 220,
                      top: 11,
                      child: InkWell(
                        onTap: () {
                          if (AuthService().auth.currentUser != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const CreatorBottomBar();
                                },
                              ),
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignUpScreen();
                                },
                              ),
                            );
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 86,
                          height: 86,
                          decoration: const ShapeDecoration(
                            color: Color(0xBFECE1E1),
                            shape: OvalBorder(),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: height * 0.07,
                            weight: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
