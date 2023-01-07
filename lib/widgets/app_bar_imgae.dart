// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppBarImages extends StatelessWidget {
  const AppBarImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        AppBarImage(
          image: 'assets/3.png',
        ),
        AppBarImage(
          image: 'assets/7.png',
        ),
        AppBarImage(
          image: 'assets/10.png',
        ),
        AppBarImage(
          image: 'assets/17.png',
        ),
      ],
    );
  }
}

class AppBarImage extends StatelessWidget {
  final String image;
  const AppBarImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(image),
      height: double.infinity,
      width: MediaQuery.of(context).size.width / 4,
      fit: BoxFit.cover,
    );
  }
}
