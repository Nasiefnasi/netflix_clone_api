import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/presndtation/Home/screen_home.dart';

class backgroundColor extends StatelessWidget {
  const backgroundColor({super.key, required this.images});
  final String images;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration:  BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500$images'))),
          width: double.infinity,
          height: 600,
          // color: Colors.yellow,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const coustem_button(titel: "My List", iconn: Icons.add),
              home_center(),
              const coustem_button(titel: "info", iconn: Icons.info),
            ],
          ),
        )
      ],
    );
  }

  TextButton home_center() {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kwhitecolor)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          color: Colors.black,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
        ));
  }
}
