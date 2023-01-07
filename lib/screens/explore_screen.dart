import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:animated_nft_app/widgets/app_bar_imgae.dart';
import 'package:animated_nft_app/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPinkColor,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Explore'),
              background: AppBarImages(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: nftCollection.length,
              (context, index) {
                return CustomListTile(
                  collection: nftCollection[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
