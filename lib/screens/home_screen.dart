import 'package:flutter/material.dart';
import 'slider_screen.dart';
import 'widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image with fade effect
            Stack(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [0.8, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'lib/assets/images/home.png', // Replace with your image path
                    width: 396,
                    height: 565,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Center-aligned text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Wherever You Are\nHealth Is Number One',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'There is no instant way to a healthy life',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Button
                  Center(
                    child: CustomButton(
                      text: 'Get Started',
                      onPressed: () {
                        // Navigate to SliderScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SliderScreen(),
                          ),
                        );
                      },
                      backgroundColor: Colors.teal,
                      textColor: Colors.white,
                      borderRadius: 25.0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
