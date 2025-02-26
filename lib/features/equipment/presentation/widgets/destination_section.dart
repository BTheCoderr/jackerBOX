import 'package:flutter/material.dart';

class DestinationSection extends StatelessWidget {
  const DestinationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse by destination',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Find equipment in popular cities',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildDestinationCard(
                  context,
                  'Los Angeles',
                  Icons.beach_access,
                  'assets/images/destinations/los_angeles.jpg',
                ),
                _buildDestinationCard(
                  context,
                  'New York',
                  Icons.apartment,
                  'assets/images/destinations/new_york.jpg',
                ),
                _buildDestinationCard(
                  context,
                  'Miami',
                  Icons.sunny,
                  'assets/images/destinations/miami.jpg',
                ),
                _buildDestinationCard(
                  context,
                  'San Francisco',
                  Icons.landscape,
                  'assets/images/destinations/san_francisco.jpg',
                ),
                _buildDestinationCard(
                  context,
                  'Chicago',
                  Icons.park,
                  'assets/images/destinations/chicago.jpg',
                ),
                _buildDestinationCard(
                  context,
                  'Las Vegas',
                  Icons.casino,
                  'assets/images/destinations/las_vegas.jpg',
                ),
                _buildDestinationCard(
                  context,
                  'Seattle',
                  Icons.coffee,
                  'assets/images/destinations/seattle.jpg',
                ),
                _buildDestinationCard(
                  context,
                  'Austin',
                  Icons.music_note,
                  'assets/images/destinations/austin.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(BuildContext context, String city, IconData icon, String imagePath) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            // Implement destination selection
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Text(
                    city,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 