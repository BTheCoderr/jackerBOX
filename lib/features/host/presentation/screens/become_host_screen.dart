import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BecomeHostScreen extends StatelessWidget {
  const BecomeHostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Become a Host'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Section
            Container(
              height: 300,
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Share your equipment\nEarn extra income',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Join thousands of hosts on Jackerbox',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            // Benefits Section
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Why host on Jackerbox?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildBenefitItem(
                    context,
                    icon: Icons.attach_money,
                    title: 'Earn money',
                    description: 'Turn your idle equipment into a steady income stream.',
                  ),
                  _buildBenefitItem(
                    context,
                    icon: Icons.security,
                    title: 'Host with confidence',
                    description: 'Equipment protection and insurance included on every rental.',
                  ),
                  _buildBenefitItem(
                    context,
                    icon: Icons.people,
                    title: 'Join our community',
                    description: 'Connect with creators and professionals in your area.',
                  ),
                  _buildBenefitItem(
                    context,
                    icon: Icons.schedule,
                    title: 'Flexible scheduling',
                    description: 'You control your calendar and pricing.',
                  ),

                  const SizedBox(height: 32),
                  const Text(
                    'How much could you earn?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _buildEarningExample(
                          'Camera Kit',
                          dailyRate: 100,
                          daysPerMonth: 10,
                        ),
                        const Divider(),
                        _buildEarningExample(
                          'Lighting Equipment',
                          dailyRate: 75,
                          daysPerMonth: 8,
                        ),
                        const Divider(),
                        _buildEarningExample(
                          'Audio Setup',
                          dailyRate: 50,
                          daysPerMonth: 12,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/auth/signup');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text('Get Started'),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.go('/how-it-works');
                      },
                      child: const Text('Learn more about hosting'),
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

  Widget _buildBenefitItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 24,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEarningExample(String equipment, {
    required double dailyRate,
    required int daysPerMonth,
  }) {
    final monthlyEarnings = dailyRate * daysPerMonth;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  equipment,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$$dailyRate/day × $daysPerMonth days',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${monthlyEarnings.toStringAsFixed(0)}/mo',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
} 