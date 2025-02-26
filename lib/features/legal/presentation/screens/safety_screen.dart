import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Safety Guidelines'),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Section
            Container(
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Icon(
                    Icons.security,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Safety Guidelines',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Last updated: March 15, 2024',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            // Safety Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    title: '1. Equipment Safety',
                    content: 'Essential guidelines for equipment safety:',
                    bulletPoints: [
                      'Always inspect equipment before use',
                      'Follow manufacturer safety guidelines',
                      'Use proper protective gear',
                      'Report any equipment malfunctions immediately',
                    ],
                  ),
                  _buildSection(
                    title: '2. Personal Safety',
                    content: 'Protect yourself and others:',
                    bulletPoints: [
                      'Meet in safe, public locations for equipment handoff',
                      'Share trip details with trusted contacts',
                      'Trust your instincts',
                      'Keep emergency contacts readily available',
                    ],
                  ),
                  _buildSection(
                    title: '3. Account Security',
                    content: 'Maintain secure account practices:',
                    bulletPoints: [
                      'Use strong, unique passwords',
                      'Enable two-factor authentication',
                      'Never share login credentials',
                      'Log out from shared devices',
                    ],
                  ),
                  _buildSection(
                    title: '4. Safe Transactions',
                    content: 'Guidelines for secure payments:',
                    bulletPoints: [
                      'Use only platform-approved payment methods',
                      'Never accept off-platform payments',
                      'Keep transaction records',
                      'Report suspicious payment requests',
                    ],
                  ),
                  _buildSection(
                    title: '5. Emergency Procedures',
                    content: 'In case of emergency:',
                    bulletPoints: [
                      'Contact emergency services if needed',
                      'Report incidents through the app',
                      'Document any damages or issues',
                      'Follow incident reporting procedures',
                    ],
                  ),
                  _buildSection(
                    title: '6. Insurance Coverage',
                    content: 'Understanding protection:',
                    bulletPoints: [
                      'Review insurance coverage details',
                      'Understand liability limits',
                      'Know what\'s covered and what\'s not',
                      'Follow claim procedures when needed',
                    ],
                  ),
                  _buildSection(
                    title: '7. Communication Safety',
                    content: 'Safe communication practices:',
                    bulletPoints: [
                      'Keep all communication on platform',
                      'Don\'t share personal contact information',
                      'Report inappropriate messages',
                      'Block problematic users if necessary',
                    ],
                  ),
                  _buildSection(
                    title: '8. Equipment Verification',
                    content: 'Before renting:',
                    bulletPoints: [
                      'Verify equipment condition with photos',
                      'Document any existing damage',
                      'Test equipment functionality if possible',
                      'Confirm safety features are working',
                    ],
                  ),
                  _buildSection(
                    title: '9. Weather and Environmental Safety',
                    content: 'Consider environmental factors:',
                    bulletPoints: [
                      'Check weather conditions before use',
                      'Follow equipment weather restrictions',
                      'Avoid hazardous conditions',
                      'Have backup plans for weather changes',
                    ],
                  ),
                  _buildSection(
                    title: '10. Contact Information',
                    content: 'For safety concerns or emergencies, contact our 24/7 safety team at safety@jackerbox.com or call our emergency hotline at 1-800-SAFE-NOW',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    List<String>? bulletPoints,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
          ),
        ),
        if (bulletPoints != null) ...[
          const SizedBox(height: 16),
          ...bulletPoints.map((point) => Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ],
    );
  }
} 