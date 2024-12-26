// workout_screen.dart
import 'package:flutter/material.dart';
import './widgets/workout_category_card.dart';
import './data/exercises.dart';
import 'exercise_screen.dart';

class Workouts extends StatelessWidget {
  const Workouts({super.key});

  @override
  Widget build(BuildContext context) {
    final overweightExercises = List<Map<String, String>>.from(
        exercises['Overweight']!['exercises'] as List<dynamic>);
    final underweightExercises = List<Map<String, String>>.from(
        exercises['Underweight']!['exercises'] as List<dynamic>);
    final normalExercises = List<Map<String, String>>.from(
        exercises['Normal']!['exercises'] as List<dynamic>);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Overweight Workout Category
            WorkoutCategoryCard(
              categoryName: 'Overweight',
              description: 'Exercises tailored for weight loss.',
              imagePath: exercises['Overweight']!['imagePath'] as String,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseScreen(
                      categoryName: 'Overweight',
                      exercises: overweightExercises,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Underweight Workout Category
            WorkoutCategoryCard(
              categoryName: 'Underweight',
              description: 'Exercises to build muscle mass.',
              imagePath: exercises['Underweight']!['imagePath'] as String,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseScreen(
                      categoryName: 'Underweight',
                      exercises: underweightExercises,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Normal Workout Category
            WorkoutCategoryCard(
              categoryName: 'Normal',
              description: 'Exercises to maintain fitness.',
              imagePath: exercises['Normal']!['imagePath'] as String,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseScreen(
                      categoryName: 'Normal',
                      exercises: normalExercises,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
