import 'package:flutter/material.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/presndtation/search/widgets/search_result.dart';



class Maincard extends StatelessWidget {
  const Maincard({
    super.key, required this.imageurl,
  });
final String imageurl;
  @override
  Widget build(BuildContext context) {
    print( 'https://image.tmdb.org/t/p/w500$imageurl');
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 200,
      width: 150,
      //  color: Colors.red,
      decoration: BoxDecoration(
        borderRadius: kradius10,
        image:  DecorationImage(
          fit: BoxFit.cover,
                      image: NetworkImage(
                'https://image.tmdb.org/t/p/w500$imageurl')),
      ),
    );
  }
}
