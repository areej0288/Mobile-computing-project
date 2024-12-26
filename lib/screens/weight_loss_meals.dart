import 'package:flutter/material.dart';
import 'meal_logger_screen.dart'; // Import the MealLogger screen

class WeightLossMeals extends StatelessWidget {
  WeightLossMeals({super.key}); // Removed const

  final Map<String, List<Map<String, String>>> weightLossMeals = const {
    'Breakfast': [
      {
        'name': 'Greek Yogurt with Berries',
        'calories': '200 kcal',
        'benefit': 'Low-calorie snack rich in protein and antioxidants.',
        'image':
            'https://www.thekitchenmagpie.com/wp-content/uploads/images/2011/04/greekyogurtandberries1.jpg',
      },
      {
        'name': 'Avocado Toast with Tomato',
        'calories': '250 kcal',
        'benefit': 'Rich in healthy fats and fiber for sustained energy.',
        'image':
            'https://tse2.mm.bing.net/th?id=OIP.HA3cW7SvPqPh4S8AtTPm-gHaJR&pid=Api&P=0&h=220',
      },
    ],
    'Lunch': [
      {
        'name': 'Quinoa Salad with Avocado',
        'calories': '350 kcal',
        'benefit': 'Packed with fiber and healthy fats for satiety.',
        'image':
            'https://www.chelseasmessyapron.com/wp-content/uploads/2017/05/Quinoa-Avocado-Power-Salad3.jpg',
      },
      {
        'name': 'Grilled Chicken Salad',
        'calories': '300 kcal',
        'benefit':
            'High in protein and low in carbs for effective weight loss.',
        'image':
            'https://www.wellseasonedstudio.com/wp-content/uploads/2023/04/Grilled-chicken-salad-with-cucumbers-and-creamy-garlic-dressing-on-a-plate.jpg',
      },
    ],
    'Dinner': [
      {
        'name': 'Grilled Salmon with Steamed Veggies',
        'calories': '300 kcal',
        'benefit': 'High in omega-3s and low in calories.',
        'image':
            'https://www.cookingclassy.com/wp-content/uploads/2018/05/grilled-salmon-3.jpg',
      },
      {
        'name': 'Stir-Fried Vegetables with Tofu',
        'calories': '250 kcal',
        'benefit': 'Rich in plant-based protein and essential nutrients.',
        'image':
            'https://tse4.mm.bing.net/th?id=OIP.lzR54LAtaORWzgO-VhA9cgHaFj&pid=Api&P=0&h=220',
      },
    ],
  };

  int dailyCalorieGoal = 1500; // Daily Calorie Goal for weight loss

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Loss Meals'),
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
                  "This is your target calorie intake to achieve your weight loss goals. Stick to this target for steady and sustainable weight loss.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // List of Meals
          ...weightLossMeals.entries.map((entry) {
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
                        const MealLogger(goalTitle: 'Weight Loss'),
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
