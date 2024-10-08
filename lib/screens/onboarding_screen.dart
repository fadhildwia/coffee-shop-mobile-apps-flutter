import 'package:coffee_shop_mobile_apps/utils/assets.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double imageHeight = screenHeight * 2 / 3;
    final double textAreaHeight = screenHeight * 3 / 7;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: imageHeight,
            width: double.infinity,
            child: Image.asset(
              '${AssetPath.imagePath}/coffee-6.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(24),
              alignment: Alignment.bottomCenter,
              height: textAreaHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    style: TextStyle(
                      color: Color.fromRGBO(162, 162, 162, 1),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromRGBO(198, 124, 78, 1),
                        ),
                        padding: WidgetStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
