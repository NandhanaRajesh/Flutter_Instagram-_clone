import 'package:flutter/material.dart';
import '../../../shared/widgets/stories_list.dart';
import '../../post/screens/add_post_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../../reels/screens/reels_screen.dart';
import '../../search/screens/search_screen.dart';
import '../models/post.dart';
import '../widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<Post> posts = const [
  Post(
  username: 'Alex',
  caption: 'Learning Flutter 🚀',
  likes: 120,
  imageUrl: 'https://picsum.photos/id/1015/600/600',
),
  Post(
  username: 'Emma',
  caption: 'Beautiful sunset 🌅',
  likes: 350,
  imageUrl: 'https://picsum.photos/id/1025/600/600',
),
  Post(
  username: 'John',
  caption: 'Coffee first ☕',
  likes: 98,
  imageUrl: 'https://picsum.photos/id/1040/600/600',
),
  Post(
  username: 'Sarah',
  caption: 'Weekend vibes 😎',
  likes: 500,
  imageUrl: 'https://picsum.photos/id/1062/600/600',
),
];

  List<Widget> get screens => [
  HomeFeed(posts: posts),
  const SearchScreen(),
  const AddPostScreen(),
  const ReelsScreen(),
  const ProfileScreen(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}

class HomeFeed extends StatelessWidget {
  final List<Post> posts;

  const HomeFeed({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text(
    'Instagram',
    style: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
  ),
  actions: const [
    Icon(Icons.favorite_border),
    SizedBox(width: 20),
    Icon(Icons.send_outlined),
    SizedBox(width: 16),
  ],
),
      body: ListView(
        children: [
          const StoriesList(),

          const Divider(),

          ...posts.map(
            (post) => PostCard(post: post),
          ),
        ],
      ),
    );
  }
}