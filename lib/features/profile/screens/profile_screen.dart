import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final images = List.generate(
      30,
      (index) => 'https://picsum.photos/300/300?random=${index + 50}',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'alex_dev',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.add_box_outlined),
          SizedBox(width: 16),
          Icon(Icons.menu),
          SizedBox(width: 16),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [

                  const CircleAvatar(
                    radius: 42,
                    child: Icon(
                      Icons.person,
                      size: 42,
                    ),
                  ),

                  const Spacer(),

                  _buildStat("12", "Posts"),

                  const Spacer(),

                  _buildStat("350", "Followers"),

                  const Spacer(),

                  _buildStat("180", "Following"),
                ],
              ),
            ),

            const SizedBox(height: 18),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Alex",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4),

                    Text("Flutter Developer 🚀"),

                    Text("Building an Instagram Clone"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Edit Profile"),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Divider(),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.grid_on),
                Icon(Icons.video_collection_outlined),
                Icon(Icons.person_pin_outlined),
              ],
            ),

            const Divider(),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(label),
      ],
    );
  }
}