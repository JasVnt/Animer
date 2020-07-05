import 'package:flutter/material.dart';
import 'package:my_anime_list/classes/top_class.dart';
import 'package:my_anime_list/classes/searchanime_class.dart';
import 'package:my_anime_list/classes/genreanime_class.dart';

var topapi='https://api.jikan.moe/v3/top/anime/1/';

var searchapi='https://api.jikan.moe/v3/anime/20/episodes/';

Color primaryTextColor = Color(0xFF414C6B);
Color secondaryTextColor = Color(0xFFE4979E);
Color titleTextColor = Colors.white;
Color contentTextColor = Color(0xff868686);
Color navigationColor = Color(0xFF6751B5);
Color gradientStartColor = Color(0xFF0050AC);
Color gradientEndColor = Color(0xFF9354B9);

List<String> genrelist=[
  'Action',
  'Adventure',
  'Cars',
  'Comedy',
  'Dementia',
  'Demons',
  'Mystery',
  'Drama',
  'Ecchi',
  'Fantasy',
  'Game',
  'Hentai',
  'Historical',
  'Horror',
  'Kids',
  'Magic',
  'Martial Arts',
  'Mecha',
  'Music',
  'Parody',
  'Samurai',
  'Romance',
  'School',
  'Sci Fi',
  'Shoujo',
  'Shoujo Ai',
  'Shounen',
  'Shounen Ai',
  'Space',
  'Sports',
  'Super Power',
  'Vampire',
  'Yaoi',
  'Yuri',
  'Harem',
  'Slice Of Life',
  'Supernatural',
  'Military',
  'Police',
  'Psychological',
  'Thriller',
  'Seinen',
  'Josei',
];

List<Anime> topanimesList=[];

List<Searched> searchanimesList=[];

String info;

List<Genre> genreanimeList=[];

const bodycolor=Color(0xffFFD55A);

var Kanimetitle = TextStyle(
  fontSize: 13,
  color: Colors.black87,
  fontWeight: FontWeight.w600,
  fontStyle: FontStyle.italic,
  //fontFamily: 'Rationale',
);

var Kanimedetailtitle =TextStyle(
  fontFamily: 'Avenir',
  fontSize: 23,
  color: Color(0xff47455f),
  fontWeight: FontWeight.w900,
);

var Kanimesubtitle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.italic,
);
//
//class Box extends StatelessWidget {
//  Box({this.title,this.image_url});
//  final String image_url;
//  final String title;
//  @override
//  Widget build(BuildContext context) {
//    return Expanded(
//      child: Padding(
//        padding: EdgeInsets.all(5.0),
//        child: Container(
//          height: 350,
//          child: Card(
//            elevation: 2,
//            child: Column(
//              children: <Widget>[
//                Image.network(image_url,height: 300,),
//                Text(title,textAlign: TextAlign.center,style: TextStyle(
//                  fontWeight: FontWeight.w600,
//                  //color: Colors.white,
//                ),),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}