import 'package:ciperschools_assignment_app/ui/screens/gettingStarted_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future delayed() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const GettingStartedScreen()));
    }
  }

  @override
  void initState() {
    delayed();
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
        // clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFF7B61FF)),
        child: Stack(
          children: [
            Positioned(
              left: width * 0.36,
              top: height * 0.39,
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
              left: width * 0.32,
              top: height * 0.53,
              child: const Text(
                'CipHerX',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontFamily: 'Bruno Ace SC',
                  fontWeight: FontWeight.w400,
                  height: 1,
                  letterSpacing: -0.72,
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
              left: width * 0.3,
              bottom: height * 0.08,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'By\nOpen Source ',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5400000214576721),
                          fontSize: 15,
                          fontFamily: 'Cambay',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.30,
                          height: 1.4),
                    ),
                    const TextSpan(
                      text: 'Community',
                      style: TextStyle(
                        color: Color(0xFFF7A301),
                        fontSize: 15,
                        fontFamily: 'Cambay',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
