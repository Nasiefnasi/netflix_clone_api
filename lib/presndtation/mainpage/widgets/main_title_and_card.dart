// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/model/main_movies/moviess/moviess.dart';

import 'package:netflixapp/presndtation/mainpage/widgets/maincard.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/maintitle.dart';

class MainTitleAndCard extends StatelessWidget {
  const MainTitleAndCard(
      {super.key, required this.title, required this.Categoies});
  final String title;
  final List<Moviess> Categoies;
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(Categoies.length,
                (index) => Maincard(imageurl: Categoies[index].posterPath!)),
          ),
        )
      ],
    );
  }
}
