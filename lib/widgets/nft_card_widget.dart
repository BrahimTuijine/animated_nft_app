// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:animated_nft_app/core/models/single_nft.dart';
import 'package:glassmorphism/glassmorphism.dart';

class NFTCardWidget extends StatelessWidget {
  final NFT nft;
  const NFTCardWidget({
    Key? key,
    required this.nft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        height: 180,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(nft.image),
              fit: BoxFit.cover,
            ),
            borderRadius: radius10),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GlassmorphicContainer(
            width: double.infinity,
            blur: 5,
            border: 0,
            borderGradient: borderLinearGradient,
            borderRadius: 10,
            height: 40,
            linearGradient: linearGradient,
            child: Center(
              child: Text(
                nft.price.toString(),
                style: mediumTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
