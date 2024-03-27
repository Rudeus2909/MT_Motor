import 'package:flutter/material.dart';
import 'package:motor_app/ui/products/product_detail/curved_edges.dart';

class CurvedEdgesWidget extends StatelessWidget {
  const CurvedEdgesWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedEdges(),
      child: child,
    );
  }
}
