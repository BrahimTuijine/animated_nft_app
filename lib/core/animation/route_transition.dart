// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SlideRight extends PageRouteBuilder {
  final Widget page;
  SlideRight({
    required this.page,
  }) : super(
          pageBuilder: (context, animation, animationTwo) => page,
          transitionsBuilder: (context, animation, animationTwo, child) {
            Tween<Offset> tween =
                Tween(begin: const Offset(1, 0), end: Offset.zero);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

class FadeTransitonAnimation extends PageRouteBuilder {
  final Widget page;
  FadeTransitonAnimation({
    required this.page,
  }) : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> animationTwo) =>
                page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
}
