import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:animated_nft_app/widgets/filter_widget.dart';
import 'package:animated_nft_app/widgets/nft_card_widget.dart';
import 'package:animated_nft_app/widgets/small_container.dart';
import 'package:flutter/material.dart';

import 'package:animated_nft_app/core/models/nft_collection.dart';

class NFTScreen extends StatelessWidget {
  final NFTCollection collection;
  const NFTScreen({
    Key? key,
    required this.collection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: (collection.nft!.length / 2).ceil(),
                      itemBuilder: (BuildContext context, int index) {
                        return NFTCardWidget(
                          nft: collection.nft![index],
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const FilterWidget(
                          
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: (collection.nft!.length / 2).ceil(),
                            itemBuilder: (BuildContext context, int index) {
                              index += (collection.nft!.length / 2).floor();
                              return NFTCardWidget(
                                nft: collection.nft![index],
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
