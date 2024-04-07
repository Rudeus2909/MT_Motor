import 'package:flutter/material.dart';
import 'package:motor_app/ui/widgets/curved_edges_widget.dart';

import '../widgets/custom_appbar.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppbar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Haha', style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.grey),),
                  Text('Hehehe', style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
                ],
              ),
            ),
            CurvedEdgesWidget(
              child: Container(
                color: Colors.red.shade400,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                          top: -150,
                          right: -250,
                          child: CircularContainer(
                            backgroundColor: Colors.white.withOpacity(0.1),
                          )),
                      Positioned(
                          top: 100,
                          right: -300,
                          child: CircularContainer(
                            backgroundColor: Colors.white.withOpacity(0.1),
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundColor = Colors.white,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
