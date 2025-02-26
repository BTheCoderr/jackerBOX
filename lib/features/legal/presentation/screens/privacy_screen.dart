import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

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
        title: const Text('Privacy Policy'),
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
                    Icons.privacy_tip,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Privacy Policy',
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

            // Privacy Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    title: '1. Information We Collect',
                    content: 'We collect various types of information to provide and improve our services:',
                    bulletPoints: [
                      'Personal information (name, email, phone number)',
                      'Payment information',
                      'Device and usage information',
                      'Location data',
                      'Communication records',
                    ],
                  ),
                  _buildSection(
                    title: '2. How We Use Your Information',
                    content: 'We use the collected information for the following purposes:',
                    bulletPoints: [
                      'To provide and maintain our services',
                      'To process your transactions',
                      'To communicate with you',
                      'To improve our services',
                      'To comply with legal obligations',
                    ],
                  ),
                  _buildSection(
                    title: '3. Information Sharing',
                    content: 'We may share your information with:',
                    bulletPoints: [
                      'Other users as necessary for rentals',
                      'Service providers and partners',
                      'Legal authorities when required',
                      'Third parties with your consent',
                    ],
                  ),
                  _buildSection(
                    title: '4. Data Security',
                    content: 'We implement appropriate security measures to protect your information:',
                    bulletPoints: [
                      'Encryption of sensitive data',
                      'Regular security assessments',
                      'Access controls and monitoring',
                      'Secure data storage practices',
                    ],
                  ),
                  _buildSection(
                    title: '5. Your Rights',
                    content: 'You have certain rights regarding your personal information:',
                    bulletPoints: [
                      'Access your data',
                      'Request corrections',
                      'Delete your account',
                      'Opt-out of marketing communications',
                      'Data portability',
                    ],
                  ),
                  _buildSection(
                    title: '6. Cookies and Tracking',
                    content: 'We use cookies and similar technologies to:',
                    bulletPoints: [
                      'Improve user experience',
                      'Analyze usage patterns',
                      'Remember your preferences',
                      'Provide personalized content',
                    ],
                  ),
                  _buildSection(
                    title: '7. Children\'s Privacy',
                    content: 'Our services are not intended for children under 18. We do not knowingly collect or maintain information from persons under 18 years of age.',
                  ),
                  _buildSection(
                    title: '8. Changes to Privacy Policy',
                    content: 'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last updated" date.',
                  ),
                  _buildSection(
                    title: '9. Contact Us',
                    content: 'If you have any questions about this Privacy Policy, please contact us at privacy@jackerbox.com',
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