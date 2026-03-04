import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const FullScreenImage({
    super.key,
    required this.imageUrl,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Hero(
            tag: heroTag,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 8,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
              
                  child: Image.asset(imageUrl, fit: BoxFit.contain),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
