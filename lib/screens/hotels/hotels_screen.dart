// lib/screens/hotels/hotels_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  final CardSwiperController controller = CardSwiperController();

  // Sample hotel data
  final List<Map<String, dynamic>> hotels = [
    {
      'name': 'Luxury Palace Hotel',
      'price': 499,
      'rating': 4.8,
      'location': 'Dubai, UAE',
      'description': 'Experience ultimate luxury with panoramic city views',
      'amenities': ['Spa', 'Pool', 'Fine Dining', '24/7 Service'],
      'image': 'https://www.tourmyindia.com/blog//wp-content/uploads/2022/10/Best-Five-Star-Luxury-Hotels-in-Delhi.jpg',
    },
    {
      'name': 'Seaside Resort & Spa',
      'price': 299,
      'rating': 4.6,
      'location': 'Maldives',
      'description': 'Private beach paradise with overwater bungalows',
      'amenities': ['Private Beach', 'Spa', 'Water Sports', 'Infinity Pool'],
      'image': 'https://example.com/seaside-resort.jpg',
    },
    {
      'name': 'Mountain View Lodge',
      'price': 199,
      'rating': 4.7,
      'location': 'Swiss Alps',
      'description': 'Cozy mountain retreat with breathtaking views',
      'amenities': ['Skiing', 'Restaurant', 'Fireplace', 'Hiking Trails'],
      'image': 'https://example.com/mountain-lodge.jpg',
    },
    {
      'name': 'Urban Boutique Hotel',
      'price': 249,
      'rating': 4.5,
      'location': 'New York, USA',
      'description': 'Modern luxury in the heart of Manhattan',
      'amenities': ['Rooftop Bar', 'Gym', 'Restaurant', 'Business Center'],
      'image': 'https://example.com/urban-boutique.jpg',
    },
    {
      'name': 'Tropical Paradise Resort',
      'price': 399,
      'rating': 4.9,
      'location': 'Bali, Indonesia',
      'description': 'Luxurious villas surrounded by tropical gardens',
      'amenities': ['Private Pool', 'Yoga Center', 'Beach Access', 'Spa'],
      'image': 'https://example.com/tropical-paradise.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Search and filter section
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: 'Search hotels...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    // Add filter functionality
                  },
                  icon: const Icon(Icons.filter_list),
                ),
              ],
            ),
          ),
          // Swiper section
          Expanded(
            child: CardSwiper(
              controller: controller,
              cardsCount: hotels.length,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              numberOfCardsDisplayed: 2,
              backCardOffset: const Offset(40, 40),
              padding: const EdgeInsets.all(24.0),
              cardBuilder: (context, index, horizontalThreshold, verticalThreshold) => 
                HotelSwipeCard(hotel: hotels[index]),
            ),
          ),
          const SizedBox(height: 20),
          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                onTap: () => controller.swipeLeft(),
                icon: Icons.close,
                backgroundColor: Colors.red,
              ),
              _buildActionButton(
                onTap: () => controller.swipeTop(),
                icon: Icons.star,
                backgroundColor: Colors.blue,
              ),
              _buildActionButton(
                onTap: () => controller.swipeRight(),
                icon: Icons.favorite,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onTap,
    required IconData icon,
    required Color backgroundColor,
  }) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: backgroundColor,
      child: Icon(icon),
    );
  }

  bool _onSwipe(int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    final hotel = hotels[previousIndex];
    switch (direction) {
      case CardSwiperDirection.right:
        debugPrint('Liked: ${hotel['name']}');
        break;
      case CardSwiperDirection.left:
        debugPrint('Disliked: ${hotel['name']}');
        break;
      case CardSwiperDirection.top:
        debugPrint('Saved: ${hotel['name']}');
        break;
      default:
        break;
    }
    return true;
  }

  bool _onUndo(int? previousIndex, int currentIndex, CardSwiperDirection direction) {
    debugPrint('Undo swipe');
    return true;
  }
}

class HotelSwipeCard extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelSwipeCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Hotel image (placeholder)
            Image.network(
              'https://www.tourmyindia.com/blog//wp-content/uploads/2022/10/Best-Five-Star-Luxury-Hotels-in-Delhi.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover),

            
            // Hotel information
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            hotel['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '\$${hotel['price']}/night',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white.withOpacity(0.8),
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          hotel['location'],
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${hotel['rating']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      hotel['description'],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: (hotel['amenities'] as List<String>)
                          .map((amenity) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  amenity,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}