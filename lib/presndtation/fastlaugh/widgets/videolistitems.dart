import 'package:flutter/material.dart';

class VideoListItems extends StatelessWidget {
  final int index;
  const VideoListItems({super.key, required this.index});

  @override
  Widget build(BuildContext) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index + 6 % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // left side

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color:
                              Color.fromARGB(255, 47, 45, 45).withOpacity(0.30),
                          spreadRadius: 0.50)
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(.80),
                    radius: 27,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off,
                          color: Colors.white,
                        )),
                  ),
                ),

                // rightside
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://www.themoviedb.org/t/p/w64_and_h64_face/yYG7Rhn9HfFpssIMeNiDynvxC14.jpg"),
                      ),
                    ),
                    VideoActionWidget(icon: Icons.emoji_emotions, title: "LOL"),
                    VideoActionWidget(icon: Icons.add, title: "My List"),
                    VideoActionWidget(icon: Icons.share, title: "Share"),
                    VideoActionWidget(icon: Icons.play_arrow, title: "Play")
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            shadows: <Shadow>[
              Shadow(color: Colors.black.withOpacity(.60), blurRadius: 15.0)
            ],
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
