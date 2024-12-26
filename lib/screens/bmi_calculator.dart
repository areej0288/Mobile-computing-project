import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  String selectedGender = 'Male'; // Tracks the selected gender
  bool isCmSelected = false; // Tracks whether cm or ft/inch is selected
  int heightFeet = 5;
  int heightInches = 6;
  int heightCm = 170;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gender Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GenderButton(
                  label: 'Male',
                  icon: Icons.male,
                  isSelected: selectedGender == 'Male',
                  onTap: () {
                    setState(() {
                      selectedGender = 'Male';
                    });
                  },
                ),
                GenderButton(
                  label: 'Female',
                  icon: Icons.female,
                  isSelected: selectedGender == 'Female',
                  onTap: () {
                    setState(() {
                      selectedGender = 'Female';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Height Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Height',
                  style: TextStyle(fontSize: 18, color: Colors.teal),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      borderRadius: BorderRadius.circular(10),
                      isSelected: [!isCmSelected, isCmSelected],
                      onPressed: (index) {
                        setState(() {
                          isCmSelected = index == 1;
                        });
                      },
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text('Feet/Inches'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text('CM'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                if (!isCmSelected) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Feet',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              heightFeet = int.tryParse(value) ?? 0;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 70,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Inches',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              heightInches = int.tryParse(value) ?? 0;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Current Height: $heightFeet ft $heightInches in',
                    textAlign: TextAlign.center,
                  ),
                ] else ...[
                  SizedBox(
                    width: 120,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'CM',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          heightCm = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Current Height: $heightCm cm',
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 20),

            // Weight Section
            _buildAdjustableInput('Weight', weight, (value) {
              setState(() {
                weight = value;
              });
            }),
            const SizedBox(height: 20),

            // Age Section
            _buildAdjustableInput('Age', age, (value) {
              setState(() {
                age = value;
              });
            }),
            const SizedBox(height: 40),

            // Calculate Button
            ElevatedButton(
              onPressed: () {
                double heightInMeters = isCmSelected
                    ? heightCm / 100
                    : (heightFeet * 12 + heightInches) * 0.0254;
                double bmi = weight / (heightInMeters * heightInMeters);

                String category;
                if (bmi < 18.5) {
                  category = 'Underweight';
                } else if (bmi < 24.9) {
                  category = 'Normal';
                } else if (bmi < 29.9) {
                  category = 'Overweight';
                } else {
                  category = 'Obese';
                }

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('BMI Result'),
                    content: Text(
                      'Your BMI is ${bmi.toStringAsFixed(2)} ($category)',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.teal,
              ),
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Method for Weight and Age Inputs
  Widget _buildAdjustableInput(
      String label, int value, Function(int) onChange) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 18, color: Colors.teal)),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle, color: Colors.teal),
              onPressed: () {
                if (value > 0) onChange(value - 1);
              },
            ),
            Text('$value', style: const TextStyle(fontSize: 18)),
            IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.teal),
              onPressed: () {
                onChange(value + 1);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class GenderButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderButton({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 80,
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: isSelected ? Colors.white : Colors.black, size: 30),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
