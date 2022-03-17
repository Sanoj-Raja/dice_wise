import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final String imageUrl;

  const ImageBox({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          imageUrl,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
