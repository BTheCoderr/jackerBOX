import 'package:flutter/material.dart';
import '../../domain/models/equipment.dart';

class EquipmentFilter extends StatefulWidget {
  final String? initialQuery;
  final EquipmentCategory? initialCategory;
  final double? initialMaxPrice;
  final double? initialMinRating;
  final String? initialCity;
  final Function({
    String? query,
    EquipmentCategory? category,
    double? maxPrice,
    double? minRating,
    String? city,
  }) onApply;

  const EquipmentFilter({
    super.key,
    this.initialQuery,
    this.initialCategory,
    this.initialMaxPrice,
    this.initialMinRating,
    this.initialCity,
    required this.onApply,
  });

  @override
  State<EquipmentFilter> createState() => _EquipmentFilterState();
}

class _EquipmentFilterState extends State<EquipmentFilter> {
  late final TextEditingController _queryController;
  late final TextEditingController _cityController;
  late EquipmentCategory? _selectedCategory;
  late double? _maxPrice;
  late double? _minRating;

  @override
  void initState() {
    super.initState();
    _queryController = TextEditingController(text: widget.initialQuery);
    _cityController = TextEditingController(text: widget.initialCity);
    _selectedCategory = widget.initialCategory;
    _maxPrice = widget.initialMaxPrice;
    _minRating = widget.initialMinRating;
  }

  @override
  void dispose() {
    _queryController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              // Title
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Filter Equipment',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _queryController.clear();
                          _cityController.clear();
                          _selectedCategory = null;
                          _maxPrice = null;
                          _minRating = null;
                        });
                      },
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              ),

              // Filter Form
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Search Query
                    TextField(
                      controller: _queryController,
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        hintText: 'Enter keywords',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Category
                    DropdownButtonFormField<EquipmentCategory>(
                      value: _selectedCategory,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(),
                      ),
                      items: EquipmentCategory.values.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category.displayName),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Max Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Maximum Price per Day: \$${_maxPrice?.toStringAsFixed(2) ?? 'Any'}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Slider(
                          value: _maxPrice ?? 1000,
                          min: 0,
                          max: 1000,
                          divisions: 100,
                          label: '\$${_maxPrice?.toStringAsFixed(2) ?? 'Any'}',
                          onChanged: (value) {
                            setState(() {
                              _maxPrice = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Min Rating
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Minimum Rating: ${_minRating?.toStringAsFixed(1) ?? 'Any'}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Slider(
                          value: _minRating ?? 0,
                          min: 0,
                          max: 5,
                          divisions: 10,
                          label: _minRating?.toStringAsFixed(1) ?? 'Any',
                          onChanged: (value) {
                            setState(() {
                              _minRating = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // City
                    TextField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        labelText: 'City',
                        hintText: 'Enter city name',
                        prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Apply Button
                    ElevatedButton(
                      onPressed: () {
                        widget.onApply(
                          query: _queryController.text.isNotEmpty ? _queryController.text : null,
                          category: _selectedCategory,
                          maxPrice: _maxPrice,
                          minRating: _minRating,
                          city: _cityController.text.isNotEmpty ? _cityController.text : null,
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Apply Filters'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} 