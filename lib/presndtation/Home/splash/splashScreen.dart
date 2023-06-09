import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflixapp/presndtation/funtion/apiCRUD.dart';
import 'package:netflixapp/presndtation/mainpage/screen_main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splash(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDmmMZIyhtPhFrPgNJluXUJYJXROSX8Ua67A&usqp=CAU'),
      )),
    );
  }

  Future<void> splash(BuildContext context) async {
    //  await homeFunction.getComingSoon();
    // await homeFunction.gettopRated();
    // await homeFunction.getNowPlaying();
    // await NewAndhotFunctions.getDiscover();
    await HomeFuntion.gettopRatedUrl();
    await HomeFuntion.getComingSoon();
    await HomeFuntion.getnow_playing();
    HomeFuntion.getTrending().whenComplete(
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ScreenMainpage(),
        ),
      ),
    );
  }
}
