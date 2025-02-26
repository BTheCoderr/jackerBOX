import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/models/equipment.dart';
import '../../providers/equipment_provider.dart';
import '../widgets/equipment_card.dart';
import '../widgets/equipment_filter.dart';
import '../widgets/airport_pickup_section.dart';
import '../widgets/destination_section.dart';
import '../widgets/gift_cards_section.dart';
import '../widgets/hosts_section.dart';
import '../widgets/faq_section.dart';
import '../../../shared/widgets/app_drawer.dart';
import 'package:go_router/go_router.dart';

class EquipmentListScreen extends StatefulWidget {
  const EquipmentListScreen({super.key});

  @override
  State<EquipmentListScreen> createState() => _EquipmentListScreenState();
}

class _EquipmentListScreenState extends State<EquipmentListScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadInitialData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _loadInitialData() {
    Future.microtask(() {
      context.read<EquipmentProvider>().createSampleEquipment();
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      final provider = context.read<EquipmentProvider>();
      if (!provider.isLoading && provider.hasMore) {
        provider.loadEquipment();
      }
    }
  }

  Future<void> _selectStartDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() => _startDate = date);
      _selectStartTime();
    }
  }

  Future<void> _selectEndDate() async {
    if (_startDate == null) return;
    final date = await showDatePicker(
      context: context,
      initialDate: _startDate!.add(const Duration(days: 1)),
      firstDate: _startDate!,
      lastDate: _startDate!.add(const Duration(days: 30)),
    );
    if (date != null) {
      setState(() => _endDate = date);
      _selectEndTime();
    }
  }

  Future<void> _selectStartTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() => _startTime = time);
    }
  }

  Future<void> _selectEndTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() => _endTime = time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // App Bar with Search
          SliverAppBar(
            expandedHeight: 400,
            floating: true,
            pinned: true,
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const AuthBottomSheet(),
                  );
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Find the perfect equipment for your next project',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _searchController,
                                  decoration: const InputDecoration(
                                    hintText: 'City, airport, address or hotel',
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        readOnly: true,
                                        onTap: _selectStartDate,
                                        decoration: InputDecoration(
                                          hintText: _startDate == null
                                              ? 'Start Date'
                                              : '${_startDate!.month}/${_startDate!.day}/${_startDate!.year}',
                                          prefixIcon: const Icon(Icons.calendar_today),
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextFormField(
                                        readOnly: true,
                                        onTap: _selectEndDate,
                                        decoration: InputDecoration(
                                          hintText: _endDate == null
                                              ? 'End Date'
                                              : '${_endDate!.month}/${_endDate!.day}/${_endDate!.year}',
                                          prefixIcon: const Icon(Icons.calendar_today),
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Implement search
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context).primaryColor,
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                    ),
                                    child: const Text(
                                      'Search for Equipment',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Categories Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Browse by Category',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: EquipmentCategory.values.map((category) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 36,
                                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                child: Icon(
                                  _getCategoryIcon(category),
                                  color: Theme.of(context).primaryColor,
                                  size: 36,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(category.displayName),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // After Categories Section
          // Promotional Banner
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Special Valentine\'s Day Offer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Get 20% off on all equipment rentals',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement promo action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Theme.of(context).primaryColor,
                    ),
                    child: const Text('Learn More'),
                  ),
                ],
              ),
            ),
          ),

          // Airport Pickup Section
          const SliverToBoxAdapter(
            child: AirportPickupSection(),
          ),

          // After Airport Pickup Section
          // Destination Section
          const SliverToBoxAdapter(
            child: DestinationSection(),
          ),

          // Featured Equipment Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Featured Equipment',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Equipment Grid
          Consumer<EquipmentProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading && provider.equipment.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              return SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final equipment = provider.equipment[index];
                      return EquipmentCard(
                        equipment: equipment,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/equipment/${equipment.id}',
                          );
                        },
                      );
                    },
                    childCount: provider.equipment.length,
                  ),
                ),
              );
            },
          ),

          // Gift Cards Section
          const SliverToBoxAdapter(
            child: GiftCardsSection(),
          ),

          // Meet the Hosts Section
          const SliverToBoxAdapter(
            child: HostsSection(),
          ),

          // FAQ Section
          const SliverToBoxAdapter(
            child: FAQSection(),
          ),

          // Bottom Padding
          const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/equipment/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  IconData _getCategoryIcon(EquipmentCategory category) {
    switch (category) {
      case EquipmentCategory.photography:
        return Icons.camera_alt;
      case EquipmentCategory.videography:
        return Icons.videocam;
      case EquipmentCategory.audio:
        return Icons.mic;
      case EquipmentCategory.lighting:
        return Icons.light;
      case EquipmentCategory.drones:
        return Icons.flight;
      case EquipmentCategory.tools:
        return Icons.build;
      case EquipmentCategory.other:
        return Icons.devices_other;
    }
  }
}

class AuthBottomSheet extends StatelessWidget {
  const AuthBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome to Jackerbox',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            icon: const Icon(Icons.apple),
            label: const Text('Continue with Apple'),
            onPressed: () {
              // Implement Apple sign in
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.g_mobiledata),
            label: const Text('Continue with Google'),
            onPressed: () {
              // Implement Google sign in
            },
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.email),
            label: const Text('Continue with email'),
            onPressed: () {
              context.go('/auth/signup');
            },
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  context.go('/auth/login');
                },
                child: const Text('Log in'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'By logging in, you agree to Jackerbox Inc.\'s terms of service and privacy policy',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
} 