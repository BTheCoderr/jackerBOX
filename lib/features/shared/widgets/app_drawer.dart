import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final isAuthenticated = authProvider.isAuthenticated;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Text(
              'Jackerbox',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Authentication Section
          if (!isAuthenticated) ...[
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Log in'),
              onTap: () {
                Navigator.pop(context);
                context.go('/auth/login');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Sign up'),
              onTap: () {
                Navigator.pop(context);
                context.go('/auth/signup');
              },
            ),
          ],

          // Host Section
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Become a host'),
            onTap: () {
              Navigator.pop(context);
              context.go('/become-host');
            },
          ),

          const Divider(),

          // Explore Section
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('How Jackerbox works'),
            onTap: () {
              Navigator.pop(context);
              context.go('/how-it-works');
            },
          ),

          ListTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text('Gift cards'),
            onTap: () {
              Navigator.pop(context);
              context.go('/gift-cards');
            },
          ),

          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text('Contact support'),
            onTap: () {
              Navigator.pop(context);
              context.go('/support');
            },
          ),

          const Divider(),

          // Legal Section
          const ListTile(
            title: Text(
              'Legal',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.gavel),
            title: const Text('Terms of Service'),
            onTap: () {
              Navigator.pop(context);
              context.go('/legal/terms');
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () {
              Navigator.pop(context);
              context.go('/legal/privacy');
            },
          ),
          ListTile(
            leading: const Icon(Icons.event_busy),
            title: const Text('Cancellation Policy'),
            onTap: () {
              Navigator.pop(context);
              context.go('/legal/cancellation');
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Insurance & Protection'),
            onTap: () {
              Navigator.pop(context);
              context.go('/legal/insurance');
            },
          ),

          // Host Tools Section (visible only to hosts)
          if (isAuthenticated) ...[
            const Divider(),
            const ListTile(
              title: Text(
                'Host tools',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_business),
              title: const Text('List your equipment'),
              onTap: () {
                Navigator.pop(context);
                context.go('/equipment/add');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Calculator'),
              onTap: () {
                Navigator.pop(context);
                context.go('/calculator');
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('All-Star Hosts'),
              onTap: () {
                Navigator.pop(context);
                context.go('/all-star-hosts');
              },
            ),
            ListTile(
              leading: const Icon(Icons.build),
              title: const Text('Host tools'),
              onTap: () {
                Navigator.pop(context);
                context.go('/host-tools');
              },
            ),
          ],

          const Divider(),

          // Footer Links
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook),
                  onPressed: () {
                    // Open Facebook
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.telegram),
                  onPressed: () {
                    // Open Twitter
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.photo_camera),
                  onPressed: () {
                    // Open Instagram
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.play_circle),
                  onPressed: () {
                    // Open YouTube
                  },
                ),
              ],
            ),
          ),

          // Language Selection
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('English'),
            trailing: const Icon(Icons.arrow_drop_down),
            onTap: () {
              // Show language selection
            },
          ),

          // Copyright
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              '©2024 Jackerbox',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
} 