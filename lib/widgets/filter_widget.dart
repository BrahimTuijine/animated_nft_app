import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// ignore: must_be_immutable
class FilterWidget extends HookWidget {
  FilterWidget({super.key});
  bool finished = false;

  @override
  Widget build(BuildContext context) {
    late AnimationController animationController;
    late Animation animation;
    useEffect(() {
      animationController =
          useAnimationController(duration: const Duration(milliseconds: 500));

      animation = Tween<double>(begin: 0, end: 150).animate(animationController)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            finished = true;
          }
        });

      animationController.forward();
      return null;
    }, const []);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Container(
          height: 60,
          width: animation.value,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: radius100,
          ),
          child: Row(
            children: <Widget>[
              const Spacer(),
              if (finished)
                const Text(
                  'Filter',
                  style: mediumTextStyle,
                ),
              const Spacer(),
              if (finished)
                ClipOval(
                  child: Container(
                    height: 50,
                    width: 50,
                    color: kWhiteColor,
                    child: const Icon(Icons.tune_rounded),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
