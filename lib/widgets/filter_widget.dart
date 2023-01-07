import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: kBlackColor,
        borderRadius: radius100,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Spacer(),
          const Text(
            'Filter',
            style: mediumTextStyle,
          ),
          const Spacer(),
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
  }
}
