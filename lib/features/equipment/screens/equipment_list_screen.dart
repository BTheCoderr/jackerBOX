import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/equipment_provider.dart';
import '../widgets/equipment_card.dart';

class EquipmentListScreen extends StatefulWidget {
  const EquipmentListScreen({super.key});

  @override
  State<EquipmentListScreen> createState() => _EquipmentListScreenState();
}

class _EquipmentListScreenState extends State<EquipmentListScreen> {
  final _scrollController = ScrollController();
  String? _searchQuery;
  String? _selectedCategory;
  double? _maxPrice;
  double? _minRating;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadInitialData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadInitialData() {
    Future.microtask(() {
      context.read<EquipmentProvider>().loadEquipment(
        query: _searchQuery,
        category: _selectedCategory,
        maxPrice: _maxPrice,
        minRating: _minRating,
      );
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final provider = context.read<EquipmentProvider>();
      if (!provider.isLoading && provider.hasMore) {
        provider.loadEquipment(
          query: _searchQuery,
          category: _selectedCategory,
          maxPrice: _maxPrice,
          minRating: _minRating,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipment'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: EquipmentSearchDelegate(
                  onSearch: (query) {
                    setState(() {
                      _searchQuery = query;
                    });
                    context.read<EquipmentProvider>().loadEquipment(
                      query: query,
                      category: _selectedCategory,
                      maxPrice: _maxPrice,
                      minRating: _minRating,
                      refresh: true,
                    );
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => FilterBottomSheet(
                  selectedCategory: _selectedCategory,
                  maxPrice: _maxPrice,
                  minRating: _minRating,
                  onApply: (category, maxPrice, minRating) {
                    setState(() {
                      _selectedCategory = category;
                      _maxPrice = maxPrice;
                      _minRating = minRating;
                    });
                    context.read<EquipmentProvider>().loadEquipment(
                      query: _searchQuery,
                      category: category,
                      maxPrice: maxPrice,
                      minRating: minRating,
                      refresh: true,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<EquipmentProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.equipment.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null && provider.equipment.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(provider.error!),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadInitialData,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (provider.equipment.isEmpty) {
            return const Center(
              child: Text('No equipment found'),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await provider.loadEquipment(
                query: _searchQuery,
                category: _selectedCategory,
                maxPrice: _maxPrice,
                minRating: _minRating,
                refresh: true,
              );
            },
            child: GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: provider.equipment.length + (provider.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= provider.equipment.length) {
                  return const Center(child: CircularProgressIndicator());
                }

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
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/equipment/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class EquipmentSearchDelegate extends SearchDelegate {
  final Function(String) onSearch;

  EquipmentSearchDelegate({required this.onSearch});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    onSearch(query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

class FilterBottomSheet extends StatefulWidget {
  final String? selectedCategory;
  final double? maxPrice;
  final double? minRating;
  final Function(String?, double?, double?) onApply;

  const FilterBottomSheet({
    super.key,
    this.selectedCategory,
    this.maxPrice,
    this.minRating,
    required this.onApply,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late String? _category;
  late double? _maxPrice;
  late double? _minRating;

  @override
  void initState() {
    super.initState();
    _category = widget.selectedCategory;
    _maxPrice = widget.maxPrice;
    _minRating = widget.minRating;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Filters',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _category,
            decoration: const InputDecoration(
              labelText: 'Category',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(value: null, child: Text('All')),
              DropdownMenuItem(value: 'photography', child: Text('Photography')),
              DropdownMenuItem(value: 'videography', child: Text('Videography')),
              DropdownMenuItem(value: 'audio', child: Text('Audio')),
              DropdownMenuItem(value: 'lighting', child: Text('Lighting')),
            ],
            onChanged: (value) {
              setState(() {
                _category = value;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: _maxPrice?.toString(),
            decoration: const InputDecoration(
              labelText: 'Maximum Price',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _maxPrice = double.tryParse(value);
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: _minRating?.toString(),
            decoration: const InputDecoration(
              labelText: 'Minimum Rating',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _minRating = double.tryParse(value);
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.onApply(_category, _maxPrice, _minRating);
              Navigator.pop(context);
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
} 