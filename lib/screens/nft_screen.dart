import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:animated_nft_app/widgets/filter_widget.dart';
import 'package:animated_nft_app/widgets/nft_card_widget.dart';
import 'package:animated_nft_app/widgets/small_container.dart';
import 'package:flutter/material.dart';

import 'package:animated_nft_app/core/models/nft_collection.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NFTScreen extends HookWidget {
  final NFTCollection collection;
  const NFTScreen({
    Key? key,
    required this.collection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    late AnimationController animationController;
    late Animation animationFiltredList;
    late Animation animationList;

    useEffect(() {
      animationController = useAnimationController(
        duration: const Duration(seconds: 1),
      );

      animationFiltredList = Tween<double>(begin: 1, end: 0).animate(
          CurvedAnimation(
              parent: animationController,
              curve: const Interval(.5, 1, curve: Curves.easeIn)));

      animationList = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
          parent: animationController,
          curve: const Interval(0, .5, curve: Curves.easeIn)));

      animationController.forward();
      return () {};
    }, const []);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            height: 300,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  collection.cover,
                ),
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    collection.name,
                    style: bigTextStyle,
                  ),
                  Text(
                    collection.by,
                    style: mediumTextStyle,
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          color: kBlackColor.withOpacity(.6),
                          borderRadius: radius10,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: kWhiteColor.withOpacity(.4),
                                  borderRadius: radius10,
                                ),
                                child: const Image(
                                  image: AssetImage(price),
                                ),
                              ),
                              Text(
                                collection.floorPrice.toString(),
                                style: bigTextStyle,
                              ),
                              const Text(
                                'Flore Proce',
                                style: smallTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SmallContainer(
                            backgroundColor: kWhiteColor.withOpacity(.5),
                            foregroundColor: kBlackColor,
                            subtitle: 'Owners',
                            title: collection.owners.toString(),
                          ),
                          SmallContainer(
                            backgroundColor: kWhiteColor.withOpacity(.5),
                            foregroundColor: kBlackColor,
                            subtitle: 'Owners',
                            title: collection.owners.toString(),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedBuilder(
                      animation: animationList,
                      builder: (BuildContext context, Widget? child) {
                        return Transform.translate(
                          offset: Offset(0, height * animationList.value),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: (collection.nft!.length / 2).ceil(),
                            itemBuilder: (BuildContext context, int index) {
                              return NFTCardWidget(
                                nft: collection.nft![index],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        FilterWidget(),
                        Expanded(
                          child: AnimatedBuilder(
                            animation: animationFiltredList,
                            builder: (BuildContext context, Widget? child) {
                              return Transform.translate(
                                offset: Offset(
                                    0, height * animationFiltredList.value),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount:
                                      (collection.nft!.length / 2).ceil(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    index +=
                                        (collection.nft!.length / 2).floor();
                                    return NFTCardWidget(
                                      nft: collection.nft![index],
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
