import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';

class HostAgreementScreen extends StatelessWidget {
  const HostAgreementScreen({super.key});

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
        title: const Text('Host Agreement'),
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
                    Icons.business,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Host Agreement',
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

            // Agreement Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    title: '1. Introduction',
                    content: 'This Host Agreement outlines the terms and conditions for equipment hosts on the Jackerbox platform. By listing equipment on Jackerbox, you agree to comply with all terms outlined in this agreement.',
                  ),
                  _buildSection(
                    title: '2. Host Eligibility',
                    content: 'To become a host on Jackerbox, you must:',
                    bulletPoints: [
                      'Be at least 18 years old',
                      'Have a valid government-issued ID',
                      'Own or have authority to rent out the listed equipment',
                      'Pass our verification process',
                    ],
                  ),
                  _buildSection(
                    title: '3. Equipment Standards',
                    content: 'All equipment listed on Jackerbox must:',
                    bulletPoints: [
                      'Be in good working condition',
                      'Meet safety requirements',
                      'Be accurately described',
                      'Be properly maintained',
                    ],
                  ),
                  _buildSection(
                    title: '4. Host Responsibilities',
                    content: 'As a host, you are responsible for:',
                    bulletPoints: [
                      'Maintaining accurate calendar availability',
                      'Responding to rental requests promptly',
                      'Providing clean and functional equipment',
                      'Following local laws and regulations',
                    ],
                  ),
                  _buildSection(
                    title: '5. Pricing and Payments',
                    content: 'Understanding the financial aspects:',
                    bulletPoints: [
                      'Set your own rental rates',
                      'Jackerbox takes a service fee',
                      'Payments are processed securely',
                      'Payouts are made within 24 hours of rental completion',
                    ],
                  ),
                  _buildSection(
                    title: '6. Cancellations',
                    content: 'Host cancellation policies:',
                    bulletPoints: [
                      'Provide reasonable notice',
                      'May affect host rating',
                      'May incur penalties',
                      'Must have valid reasons',
                    ],
                  ),
                  _buildSection(
                    title: '7. Insurance and Liability',
                    content: 'Understanding coverage and protection:',
                    bulletPoints: [
                      'Host protection insurance',
                      'Damage coverage details',
                      'Liability limitations',
                      'Claims process',
                    ],
                  ),
                  _buildSection(
                    title: '8. Account Suspension',
                    content: 'Your account may be suspended for:',
                    bulletPoints: [
                      'Violating terms of service',
                      'Poor host performance',
                      'Safety concerns',
                      'Fraudulent activity',
                    ],
                  ),
                  _buildSection(
                    title: '9. Contact Information',
                    content: 'For questions about the Host Agreement, contact our host support team at hosts@jackerbox.com',
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