import 'package:flutter/material.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/model/main_movies/moviess/moviess.dart';
import 'package:netflixapp/presndtation/search/funtions/funtions.dart';
import 'package:netflixapp/presndtation/search/widgets/searchtitles.dart';



class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTexttitle(searchtitle: "Movies & Shows"),
        kheight,
        ValueListenableBuilder(
          valueListenable: SearchFunction.searchData,
          builder: (context, value, child) => 
           Expanded(
              child: GridView.count(
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 9,
                  childAspectRatio: 1 / 1.4,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: List.generate(value.length, (index) {
                    return  MainMovieCards(imageurl:value[index].posterPath??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_wwBSMTV8Xg1CLSugGqm0nnSzoVhXcgHXJfRd5GuIcQ&usqp=CAU&ec=48665701' );
                  }))),
        )
      ],
    );
  }
}

class MainMovieCards extends StatelessWidget {
  const MainMovieCards({super.key, required this.imageurl});
  
final String imageurl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500$imageurl'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
