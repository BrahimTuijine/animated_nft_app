// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:animated_nft_app/core/models/single_nft.dart';

class RotatedListView extends HookWidget {
  final List<NFT>? nft;
  const RotatedListView({
    super.key,
    required this.nft,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Transform.rotate(
        angle: -.2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: nft!.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(nft![index].image);
          },
        ),
      ),
    );
  }
}
