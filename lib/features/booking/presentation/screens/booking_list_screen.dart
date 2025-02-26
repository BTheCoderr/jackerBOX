import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/booking_provider.dart';
import '../../../auth/providers/auth_provider.dart';
import '../widgets/booking_card.dart';
import 'package:go_router/go_router.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({super.key});

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadBookings();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadBookings() async {
    final userId = context.read<AuthProvider>().currentUser?.uid;
    if (userId == null) return;

    final bookingProvider = context.read<BookingProvider>();
    await Future.wait([
      bookingProvider.loadBookingsForRenter(userId),
      bookingProvider.loadBookingsForOwner(userId),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Rentals'),
            Tab(text: 'Listings'),
          ],
        ),
      ),
      body: Consumer2<BookingProvider, AuthProvider>(
        builder: (context, bookingProvider, authProvider, child) {
          if (!authProvider.isAuthenticated) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Please sign in to view your bookings'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/auth');
                    },
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            );
          }

          if (bookingProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (bookingProvider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${bookingProvider.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadBookings,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return TabBarView(
            controller: _tabController,
            children: [
              // Rentals Tab
              RefreshIndicator(
                onRefresh: () async {
                  await bookingProvider.loadBookingsForRenter(
                    authProvider.currentUser!.uid,
                  );
                },
                child: bookingProvider.bookings.isEmpty
                    ? const Center(
                        child: Text('No rentals found'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: bookingProvider.bookings.length,
                        itemBuilder: (context, index) {
                          final booking = bookingProvider.bookings[index];
                          return BookingCard(
                            booking: booking,
                            isOwner: false,
                          );
                        },
                      ),
              ),

              // Listings Tab
              RefreshIndicator(
                onRefresh: () async {
                  await bookingProvider.loadBookingsForOwner(
                    authProvider.currentUser!.uid,
                  );
                },
                child: bookingProvider.bookings.isEmpty
                    ? const Center(
                        child: Text('No booking requests found'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: bookingProvider.bookings.length,
                        itemBuilder: (context, index) {
                          final booking = bookingProvider.bookings[index];
                          return BookingCard(
                            booking: booking,
                            isOwner: true,
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
} 