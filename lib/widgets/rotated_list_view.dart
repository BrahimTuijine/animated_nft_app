// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:animated_nft_app/widgets/list_image.dart';
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
    final ScrollController scrollController =
        useScrollController(initialScrollOffset: 2);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: Duration(seconds: Random().nextInt(5) + 5),
            curve: Curves.easeInOut);
      });
      return null;
    }, const []);
    return SizedBox(
      height: 100,
      child: Transform.rotate(
        angle: -.2,
        child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: nft!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListImage(nft: nft![index]);
          },
        ),
      ),
    );
  }
}
