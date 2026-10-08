import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerLoadingWidget extends StatelessWidget {
  const CustomShimmerLoadingWidget({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2D1046),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade800,
          highlightColor: Colors.grey.shade600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header lines
              const _ShimmerBar(width: 60, height: 10),
              const SizedBox(height: 10),
              const _ShimmerBar(width: 120, height: 16),
              const SizedBox(height: 20),

              // Paragraph lines
              ...List.generate(
                  4,
                  (_) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: const _ShimmerBar(
                            width: double.infinity, height: 12),
                      )),
              const SizedBox(height: 20),

              // Icon + line
              Row(
                children: [
                  const _ShimmerCircle(size: 12),
                  const SizedBox(width: 10),
                  const _ShimmerBar(width: 80, height: 10),
                ],
              ),
              const SizedBox(height: 30),

              // Ticket/button shape
              Center(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.purple.shade300, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:
                      Center(child: const _ShimmerBar(width: 200, height: 14)),
                ),
              ),
              const Spacer(),

              // Footer
              Row(
                children: [
                  const _ShimmerCircle(size: 16),
                  const SizedBox(width: 10),
                  const _ShimmerBar(width: 60, height: 10),
                  const Spacer(),
                  const _ShimmerBar(width: 100, height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShimmerBar extends StatelessWidget {
  const _ShimmerBar({this.width = 100, this.height = 10});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class _ShimmerCircle extends StatelessWidget {
  const _ShimmerCircle({this.size = 16});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
