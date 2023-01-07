// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SmallContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String title;
  final String subtitle;
  const SmallContainer({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: radius10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$title K',
            style: mediumTextStyle.copyWith(color: foregroundColor),
          ),
          Text(
            subtitle,
            style: smallTextStyle.copyWith(color: foregroundColor),
          ),
        ],
      ),
    );
  }
}
