import 'package:flutter/material.dart';

class GlowHoverContainer extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final double glowOpacity;
  final double blurRadius;
  final double spreadRadius;
  final double scaleFactor;
  final Duration duration;
  final Widget? child;

  const GlowHoverContainer({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.borderColor,
    this.borderWidth = 2,
    this.glowOpacity = 0.5,
    this.blurRadius = 25,
    this.spreadRadius = 3,
    this.scaleFactor = 1.08,
    this.duration = const Duration(milliseconds: 200),
    this.child,
  });

  @override
  State<GlowHoverContainer> createState() => _GlowHoverContainerState();
}

class _GlowHoverContainerState extends State<GlowHoverContainer> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (context) => setState(() => isHovering = true),
      onExit: (context) => setState(() => isHovering = false),
      child: AnimatedScale(
        scale: isHovering ? widget.scaleFactor : 1.0,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // ✅ Layer 1: Glow + Border
              AnimatedContainer(
                duration: widget.duration,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: widget.borderColor,
                    width: widget.borderWidth,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: widget.borderColor.withOpacity(
                        isHovering ? widget.glowOpacity : 0.0,
                      ),
                      blurRadius: isHovering ? widget.blurRadius : 0,
                      spreadRadius: isHovering ? widget.spreadRadius : 0,
                    ),
                  ],
                ),
              ),

              // ✅ Layer 2: Container ثابت اللون
              Container(
                width: widget.width-1,
                height: widget.height-1,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
