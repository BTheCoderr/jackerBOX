import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';

class GuidelinesScreen extends StatelessWidget {
  const GuidelinesScreen({super.key});

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
        title: const Text('Community Guidelines'),
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
                    Icons.people,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Community Guidelines',
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

            // Guidelines Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    title: '1. Introduction',
                    content: 'Our Community Guidelines help ensure Jackerbox remains a safe, respectful, and reliable platform for all users. These guidelines outline the expected behavior and standards for our community.',
                  ),
                  _buildSection(
                    title: '2. Respect and Inclusion',
                    content: 'We expect all members to:',
                    bulletPoints: [
                      'Treat everyone with respect and dignity',
                      'Avoid discriminatory behavior or language',
                      'Be inclusive and welcoming to all',
                      'Respect diverse perspectives and experiences',
                    ],
                  ),
                  _buildSection(
                    title: '3. Safety First',
                    content: 'Safety guidelines for all users:',
                    bulletPoints: [
                      'Follow equipment safety instructions',
                      'Report unsafe conditions or behavior',
                      'Never share personal security information',
                      'Use secure payment methods only',
                    ],
                  ),
                  _buildSection(
                    title: '4. Communication Standards',
                    content: 'When communicating on Jackerbox:',
                    bulletPoints: [
                      'Be clear and professional',
                      'Respond promptly to messages',
                      'Keep communication on the platform',
                      'Report inappropriate messages',
                    ],
                  ),
                  _buildSection(
                    title: '5. Honest Listings',
                    content: 'Equipment listings must:',
                    bulletPoints: [
                      'Accurately describe the equipment',
                      'Use real, current photos',
                      'List all known issues or damage',
                      'Include clear terms and conditions',
                    ],
                  ),
                  _buildSection(
                    title: '6. Responsible Renting',
                    content: 'Renters should:',
                    bulletPoints: [
                      'Follow rental agreements',
                      'Return equipment on time',
                      'Report any issues promptly',
                      'Respect equipment and owners',
                    ],
                  ),
                  _buildSection(
                    title: '7. Reviews and Feedback',
                    content: 'When leaving reviews:',
                    bulletPoints: [
                      'Be honest and fair',
                      'Focus on the rental experience',
                      'Avoid personal attacks',
                      'Provide constructive feedback',
                    ],
                  ),
                  _buildSection(
                    title: '8. Dispute Resolution',
                    content: 'In case of disputes:',
                    bulletPoints: [
                      'Attempt direct communication first',
                      'Use our resolution center',
                      'Provide documentation',
                      'Follow mediator guidance',
                    ],
                  ),
                  _buildSection(
                    title: '9. Reporting Violations',
                    content: 'If you witness guideline violations:',
                    bulletPoints: [
                      'Report immediately through the app',
                      'Provide specific details',
                      'Include supporting evidence',
                      'Maintain confidentiality',
                    ],
                  ),
                  _buildSection(
                    title: '10. Contact Information',
                    content: 'For questions about our Community Guidelines or to report violations, contact our trust and safety team at safety@jackerbox.com',
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