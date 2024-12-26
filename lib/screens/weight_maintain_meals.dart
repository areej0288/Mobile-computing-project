import 'package:flutter/material.dart';
import 'meal_logger_screen.dart';

class WeightMaintainMeals extends StatelessWidget {
  WeightMaintainMeals({super.key}); // Removed const

  final Map<String, List<Map<String, String>>> weightMaintainMeals = const {
    'Breakfast': [
      {
        'name': 'Oatmeal with Almond Butter and Banana',
        'calories': '350 kcal',
        'benefit':
            'Provides a good balance of carbs, protein, and healthy fats for sustained energy.',
        'image':
            'http://3.bp.blogspot.com/-IpPC9RMQNw8/UFABf4Whk1I/AAAAAAAABtA/Bdt05EQU8P4/s1600/oats.jpg',
      },
      {
        'name': 'Scrambled Eggs with Spinach and Whole Wheat Toast',
        'calories': '400 kcal',
        'benefit':
            'Packed with protein and fiber for a filling and nutritious start to your day.',
        'image':
            'https://tse2.mm.bing.net/th?id=OIP.UD0eI6mRof2DRB4wVLpZqAHaFj&pid=Api&P=0&h=220',
      },
    ],
    'Lunch': [
      {
        'name': 'Turkey and Avocado Wrap',
        'calories': '450 kcal',
        'benefit':
            'Rich in lean protein and healthy fats to keep you full and satisfied.',
        'image':
            'https://tse4.mm.bing.net/th?id=OIP.Yxz4GOJsBYxuYBjdzi_qUQHaFF&pid=Api&P=0&h=220',
      },
      {
        'name': 'Vegetable Stir-Fry with Brown Rice',
        'calories': '500 kcal',
        'benefit':
            'Packed with fiber and antioxidants, this meal helps you stay energized and full.',
        'image':
            'https://forksandstraws.com/wp-content/uploads/2016/03/brown-rice2-scaled.jpg',
      },
    ],
    'Dinner': [
      {
        'name': 'Baked Chicken with Sweet Potatoes and Broccoli',
        'calories': '500 kcal',
        'benefit':
            'A well-rounded meal providing protein, fiber, and essential nutrients.',
        'image':
            'https://www.thespruceeats.com/thmb/hHnAwsqJKNr-TDgV0TUf_DPwRqg=/6016x4016/filters:no_upscale():max_bytes(150000):strip_icc()/roasted-sheet-pan-chicken-4155633-step-08-1c840766ef8049aa9554efbb681d0c63.jpg',
      },
      {
        'name': 'Grilled Steak with Quinoa Salad',
        'calories': '600 kcal',
        'benefit':
            'A satisfying meal with protein, healthy fats, and whole grains to support muscle recovery.',
        'image':
            'https://blog.myfitnesspal.com/wp-content/uploads/2018/08/Peruvian-Quinoa-Salad-with-Grilled-Skirt-Steak-752x472.jpg',
      },
    ],
  };

  int dailyCalorieGoal = 2500; // Daily Calorie Goal for weight maintenance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Maintenance Meals'),
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
                  "This is your target calorie intake to maintain your current weight. Eating around this target will help you maintain your weight without gaining or losing.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // List of Meals
          ...weightMaintainMeals.entries.map((entry) {
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
                        const MealLogger(goalTitle: 'Weight Maintain'),
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
