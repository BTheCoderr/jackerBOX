import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../domain/models/equipment.dart';
import '../../providers/equipment_provider.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../../booking/presentation/widgets/booking_form.dart';
import 'package:go_router/go_router.dart';

class EquipmentDetailsScreen extends StatefulWidget {
  final String equipmentId;

  const EquipmentDetailsScreen({
    super.key,
    required this.equipmentId,
  });

  @override
  State<EquipmentDetailsScreen> createState() => _EquipmentDetailsScreenState();
}

class _EquipmentDetailsScreenState extends State<EquipmentDetailsScreen> {
  int _currentImageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _loadEquipment();
  }

  Future<void> _loadEquipment() async {
    await context.read<EquipmentProvider>().getEquipment(widget.equipmentId);
  }

  void _showImageGallery(BuildContext context, List<String> images, int initialIndex) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.zero,
        child: Stack(
          children: [
            PhotoViewGallery.builder(
              pageController: PageController(initialPage: initialIndex),
              itemCount: images.length,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: CachedNetworkImageProvider(images[index]),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2,
                );
              },
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBookingForm(BuildContext context, Equipment equipment) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BookingForm(equipment: equipment),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EquipmentProvider>(
      builder: (context, provider, child) {
        final equipment = provider.selectedEquipment;
        final isLoading = provider.isLoading;
        final error = provider.error;

        if (isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (error != null) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $error'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadEquipment,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (equipment == null) {
          return const Scaffold(
            body: Center(child: Text('Equipment not found')),
          );
        }

        final authProvider = context.watch<AuthProvider>();
        final isOwner = authProvider.currentUser?.uid == equipment.ownerId;

        return Scaffold(
          appBar: AppBar(
            title: Text(equipment.name),
            actions: [
              if (isOwner)
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    context.go('/equipment/${equipment.id}/edit');
                  },
                ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Gallery
                if (equipment.images.isNotEmpty)
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() => _currentImageIndex = index);
                          },
                          itemCount: equipment.images.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => _showImageGallery(
                                context,
                                equipment.images,
                                index,
                              ),
                              child: Hero(
                                tag: 'equipment_${equipment.id}_$index',
                                child: CachedNetworkImage(
                                  imageUrl: equipment.images[index],
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: Colors.grey[200],
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Container(
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        // Image indicators
                        if (equipment.images.length > 1)
                          Positioned(
                            bottom: 8,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: equipment.images.asMap().entries.map((entry) {
                                return Container(
                                  width: 8,
                                  height: 8,
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentImageIndex == entry.key
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                      ],
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Price and Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${equipment.dailyRate}/day',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          if (equipment.reviewCount > 0)
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber),
                                Text(
                                  '${equipment.rating.toStringAsFixed(1)} (${equipment.reviewCount})',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Category
                      Row(
                        children: [
                          const Icon(Icons.category, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            equipment.category.displayName,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Location
                      if (equipment.location.address != null) ...[
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(width: 8),
                            Text(equipment.location.address!),
                          ],
                        ),
                      ],

                      // Description
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(equipment.description),
                      const SizedBox(height: 16),

                      // Features
                      if (equipment.features.isNotEmpty) ...[
                        Text(
                          'Features',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: equipment.features.map((feature) {
                            return Chip(label: Text(feature));
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Requirements
                      if (equipment.requirements.isNotEmpty) ...[
                        Text(
                          'Requirements',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: equipment.requirements.map((requirement) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_circle, size: 16),
                                  const SizedBox(width: 8),
                                  Expanded(child: Text(requirement)),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: !isOwner
              ? SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () => _showBookingForm(context, equipment),
                      child: const Text('Book Now'),
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
} 