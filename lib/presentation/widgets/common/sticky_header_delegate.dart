// lib/presentation/widgets/common/sticky_header_delegate.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  StickyHeaderDelegate({
    required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: primaryColor,
      child: child,
    );
  }

  @override
  double get minExtent => 50.0; // Minimum height

  @override
  double get maxExtent => 50.0; // Maximum height

  @override
  bool shouldRebuild(StickyHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
