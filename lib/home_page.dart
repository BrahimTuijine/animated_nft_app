import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:animated_nft_app/core/widgets/rotated_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            RotatedListView(
              nft: nftCollection[0].nft,
            ),
          ],
        ),
      ),
    );
  }
}
