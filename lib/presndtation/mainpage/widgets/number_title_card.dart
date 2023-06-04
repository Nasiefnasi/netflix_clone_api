import 'package:flutter/material.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/model/main_movies/moviess/moviess.dart';
import 'package:netflixapp/presndtation/funtion/apiCRUD.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/number_card.dart';

import 'maintitle.dart';

class NumberTitlecard extends StatelessWidget {
  const NumberTitlecard({
    super.key,
    required this.Categoies,
    required this.titel,
  });
  final List<Moviess> Categoies;
  final String titel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: titel),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => NumberCard(
                    index: index,
                    imageuri: Categoies[index].posterPath!)),
          ),
        )
      ],
    );
  }
}
