import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color_const.dart';
import 'movie_datail_screen.dart';

class CommonGridViewTile extends StatelessWidget {
  const CommonGridViewTile(
      {Key? key,
      required this.title,
      required this.posterPath,
      required this.backDropPath,
      required this.preImageLink,required this.overview,required this.releaseDate})
      : super(key: key);
  final String title;
  final String posterPath;
  final String backDropPath;
  final String preImageLink;
  final String overview;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                  title: title,
                  backDropPath: backDropPath,
                  posterPath: posterPath,
                  preImageLink: preImageLink,
                  overview: overview,
                  releaseDate: releaseDate),
            ));
      },
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Hero(
            tag: Key(title),
            child: Image.network(
              preImageLink + backDropPath,
              width: double.infinity,
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    ),
                  );
                }
              },
            ),
          ),
        ),
        Positioned(
            bottom: 30,
            right: 0,
            left: 15,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: MyColors.whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ))
      ]),
    );
  }
}
