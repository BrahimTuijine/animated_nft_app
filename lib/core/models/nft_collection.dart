


import 'package:animated_nft_app/core/models/single_nft.dart';

class NFTCollection {
  final String name;
  final String by;
  final String cover;
  final List<NFT>? nft;
  final double? items;
  final double floorPrice;
  final double? owners;

  const NFTCollection({
    required this.name,
    required this.by,
    required this.cover,
    this.nft,
    this.items,
    required this.floorPrice,
    this.owners,
  });
}