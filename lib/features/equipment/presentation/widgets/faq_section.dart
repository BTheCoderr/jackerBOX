import 'package:flutter/material.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Frequently asked questions',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Find answers to common questions about renting equipment on Jackerbox',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),
          _buildFAQItem(
            context,
            'What do I need to rent equipment on Jackerbox?',
            'To rent equipment, you\'ll need to: \n'
            '• Be 18 years or older\n'
            '• Have a valid government-issued ID\n'
            '• Have a valid credit card\n'
            '• Complete our verification process',
          ),
          _buildFAQItem(
            context,
            'Do I need my own insurance?',
            'While not required, we recommend having your own insurance. We offer protection plans for all rentals that cover potential damages.',
          ),
          _buildFAQItem(
            context,
            'Can other people use the equipment I rent?',
            'Yes, but they must be listed as additional users during the booking process and meet our eligibility requirements.',
          ),
          _buildFAQItem(
            context,
            'How do I get discounts on equipment rentals?',
            'We offer various discounts including:\n'
            '• Weekly rental discounts\n'
            '• First-time renter promotions\n'
            '• Seasonal deals\n'
            '• Loyalty program rewards',
          ),
          _buildFAQItem(
            context,
            'What payment methods does Jackerbox accept?',
            'We accept all major credit cards, debit cards, and digital payment methods including Apple Pay and Google Pay.',
          ),
          _buildFAQItem(
            context,
            'What is the cancellation policy?',
            'Cancellation policies vary by host, but generally:\n'
            '• Free cancellation up to 24 hours before pickup\n'
            '• Partial refund for cancellations within 24 hours\n'
            '• No refund for no-shows',
          ),
          _buildFAQItem(
            context,
            'What are the cleaning and safety policies?',
            'All equipment must be thoroughly cleaned and sanitized between rentals. Hosts are required to follow our safety guidelines and maintain their equipment regularly.',
          ),
          _buildFAQItem(
            context,
            'Can I get the equipment delivered to me?',
            'Yes! Many hosts offer delivery services for an additional fee. Delivery options and fees vary by location and equipment type.',
          ),
          _buildFAQItem(
            context,
            'What happens if the equipment is damaged during my rental?',
            'If damage occurs during your rental period:\n'
            '• Document the damage immediately with photos\n'
            '• Report it through the Jackerbox app\n'
            '• Our protection plans cover most accidental damages\n'
            '• You may be responsible for damages not covered by protection plans',
          ),
          _buildFAQItem(
            context,
            'How do I extend my rental period?',
            'To extend your rental:\n'
            '• Request an extension through the app\n'
            '• The host must approve the extension\n'
            '• Additional charges will apply\n'
            '• Extensions must be requested before the original return time',
          ),
          _buildFAQItem(
            context,
            'What if the equipment isn\'t working properly?',
            'If you experience issues:\n'
            '• Contact the host immediately\n'
            '• Document the problem with photos/videos\n'
            '• Our support team is available 24/7\n'
            '• We\'ll help arrange a replacement or refund',
          ),
          _buildFAQItem(
            context,
            'Do you offer long-term rentals?',
            'Yes! Many hosts offer discounted rates for long-term rentals. Contact the host directly to discuss extended rental periods and special pricing.',
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(BuildContext context, String question, String answer) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        iconColor: Theme.of(context).colorScheme.primary,
        textColor: Theme.of(context).colorScheme.primary,
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: [
          Text(
            answer,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
} 