import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/slider_screen.dart';
import 'screens/meal_planner_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with the correct options for the platform
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // Use the generated options
  );

  runApp(const FitnestXApp());
}

class FitnestXApp extends StatelessWidget {
  const FitnestXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Roboto', // Optional: Apply custom font if required
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/slider': (context) => const SliderScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/mealPlanner': (context) => const MealPlannerScreen(),
      },
    );
  }
}
