import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/model/main_movies/moviess/moviess.dart';
import 'package:netflixapp/presndtation/funtion/apiCRUD.dart';
import 'package:netflixapp/presndtation/search/widgets/searchtitles.dart';

class SearchIdleWidget extends StatelessWidget {
  SearchIdleWidget({super.key});
  final List<Moviess> movie = HomeFuntion.commingsoon + HomeFuntion.nowPlay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTexttitle(searchtitle: "Top Movies"),
          kheight,
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    TopSearchitemlists(movie: movie[index]),
                separatorBuilder: (context, index) => kheight50,
                itemCount: movie.length),
          )
        ],
      )),
    );
  }
}

class TopSearchitemlists extends StatelessWidget {
  const TopSearchitemlists({super.key, required this.movie});

  final Moviess movie;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: screenWidth * 0.4,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                fit: BoxFit.cover),
          ),
        ),
        kwidth,
        Expanded(
          child: Text(
            movie.title ?? "Unknown",
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const CircleAvatar(
          radius: 30,
          backgroundColor: kwhitecolor,
          child: CircleAvatar(
            backgroundColor: kblackcolor,
            radius: 28,
            child: Icon(
              Icons.play_circle_filled_outlined,
              color: kwhitecolor,
            ),
          ),
        )
      ],
    );
  }
}
