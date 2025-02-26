import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HostsSection extends StatelessWidget {
  const HostsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Meet the hosts',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Top hosts on Jackerbox',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildHostCard(
                  context,
                  name: 'Sarah Johnson',
                  rating: 4.9,
                  trips: 234,
                  joinDate: 'Joined Mar 2023',
                  imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
                  review: 'Amazing equipment and professional service!',
                  reviewer: 'Michael R.',
                ),
                _buildHostCard(
                  context,
                  name: 'David Chen',
                  rating: 5.0,
                  trips: 567,
                  joinDate: 'Joined Jan 2023',
                  imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
                  review: 'Best equipment rental experience ever!',
                  reviewer: 'Emily S.',
                ),
                _buildHostCard(
                  context,
                  name: 'Maria Garcia',
                  rating: 4.8,
                  trips: 189,
                  joinDate: 'Joined Jun 2023',
                  imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
                  review: 'Professional and reliable host.',
                  reviewer: 'James T.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () {
              // Implement become a host action
            },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text('Become a host >'),
          ),
          const SizedBox(height: 8),
          Text(
            'Accelerate your entrepreneurship and start building a small equipment sharing business on Jackerbox.',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildHostCard(
    BuildContext context, {
    required String name,
    required double rating,
    required int trips,
    required String joinDate,
    required String imageUrl,
    required String review,
    required String reviewer,
  }) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: CachedNetworkImageProvider(imageUrl),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.amber[700]),
                            const SizedBox(width: 4),
                            Text(rating.toString()),
                            const SizedBox(width: 8),
                            Text('$trips trips'),
                          ],
                        ),
                        Text(
                          joinDate,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 32),
              Text(
                review,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '- $reviewer',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 