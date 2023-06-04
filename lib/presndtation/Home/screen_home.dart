// ignore_for_file: must_be_immutable, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/presndtation/funtion/apiCRUD.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/background_image.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/main_title_and_card.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/number_title_card.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  ValueNotifier<bool> ScrollNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: ScrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    ScrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    ScrollNotifier.value = true;
                  }
                  return true;
                },
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            backgroundColor(images: HomeFuntion.imges),
                            kheight20,
                            MainTitleAndCard(
                                title: "Released In Past Year",
                                Categoies: HomeFuntion.nowPlay),
                            MainTitleAndCard(
                                title: "Trending Now",
                                Categoies: HomeFuntion.trending),
                            NumberTitlecard(
                                Categoies: HomeFuntion.TtopRatedUrl,
                                titel: "Top 10 Tv Shows In India Today"),
                            MainTitleAndCard(
                                title: "Trending Now",
                                Categoies: HomeFuntion.commingsoon),
                          ],
                        ),
                      ),
                      ScrollNotifier.value == true
                          ? Container(
                              width: double.infinity,
                              height: 100,
                              color: const Color.fromARGB(104, 36, 18, 18),
                              child: Column(
                                children: [
                                  kheight,
                                  top_appbar(),
                                  kheight,
                                  appbar_second_row()
                                ],
                              ),
                            )
                          : kheight,
                    ])),
              );
            }));
  }

  Row appbar_second_row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text(
          'TV Shows',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          'Movies',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          'Categoies',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }

  Row top_appbar() {
    return Row(
      children: [
        kheight,
        const SizedBox(
          width: 15,
        ),
        Image.network(
          'https://www.pngmart.com/files/10/Netflix-N-Logo-PNG-Image.png',
          width: 25,
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: kwhitecolor,
          size: 30,
        ),
        kwidth,
        Container(
          width: 25,
          height: 25,
          color: Colors.blueAccent,
        ),
        kwidth,
      ],
    );
  }
}

class coustem_button extends StatelessWidget {
  const coustem_button({
    Key? key,
    required this.titel,
    required this.iconn,
  }) : super(key: key);
  final String titel;
  final IconData iconn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconn,
          size: 40,
          color: kwhitecolor,
        ),
        Text(
          titel,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}
