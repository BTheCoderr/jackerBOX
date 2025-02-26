import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../domain/models/equipment.dart';
import '../../providers/equipment_provider.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../../../core/sample_data.dart';

class EquipmentFormScreen extends StatefulWidget {
  final String? equipmentId;

  const EquipmentFormScreen({
    super.key,
    this.equipmentId,
  });

  @override
  State<EquipmentFormScreen> createState() => _EquipmentFormScreenState();
}

class _EquipmentFormScreenState extends State<EquipmentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dailyRateController = TextEditingController();
  final _locationController = TextEditingController();
  final _categoryController = TextEditingController();

  List<String> _images = [];
  List<String> _features = [];
  List<String> _requirements = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.equipmentId != null) {
      _loadEquipment();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dailyRateController.dispose();
    _locationController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  Future<void> _loadEquipment() async {
    setState(() => _isLoading = true);

    try {
      await context.read<EquipmentProvider>().getEquipment(widget.equipmentId!);
      final equipment = context.read<EquipmentProvider>().selectedEquipment;

      if (equipment != null) {
        _titleController.text = equipment.name;
        _descriptionController.text = equipment.description;
        _dailyRateController.text = equipment.dailyRate.toString();
        if (equipment.location.address != null) {
          _locationController.text = equipment.location.address!;
        }
        _categoryController.text = equipment.category.displayName;
        _features.addAll(equipment.features);
        _requirements.addAll(equipment.requirements);
        
        setState(() {
          _images = List.from(equipment.images);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading equipment: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() => _isLoading = true);

      try {
        final imageUrl = 'https://example.com/image.jpg'; // TODO: Implement image upload
        setState(() {
          _images.add(imageUrl);
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading image: $e')),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  Future<void> _saveEquipment() async {
    if (!_formKey.currentState!.validate()) return;

    if (_images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one image')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final currentUser = context.read<AuthProvider>().currentUser;
      if (currentUser == null) throw Exception('User not authenticated');

      final equipment = Equipment(
        id: widget.equipmentId ?? 'equipment_${DateTime.now().millisecondsSinceEpoch}',
        ownerId: SampleData.sampleUserId,
        ownerName: SampleData.sampleUserName,
        name: _titleController.text,
        description: _descriptionController.text,
        dailyRate: double.parse(_dailyRateController.text),
        category: EquipmentCategory.values.firstWhere(
          (e) => e.displayName == _categoryController.text,
          orElse: () => EquipmentCategory.other,
        ),
        location: Location(
          address: _locationController.text,
          city: 'San Francisco',
          state: 'CA',
          country: 'USA',
        ),
        coordinates: {'lat': 37.7749, 'lng': -122.4194},
        images: _images,
        features: _features,
        requirements: _requirements,
        rating: 0.0,
        reviewCount: 0,
        createdAt: DateTime.now(),
      );

      if (widget.equipmentId != null) {
        await context.read<EquipmentProvider>().updateEquipment(equipment);
      } else {
        await context.read<EquipmentProvider>().createEquipment(equipment);
      }

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving equipment: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.equipmentId == null ? 'Add Equipment' : 'Edit Equipment'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Images
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _images.length + 1,
                        itemBuilder: (context, index) {
                          if (index == _images.length) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Material(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                  child: InkWell(
                                    onTap: _pickImage,
                                    borderRadius: BorderRadius.circular(8),
                                    child: const Icon(Icons.add_photo_alternate),
                                  ),
                                ),
                              ),
                            );
                          }

                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      _images[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 4,
                                    right: 4,
                                    child: Material(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(16),
                                      child: IconButton(
                                        icon: const Icon(Icons.close),
                                        color: Colors.white,
                                        onPressed: () => _removeImage(index),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Title
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Description
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Daily Rate
                    TextFormField(
                      controller: _dailyRateController,
                      decoration: const InputDecoration(
                        labelText: 'Daily Rate',
                        prefixText: '\$',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter a daily rate';
                        }
                        if (double.tryParse(value!) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Category
                    TextFormField(
                      controller: _categoryController,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter a category';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Location
                    TextFormField(
                      controller: _locationController,
                      decoration: const InputDecoration(
                        labelText: 'Location',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter a location';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Save Button
                    ElevatedButton(
                      onPressed: _saveEquipment,
                      child: Text(
                        widget.equipmentId == null ? 'Add Equipment' : 'Save Changes',
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
} 