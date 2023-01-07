import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:animated_nft_app/screens/explore_screen.dart';
import 'package:animated_nft_app/widgets/rotated_list_view.dart';
import 'package:animated_nft_app/widgets/slide_to_continue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              RotatedListView(
                nft: nftCollection[0].nft?.sublist(0, 5),
              ),
              RotatedListView(
                nft: nftCollection[1].nft?.sublist(0, 4),
              ),
              RotatedListView(
                nft: nftCollection[2].nft?.sublist(0, 5),
              ),
              RotatedListView(
                nft: nftCollection[3].nft?.sublist(0, 4),
              ),
              const Spacer(),
              Text(
                'Discover NFT Collection',
                textAlign: TextAlign.center,
                style: bigTextStyle.copyWith(color: kBlackColor),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  homeDiscriptionText,
                  textAlign: TextAlign.center,
                  style: smallTextStyle.copyWith(color: kBlackColor),
                ),
              ),
              SlideToContinue(
                  background: kPinkColor,
                  foreground: kWhiteColor,
                  text: '  Slide to continue',
                  onConfirm: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExploreScreen()),
                    );
                  }),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
