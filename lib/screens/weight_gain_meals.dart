import 'package:flutter/material.dart';
import 'meal_logger_screen.dart';

class WeightGainMeals extends StatefulWidget {
  const WeightGainMeals({super.key});

  @override
  _WeightGainMealsState createState() => _WeightGainMealsState();
}

class _WeightGainMealsState extends State<WeightGainMeals> {
  final Map<String, List<Map<String, String>>> weightGainMeals = const {
    'Breakfast': [
      {
        'name': 'Peanut Butter Banana Smoothie',
        'calories': '450 kcal',
        'benefit': 'Rich in protein and healthy fats for muscle building.',
        'image':
            'https://lovingitvegan.com/wp-content/uploads/2018/03/Peanut-Butter-Banana-Smoothie-9.jpg',
      },
      {
        'name': 'Avocado Toast with Egg',
        'calories': '320 kcal',
        'benefit': 'Provides healthy fats and protein for sustained energy.',
        'image':
            'https://zenandspice.com/wp-content/uploads/2019/06/avo-toast-1-sq-1024x1024.jpg',
      },
    ],
    'Lunch': [
      {
        'name': 'Grilled Chicken with Brown Rice',
        'calories': '550 kcal',
        'benefit': 'High in lean protein and complex carbs for energy.',
        'image':
            'http://www.rippedrecipes.com/images/snaps/full_grilled-chicken-breast-brown-rice-pasta-with-tomato-basil-sauce_TuB9ISh5z30r4.jpg',
      },
      {
        'name': 'Turkey Sandwich with Avocado',
        'calories': '480 kcal',
        'benefit':
            'Perfect balance of protein and healthy fats for muscle gain.',
        'image':
            'https://californiaavocado.com/wp-content/uploads/2021/02/CaliforniaAvocadoTurkeySaladAndSandwich_0045_v1_current-2048x1365.jpg',
      },
    ],
    'Dinner': [
      {
        'name': 'Salmon with Quinoa and Vegetables',
        'calories': '600 kcal',
        'benefit': 'Packed with omega-3 fatty acids and essential nutrients.',
        'image':
            'https://www.jessicagavin.com/wp-content/uploads/2016/02/mediterranean-spiced-salmon-over-vegetable-quinoa-1200.jpg',
      },
      {
        'name': 'Beef Stir Fry with Noodles',
        'calories': '650 kcal',
        'benefit': 'Rich in protein and energy-boosting carbs for weight gain.',
        'image':
            'https://img.hellofresh.com/hellofresh_s3/image/stir-fried-beef-hokkien-noodles-990f1852.jpg',
      },
    ],
  };

  int dailyCalorieGoal = 2500; // Daily Calorie Goal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Gain Meals'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // Calorie Goal Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daily Calorie Goal: $dailyCalorieGoal kcal",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "This is your target calorie intake to achieve your weight gain goals. Make sure to stick to this target to see progress over time!",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // List of Meals
          ...weightGainMeals.entries.map((entry) {
            final String mealTime = entry.key;
            final List<Map<String, String>> meals = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealTime,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 10),
                ...meals.map((meal) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.network(
                            meal['image']!,
                            height: 180,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return Container(
                                height: 180,
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 180,
                                alignment: Alignment.center,
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                meal['name']!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Calories: ${meal['calories']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                meal['benefit']!,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 20),
              ],
            );
          }),

          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigate to MealLogger screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MealLogger(goalTitle: 'Weight Gain'),
                  ),
                );
              },
              child: const Text('Log Your Meals'),
            ),
          ),
        ],
      ),
    );
  }
}
