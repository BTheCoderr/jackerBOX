import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HostOnboardingScreen extends StatefulWidget {
  const HostOnboardingScreen({super.key});

  @override
  State<HostOnboardingScreen> createState() => _HostOnboardingScreenState();
}

class _HostOnboardingScreenState extends State<HostOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingSteps = [
    {
      'title': 'Welcome to Hosting',
      'description': 'Let\'s get your equipment rental business started. We\'ll guide you through the process step by step.',
      'icon': Icons.waving_hand,
    },
    {
      'title': 'List Your Equipment',
      'description': 'Add photos, descriptions, and specifications of your equipment. The more detail, the better!',
      'icon': Icons.add_a_photo,
    },
    {
      'title': 'Set Your Terms',
      'description': 'Define your rental rates, availability, and requirements. You\'re in control of your business.',
      'icon': Icons.description,
    },
    {
      'title': 'Verify Your Identity',
      'description': 'Help us maintain a safe community by verifying your identity and contact information.',
      'icon': Icons.verified_user,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _onboardingSteps.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to equipment listing form
      context.go('/equipment/add');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show confirmation dialog before allowing back navigation
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit Setup?'),
            content: const Text('Are you sure you want to exit the host setup process? Your progress will be saved.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Exit'),
              ),
            ],
          ),
        );
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.go('/'),
          ),
          title: const Text('Get Started'),
        ),
        body: Column(
          children: [
            // Progress indicator
            LinearProgressIndicator(
              value: (_currentPage + 1) / _onboardingSteps.length,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
            
            // Page content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (page) => setState(() => _currentPage = page),
                physics: const ClampingScrollPhysics(),
                itemCount: _onboardingSteps.length,
                itemBuilder: (context, index) {
                  final step = _onboardingSteps[index];
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          step['icon'] as IconData,
                          size: 80,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          step['title'] as String,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          step['description'] as String,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Navigation buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip button (only show if not on last page)
                  if (_currentPage < _onboardingSteps.length - 1)
                    TextButton(
                      onPressed: () => context.go('/equipment/add'),
                      child: const Text('Skip'),
                    )
                  else
                    const SizedBox(width: 80), // Placeholder for spacing
                  
                  // Page indicators
                  Row(
                    children: List.generate(
                      _onboardingSteps.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == _currentPage
                              ? Theme.of(context).primaryColor
                              : Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                  
                  // Next/Finish button
                  ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      _currentPage == _onboardingSteps.length - 1
                          ? 'Get Started'
                          : 'Next',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 