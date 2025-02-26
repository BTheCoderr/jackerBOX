import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';

class GiftCardsScreen extends StatelessWidget {
  const GiftCardsScreen({super.key});

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
        title: const Text('Gift Cards'),
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
                    Icons.card_giftcard,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Jackerbox Gift Cards',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'The perfect gift for equipment enthusiasts',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Gift Card Options
            Text(
              'Choose Your Gift Card',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildGiftCardOption(
              context,
              amount: 50,
              description: 'Perfect for a day rental',
            ),
            const SizedBox(height: 16),
            _buildGiftCardOption(
              context,
              amount: 100,
              description: 'Ideal for a weekend adventure',
            ),
            const SizedBox(height: 16),
            _buildGiftCardOption(
              context,
              amount: 200,
              description: 'Great for multiple rentals',
            ),
            const SizedBox(height: 16),
            _buildGiftCardOption(
              context,
              amount: 500,
              description: 'The ultimate gift package',
            ),

            const SizedBox(height: 32),
            // Custom Amount
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Custom Amount',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Enter amount',
                        prefixText: '\$',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Implement custom amount purchase
                      },
                      child: const Text('Continue'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),
            // How it Works
            Text(
              'How It Works',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildHowItWorksStep(
              context,
              icon: Icons.shopping_cart,
              title: '1. Choose Amount',
              description: 'Select a preset amount or enter your own',
            ),
            _buildHowItWorksStep(
              context,
              icon: Icons.email,
              title: '2. Personalize',
              description: 'Add a personal message and recipient details',
            ),
            _buildHowItWorksStep(
              context,
              icon: Icons.send,
              title: '3. Send',
              description: 'Choose to send now or schedule for later',
            ),
            _buildHowItWorksStep(
              context,
              icon: Icons.redeem,
              title: '4. Redeem',
              description: 'Recipient can easily redeem on any rental',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGiftCardOption(
    BuildContext context, {
    required int amount,
    required String description,
  }) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          '\$$amount Gift Card',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(description),
        trailing: ElevatedButton(
          onPressed: () {
            // Implement gift card purchase
          },
          child: const Text('Buy Now'),
        ),
      ),
    );
  }

  Widget _buildHowItWorksStep(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
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
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 