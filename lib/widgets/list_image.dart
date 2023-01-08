// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:animated_nft_app/screens/bid_screen.dart';
import 'package:flutter/material.dart';

import 'package:animated_nft_app/core/models/single_nft.dart';

class ListImage extends StatelessWidget {
  final NFT nft;
  const ListImage({
    Key? key,
    required this.nft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BidSreen(
                    nft: nft,
                  )),
        );
      },
      child: Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: radius10,
          child: Hero(
            tag: nft.price,
            child: Image.asset(
              nft.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
