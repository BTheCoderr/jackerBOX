import 'package:flutter/material.dart';
import '../widgets/legal_document_template.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
        title: const Text('Terms of Service'),
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
                    Icons.gavel,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Terms of Service',
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

            // Terms Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    title: '1. Acceptance of Terms',
                    content: 'By accessing or using Jackerbox\'s services, including our website, mobile application, and equipment rental platform (collectively, the "Services"), you agree to be bound by these Terms of Service ("Terms"). If you do not agree to these Terms, do not use our Services.\n\nThese Terms constitute a legally binding agreement between you and Jackerbox regarding your use of the Services.',
                  ),
                  _buildSection(
                    title: '2. Eligibility',
                    content: 'To use our Services, you must be at least 18 years old and capable of forming a binding contract. By using our Services, you represent and warrant that you meet these requirements.\n\nAdditional eligibility requirements may apply for specific services, such as equipment rental or hosting.',
                  ),
                  _buildSection(
                    title: '3. Account Registration',
                    content: 'To access certain features of our Services, you must register for an account. You agree to:',
                    bulletPoints: [
                      'Provide accurate and complete information during registration',
                      'Maintain the security of your account credentials',
                      'Promptly update your account information if it changes',
                      'Accept responsibility for all activities that occur under your account',
                    ],
                  ),
                  _buildSection(
                    title: '4. Equipment Rental Terms',
                    content: 'When renting equipment through our platform:',
                    bulletPoints: [
                      'You must provide valid identification and payment information',
                      'You are responsible for inspecting the equipment before use',
                      'You must return the equipment in the same condition, accounting for normal wear and tear',
                      'You must follow all safety guidelines and operating instructions',
                    ],
                  ),
                  _buildSection(
                    title: '5. Host Obligations',
                    content: 'If you choose to become a host on our platform, you agree to:',
                    bulletPoints: [
                      'Provide accurate descriptions and images of your equipment',
                      'Maintain your equipment in safe, working condition',
                      'Comply with all applicable laws and regulations',
                      'Maintain appropriate insurance coverage',
                    ],
                  ),
                  _buildSection(
                    title: '6. Payments and Fees',
                    content: 'All payments and fees are subject to the following terms:',
                    bulletPoints: [
                      'Rental fees are set by hosts and displayed in the listing',
                      'Jackerbox charges a service fee for platform usage',
                      'All payments must be made through our secure payment system',
                      'Refunds are subject to our Cancellation Policy',
                    ],
                  ),
                  _buildSection(
                    title: '7. Prohibited Activities',
                    content: 'You agree not to engage in any of the following activities:',
                    bulletPoints: [
                      'Violating any applicable laws or regulations',
                      'Circumventing our payment system',
                      'Creating false or misleading listings',
                      'Harassing other users or engaging in discriminatory behavior',
                    ],
                  ),
                  _buildSection(
                    title: '8. Termination',
                    content: 'Jackerbox reserves the right to suspend or terminate your account and access to the Services at any time for violations of these Terms or for any other reason at our sole discretion.',
                  ),
                  _buildSection(
                    title: '9. Changes to Terms',
                    content: 'We may modify these Terms at any time. We will notify you of any material changes through our Services or via email. Your continued use of our Services after such modifications constitutes acceptance of the updated Terms.',
                  ),
                  _buildSection(
                    title: '10. Contact Information',
                    content: 'If you have any questions about these Terms, please contact us at legal@jackerbox.com',
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