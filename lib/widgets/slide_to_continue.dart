// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import 'package:animated_nft_app/core/constants/constants.dart';

class SlideToContinue extends StatelessWidget {
  final Color background;
  final Color foreground;
  final String text;
  final Function()? onConfirm;

  const SlideToContinue({
    Key? key,
    required this.background,
    required this.foreground,
    required this.text,
    this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ConfirmationSlider(
        onConfirmation: () => onConfirm?.call(),
        backgroundColor: background,
        foregroundColor: foreground,
        sliderButtonContent: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: kPinkColor,
        ),
        text: text,
        textStyle: mediumTextStyle,
      ),
    );
  }
}
