import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color_const.dart';
import 'movie_datail_screen.dart';

class ListViewMovieCard extends StatefulWidget {
  final String title;
  final String preImageLink;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final String backDropPath;

  const ListViewMovieCard(
      {Key? key,
      required this.title,
      required this.posterPath,
      required this.preImageLink,
      required this.overview,
      required this.releaseDate,required this.backDropPath})
      : super(key: key);

  @override
  State<ListViewMovieCard> createState() => _ListViewMovieCardState();
}

class _ListViewMovieCardState extends State<ListViewMovieCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                  title: widget.title,
                  backDropPath: widget.backDropPath,
                  posterPath: widget.posterPath,
                  preImageLink: widget.preImageLink,
                  overview: widget.overview,
                  releaseDate: widget.releaseDate),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(top: 25.h, left: 20.w, right: 20.w),
        height: MediaQuery.of(context).size.height * .35,
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Hero(
              tag: Key(widget.title),
              child: Image.network(
                widget.preImageLink + widget.backDropPath,
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
              left: 30,
              child: Text(
                widget.title,
                style: GoogleFonts.poppins(
                  color: MyColors.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ))
        ]),
      ),
    );
  }
}
