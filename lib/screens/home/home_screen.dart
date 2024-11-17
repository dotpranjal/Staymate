// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardSwiperController controller = CardSwiperController();

  // Extended sample data
  final List<Map<String, dynamic>> cards = [
    {
      'title': 'Eiffel Tower',
      'type': 'place',
      'image': 'https://example.com/eiffel.jpg',
      'description': 'Iconic landmark in Paris',
      'location': 'Paris, France',
    },
    {
      'title': 'Grand Plaza Hotel',
      'type': 'hotel',
      'image': 'https://example.com/hotel.jpg',
      'description': 'Luxury 5-star hotel with spectacular views',
      'location': 'New York, USA',
    },
    {
      'title': 'Colosseum',
      'type': 'place',
      'image': 'https://example.com/colosseum.jpg',
      'description': 'Ancient amphitheater in Rome',
      'location': 'Rome, Italy',
    },
    {
      'title': 'Seaside Resort',
      'type': 'hotel',
      'image': 'https://example.com/seaside.jpg',
      'description': 'Beachfront resort with private beach access',
      'location': 'Maldives',
    },
    {
      'title': 'Taj Mahal',
      'type': 'place',
      'image': 'https://example.com/tajmahal.jpg',
      'description': 'Beautiful marble mausoleum',
      'location': 'Agra, India',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: CardSwiper(
              controller: controller,
              cardsCount: cards.length,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              numberOfCardsDisplayed: 2, // Reduced to 2 cards
              backCardOffset: const Offset(40, 40),
              padding: const EdgeInsets.all(24.0),
              cardBuilder: (context, index, horizontalThreshold, verticalThreshold) => 
                SwipeCard(data: cards[index]),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () => controller.swipeLeft(),
                backgroundColor: Colors.red,
                child: const Icon(Icons.close),
              ),
              FloatingActionButton(
                onPressed: () => controller.swipeRight(),
                backgroundColor: Colors.green,
                child: const Icon(Icons.favorite),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  bool _onSwipe(int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    debugPrint('The card was swiped to ${direction.name}');
    // You can add your logic here for when a card is swiped
    if (direction == CardSwiperDirection.right) {
      // Handle right swipe (like)
      final likedItem = cards[previousIndex];
      debugPrint('Liked: ${likedItem['title']}');
    } else if (direction == CardSwiperDirection.left) {
      // Handle left swipe (dislike)
      final dislikedItem = cards[previousIndex];
      debugPrint('Disliked: ${dislikedItem['title']}');
    }
    return true;
  }

  bool _onUndo(int? previousIndex, int currentIndex, CardSwiperDirection direction) {
    debugPrint('The card was undone from ${direction.name}');
    return true;
  }
}

class SwipeCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const SwipeCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Replace this with actual network image when you have real URLs
            Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: double.infinity,
              child: Icon(
                data['type'] == 'hotel' ? Icons.hotel : Icons.place,
                size: 100,
                color: Colors.grey[400],
              ),
            ),
            // Add swipe indicators
            _buildSwipeIndicator(context),
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
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
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
                          data['location'],
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data['description'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
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

  Widget _buildSwipeIndicator(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          right: 20,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'LIKE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Transform.rotate(
            angle: 0.5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'NOPE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}