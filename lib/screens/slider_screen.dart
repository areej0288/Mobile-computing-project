import 'package:flutter/material.dart';
import 'bmi_calculator.dart';
import 'workouts.dart';
import 'meal_planner_screen.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> sliderOptions = [
    {
      'icon': Icons.calculate,
      'label': 'BMI Calculator',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BMICalculator()),
        );
      },
    },
    {
      'icon': Icons.fitness_center,
      'label': 'Workouts',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Workouts()),
        );
      },
    },
    {
      'icon': Icons.restaurant_menu,
      'label': 'Meal Planner',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MealPlannerScreen()),
        );
      },
    },
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scaffoldKey.currentState?.openDrawer(); // Automatically open the drawer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Open the drawer
          },
        ),
        title: const Text(
          'Slider Menu',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
              ),
              child: const Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...sliderOptions.map((option) {
              return ListTile(
                leading: Icon(option['icon'], color: Colors.blueGrey[900]),
                title: Text(option['label']),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  option['onTap'](context); // Navigate to the selected screen
                },
              );
            }),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                sliderOptions[currentIndex]['label'],
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
