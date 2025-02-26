import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/models/booking.dart';
import '../../providers/booking_provider.dart';
import '../../../equipment/domain/models/equipment.dart';
import '../../../equipment/providers/equipment_provider.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;
  final bool isOwner;

  const BookingCard({
    super.key,
    required this.booking,
    required this.isOwner,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: context.read<EquipmentProvider>().getEquipment(booking.equipmentId),
      builder: (context, snapshot) {
        final equipment = context.select<EquipmentProvider, Equipment?>(
          (provider) => provider.selectedEquipment,
        );

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Card(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (equipment == null) {
          return const Card(
            child: Center(child: Text('Equipment not found')),
          );
        }

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Equipment Image and Details
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Equipment Image
                    if (equipment.images.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          equipment.images.first,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    const SizedBox(width: 16),
                    
                    // Equipment Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            equipment.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            equipment.category.displayName,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${booking.totalPrice.toStringAsFixed(2)} total',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Booking Status
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(booking.status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        booking.status.displayName,
                        style: TextStyle(
                          color: _getStatusColor(booking.status),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Booking Dates
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      '${_formatDate(booking.startDate)} - ${_formatDate(booking.endDate)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Action Buttons
                if (booking.status == BookingStatus.pending && isOwner)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => _showReasonDialog(
                          context,
                          'Decline Booking',
                          'Please provide a reason for declining:',
                          (reason) {
                            context.read<BookingProvider>().updateBookingStatus(
                              booking.id,
                              BookingStatus.rejected,
                              reason: reason,
                            );
                          },
                        ),
                        child: const Text('Decline'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          context.read<BookingProvider>().updateBookingStatus(
                            booking.id,
                            BookingStatus.approved,
                          );
                        },
                        child: const Text('Accept'),
                      ),
                    ],
                  ),

                if (booking.status == BookingStatus.pending && !isOwner)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => _showReasonDialog(
                          context,
                          'Cancel Booking',
                          'Please provide a reason for cancelling:',
                          (reason) {
                            context.read<BookingProvider>().updateBookingStatus(
                              booking.id,
                              BookingStatus.cancelled,
                              reason: reason,
                            );
                          },
                        ),
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),

                // Show reason if booking was rejected or cancelled
                if (booking.status == BookingStatus.rejected && booking.declineReason != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Declined: ${booking.declineReason}',
                      style: TextStyle(color: Colors.red[700]),
                    ),
                  ),

                if (booking.status == BookingStatus.cancelled && booking.cancellationReason != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Cancelled: ${booking.cancellationReason}',
                      style: TextStyle(color: Colors.orange[700]),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
        return Colors.orange;
      case BookingStatus.approved:
        return Colors.green;
      case BookingStatus.rejected:
        return Colors.red;
      case BookingStatus.cancelled:
        return Colors.grey;
      case BookingStatus.completed:
        return Colors.blue;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _showReasonDialog(
    BuildContext context,
    String title,
    String message,
    Function(String) onSubmit,
  ) async {
    final controller = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Enter reason',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a reason')),
                );
                return;
              }
              Navigator.pop(context);
              onSubmit(controller.text);
            },
            child: const Text('SUBMIT'),
          ),
        ],
      ),
    );
  }
} 