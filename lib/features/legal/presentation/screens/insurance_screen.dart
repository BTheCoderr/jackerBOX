import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';

class InsuranceScreen extends StatelessWidget {
  const InsuranceScreen({super.key});

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
        title: const Text('Insurance & Protection'),
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
                    'Insurance & Protection',
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

            // Insurance Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    title: '1. Coverage Overview',
                    content: 'Our insurance and protection program includes:',
                    bulletPoints: [
                      'Equipment damage protection up to \$10,000',
                      'Liability coverage up to \$1,000,000',
                      'Theft protection with police report',
                      'Coverage during transit and use',
                    ],
                  ),
                  _buildSection(
                    title: '2. Host Protection',
                    content: 'Benefits for equipment owners:',
                    bulletPoints: [
                      'Damage protection for listed equipment',
                      'Liability coverage for rental period',
                      'Theft recovery assistance',
                      'Legal support for disputes',
                    ],
                  ),
                  _buildSection(
                    title: '3. Renter Protection',
                    content: 'Benefits for equipment renters:',
                    bulletPoints: [
                      'Accident coverage during rental',
                      'Personal liability protection',
                      'Emergency support 24/7',
                      'Trip cancellation coverage',
                    ],
                  ),
                  _buildSection(
                    title: '4. What\'s Not Covered',
                    content: 'Exclusions from coverage:',
                    bulletPoints: [
                      'Intentional damage or misuse',
                      'Pre-existing equipment issues',
                      'Unauthorized modifications',
                      'Loss due to negligence',
                    ],
                  ),
                  _buildSection(
                    title: '5. Making a Claim',
                    content: 'Steps to file an insurance claim:',
                    bulletPoints: [
                      'Document the incident immediately',
                      'Take photos of any damage',
                      'Contact support within 24 hours',
                      'Complete claim form online',
                    ],
                  ),
                  _buildSection(
                    title: '6. Deductibles',
                    content: 'Understanding your costs:',
                    bulletPoints: [
                      'Standard deductible: \$250',
                      'Theft deductible: \$500',
                      'Liability claims: \$0',
                      'Optional reduced deductible plans available',
                    ],
                  ),
                  _buildSection(
                    title: '7. Additional Coverage',
                    content: 'Optional protection upgrades:',
                    bulletPoints: [
                      'Premium protection plan',
                      'Extended liability coverage',
                      'Zero deductible option',
                      'International coverage',
                    ],
                  ),
                  _buildSection(
                    title: '8. Contact Information',
                    content: 'For insurance questions or to file a claim, contact our insurance team at insurance@jackerbox.com or call our 24/7 claims hotline at 1-800-JACKERBOX.',
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