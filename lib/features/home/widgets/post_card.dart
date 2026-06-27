import 'package:flutter/material.dart';

import '../models/post.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({
    super.key,
    required this.post,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}
class _PostCardState extends State<PostCard> {
  late int likeCount;
  bool isLiked = false;
@override
void initState() {
  super.initState();
  likeCount = widget.post.likes;
}

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
  children: [
    const CircleAvatar(
      radius: 18,
      child: Icon(Icons.person, size: 20),
    ),

    const SizedBox(width: 10),

    Expanded(
      child: Text(
        widget.post.username,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    ),

    const Icon(Icons.more_vert),
  ],
),

            const SizedBox(height: 12),

           ClipRRect(
             borderRadius: BorderRadius.circular(8),
               child: Image.network(
               widget.post.imageUrl,
               height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                ),
               ),

            const SizedBox(height: 12),

           Row(
  children: [
    IconButton(
      onPressed: () {
        setState(() {
          isLiked = !isLiked;

          if (isLiked) {
            likeCount++;
          } else {
            likeCount--;
          }
        });
      },
      icon: Icon(
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked ? Colors.red : null,
      ),
    ),

    const Icon(Icons.chat_bubble_outline),

    const SizedBox(width: 16),

    const Icon(Icons.send),

    const Spacer(),

    const Icon(Icons.bookmark_border),
  ],
),
            const SizedBox(height: 10),
            Text(
             '$likeCount likes',
              style: const TextStyle(
               fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),

           RichText(
  text: TextSpan(
    style: DefaultTextStyle.of(context).style,
    children: [
      TextSpan(
        text: '${widget.post.username} ',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(
        text: widget.post.caption,
      ),
    ],
  ),
),
const SizedBox(height: 6),

const Text(
  'View all 12 comments',
  style: TextStyle(
    color: Colors.grey,
  ),
),

const SizedBox(height: 4),

const Text(
  '2 hours ago',
  style: TextStyle(
    color: Colors.grey,
    fontSize: 12,
  ),
),
          ],
        ),
      ),
    );
  }
}