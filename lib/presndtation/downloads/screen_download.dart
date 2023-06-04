import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/presndtation/downloads/widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});
  final _widgetpage = [
    const SmartDownloads(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: AppbarWidget(
                title: "Downloads",
              ),
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => _widgetpage[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _widgetpage.length));
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.settings, color: kwhitecolor),
        kwidth,
        Text("NOt Smart Downloads")
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List images = [
      "https://images.pexels.com/photos/9807283/pexels-photo-9807283.jpeg?auto=compress&cs=tinysrgb&w=600",
      "https://images.pexels.com/photos/16850880/pexels-photo-16850880/free-photo-of-back-of-a-red-toyota-gr86-on-an-asphalt-road.jpeg?auto=compress&cs=tinysrgb&w=600",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/1NxaSn4ver4jIvLeD7YF8cTlZjB.jpg",
    ];
    return Column(
      children: [
        const Text(
          "Introduce Download for You",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhitecolor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          "Lorem Ipsum is simply dummy text\n of the printing and typesetting \nindustry. Lorem Ipsum has \n industry's",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        kheight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.39,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              DownloadsImagesWidget(
                images: images[0],
                margin: EdgeInsets.only(left: 160),
                angle: 20,
                size: Size(size.width * 0.35, size.width * 0.55),
                radius: 10,
              ),
              DownloadsImagesWidget(
                  images: images[1],
                  margin: EdgeInsets.only(right: 160),
                  angle: -20,
                  radius: 10,
                  size: Size(size.width * 0.35, size.width * 0.55)),
              DownloadsImagesWidget(
                images: images[2],
                margin: EdgeInsets.only(bottom: 10),
                size: Size(size.width * 0.4, size.width * 0.65),
                radius: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: MaterialButton(
              color: kbuttoncolorblue,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Set Up",
                  style: TextStyle(
                      color: kwhitecolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        kheight,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: kbuttoncolorwhite,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "See what you can download",
                style: TextStyle(
                    color: kblackcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadsImagesWidget extends StatelessWidget {
  const DownloadsImagesWidget(
      {super.key,
      required this.images,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radius = 10});
  final double radius;
  final String images;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            // margin: margin,

            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(images))),
          ),
        ),
      ),
    );
  }
}
