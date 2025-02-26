import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';

class CancellationScreen extends StatelessWidget {
  const CancellationScreen({super.key});

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
        title: const Text('Cancellation Policy'),
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
                    Icons.event_busy,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Cancellation Policy',
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

            // Cancellation Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    title: '1. Cancellation Windows',
                    content: 'Our cancellation policy is designed to be fair to both renters and hosts:',
                    bulletPoints: [
                      'More than 7 days before rental: Full refund',
                      '3-7 days before rental: 50% refund',
                      'Less than 3 days before rental: No refund',
                      'Same day cancellation: No refund',
                    ],
                  ),
                  _buildSection(
                    title: '2. Refund Process',
                    content: 'When a refund is issued:',
                    bulletPoints: [
                      'Refunds are processed within 5-7 business days',
                      'Original payment method will be refunded',
                      'Service fees may be non-refundable',
                      'Processing fees are non-refundable',
                    ],
                  ),
                  _buildSection(
                    title: '3. Host Cancellations',
                    content: 'If a host cancels a confirmed rental:',
                    bulletPoints: [
                      'Renter receives a full refund',
                      'Host may be penalized',
                      'Repeated cancellations may result in account suspension',
                      'Host\'s rating may be affected',
                    ],
                  ),
                  _buildSection(
                    title: '4. Extenuating Circumstances',
                    content: 'Special considerations for cancellations due to:',
                    bulletPoints: [
                      'Natural disasters',
                      'Severe weather conditions',
                      'Government travel restrictions',
                      'Medical emergencies (with documentation)',
                    ],
                  ),
                  _buildSection(
                    title: '5. Modifications',
                    content: 'Changes to existing reservations:',
                    bulletPoints: [
                      'Date changes subject to availability',
                      'Price differences may apply',
                      'Modification fees may apply',
                      'Changes must be approved by both parties',
                    ],
                  ),
                  _buildSection(
                    title: '6. Disputes',
                    content: 'In case of disagreements:',
                    bulletPoints: [
                      'Contact customer support immediately',
                      'Provide relevant documentation',
                      'Both parties will be heard',
                      'Resolution within 5 business days',
                    ],
                  ),
                  _buildSection(
                    title: '7. Insurance Claims',
                    content: 'For equipment damage or issues:',
                    bulletPoints: [
                      'Document any damage immediately',
                      'Submit claims within 24 hours',
                      'Provide photos and description',
                      'Follow insurance provider guidelines',
                    ],
                  ),
                  _buildSection(
                    title: '8. Contact Information',
                    content: 'For cancellation assistance or questions, contact us at support@jackerbox.com or through our 24/7 support line at 1-800-JACKERBOX.',
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