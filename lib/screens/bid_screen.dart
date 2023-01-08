import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:animated_nft_app/widgets/slide_to_continue.dart';
import 'package:flutter/material.dart';

import 'package:animated_nft_app/core/models/single_nft.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:glassmorphism/glassmorphism.dart';

class BidSreen extends HookWidget {
  final NFT nft;
  const BidSreen({
    Key? key,
    required this.nft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Future.delayed(const Duration(milliseconds: 700), () {
          showModel(context);
        });
      });
      return null;
    }, const []);
    return Scaffold(
      backgroundColor: kTransparent,
      body: Hero(
        tag: nft.price,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(nft.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: kTransparent,
            appBar: AppBar(
              backgroundColor: kTransparent,
              elevation: 0,
              toolbarHeight: 90,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: radius100,
                    color: kWhiteColor,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: kBlackColor,
                  ),
                ),
              ),
              actions: [
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: radius100,
                    image: const DecorationImage(
                        image: AssetImage('assets/profile.png'),
                        fit: BoxFit.cover),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showModel(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: kTransparent,
        barrierColor: kTransparent,
        enableDrag: false,
        context: context,
        // transitionAnimationController: useAnimationController(
        //     duration: const Duration(seconds: 1),
        //     reverseDuration: const Duration(seconds: 1)),
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              Navigator.pop(context);
              Navigator.pop(context);
              return true;
            },
            child: GlassmorphicContainer(
              width: double.infinity,
              height: 200,
              blur: 5,
              border: 0,
              borderGradient: borderLinearGradient,
              borderRadius: 0,
              linearGradient: linearGradient,
              child: Center(
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Text(
                      '${nft.price.toString().padRight(2, '0')} ETH',
                      style: bigTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SlideToContinue(
                      background: kBlackColor,
                      foreground: kWhiteColor,
                      text: 'Place Bid Now',
                      onConfirm: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
