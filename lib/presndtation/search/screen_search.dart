import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/presndtation/search/funtions/funtions.dart';
import 'package:netflixapp/presndtation/search/widgets/screenidle.dart';
import 'package:netflixapp/presndtation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
                onChanged: (value) async {
                  SearchFunction.searchResult(value);
                },
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
          
            kheight,
             Expanded(
                  child: ValueListenableBuilder(
                valueListenable: SearchFunction.searchData,
                builder: (context, value, child) {
                  return value.isEmpty ? SearchIdleWidget(): const SearchResultWidget();
                },
              ))
    
          ],
        ),
      )),
    );
  }
}
