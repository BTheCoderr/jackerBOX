import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

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
        title: const Text('Legal'),
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
                    'Legal Information',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Review our policies and legal documents',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            // Legal Documents List
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLegalSection(
                    context,
                    title: 'Terms of Service',
                    icon: Icons.description,
                    description: 'Review our terms of service and user agreement',
                    onTap: () => context.go('/legal/terms'),
                  ),
                  _buildLegalSection(
                    context,
                    title: 'Privacy Policy',
                    icon: Icons.privacy_tip,
                    description: 'Learn how we collect and use your data',
                    onTap: () => context.go('/legal/privacy'),
                  ),
                  _buildLegalSection(
                    context,
                    title: 'Cancellation Policy',
                    icon: Icons.event_busy,
                    description: 'Understand our booking cancellation rules',
                    onTap: () => context.go('/legal/cancellation'),
                  ),
                  _buildLegalSection(
                    context,
                    title: 'Insurance Policy',
                    icon: Icons.security,
                    description: 'Details about equipment protection and insurance',
                    onTap: () => context.go('/legal/insurance'),
                  ),
                  _buildLegalSection(
                    context,
                    title: 'Host Agreement',
                    icon: Icons.business,
                    description: 'Terms for equipment hosts on Jackerbox',
                    onTap: () => context.go('/legal/host-agreement'),
                  ),
                  _buildLegalSection(
                    context,
                    title: 'Community Guidelines',
                    icon: Icons.people,
                    description: 'Our community standards and expectations',
                    onTap: () => context.go('/legal/guidelines'),
                  ),
                  _buildLegalSection(
                    context,
                    title: 'Copyright Policy',
                    icon: Icons.copyright,
                    description: 'Our intellectual property guidelines',
                    onTap: () => context.go('/legal/copyright'),
                  ),
                  _buildLegalSection(
                    context,
                    title: 'Cookie Policy',
                    icon: Icons.cookie,
                    description: 'How we use cookies and similar technologies',
                    onTap: () => context.go('/legal/cookies'),
                  ),
                ],
              ),
            ),

            // Contact Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Need help understanding our policies?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      context.go('/support');
                    },
                    child: const Text('Contact our legal team'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegalSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
} 