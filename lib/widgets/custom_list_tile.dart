// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:animated_nft_app/core/models/nft_collection.dart';

class CustomListTile extends StatelessWidget {
  final NFTCollection collection;
  const CustomListTile({
    Key? key,
    required this.collection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: roundWhite,
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: radius10,
              child: Image(
                height: 70,
                width: 70,
                image: AssetImage(collection.cover),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  collection.name,
                  style: mediumTextStyle.copyWith(color: kBlackColor),
                ),
                Text(
                  collection.by,
                  style: smallTextStyle.copyWith(color: kBlackColor),
                ),
              ],
            ),
            const Spacer(),
            Text(
              '${collection.floorPrice} ETH',
              style: mediumTextStyle.copyWith(color: kBlackColor),
            ),
          ],
        ),
      ),
    );
  }
}
