import 'constants.dart';
import 'package:my_anime_list/classes/top_class.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/classes/searchanime_class.dart';
import 'package:my_anime_list/classes/genreanime_class.dart';

Future<bool> getanime() async {
  final response = await http.get(topapi);

  if (response.statusCode == 200) {
    final body = json.decode(response.body)['top'];
    int i = 0;
    while (i < body.length) {
      final anime = Anime(
        mal_id: body[i]['mal_id'],
        title: body[i]['title'],
        image_url: body[i]['image_url'],
        ep: body[i]['episodes'],
        start_date: body[i]['start_date'],
        end_date: body[i]['end_date'],
        score: body[i]['score'],
        rank: body[i]['rank'],
      );
      topanimesList.add(anime);
      i++;
    }
    return true;
  }
}


Future<bool> searchdetailfunction(String name,int id) async {
  if (name == null) {
    final response = await http.get(
        'https://api.jikan.moe/v3/anime/$id/');
    info = json.decode(response.body)['synopsis'];
    return true;
  }
}

Future<bool> searchpagefunction(String animename) async{
    final response=await http.get('https://api.jikan.moe/v3/search/anime?q=$animename');
    if(response.statusCode==200) {
      final data = json.decode(response.body)['results'];
      for(int i=0;i<data.length;i++){
        var anime=Searched(
          mal_id: data[i]['mal_id'],
          image_url: data[i]['image_url'],
          title: data[i]['title'],
          airing: data[i]['airing'],
          ep: data[i]['episodes'],
          score: data[i]['score'],
          type:data[i]['type'],
        );
        searchanimesList.add(anime);
      }
      return true;
    }
}
Future<bool> getgenreanime(int id) async{
  final response= await http.get('http://api.jikan.moe/v3/genre/anime/$id');

  if(response.statusCode==200) {
    final jsondata = json.decode(response.body)['anime'];

    for(int i=0;i<jsondata.length;i++){
      final Genanime=Genre(
        mal_id:jsondata[i]['mal_id'],
        title: jsondata[i]['title'],
        image_url: jsondata[i]['image_url'],
        ep:jsondata[i]['episodes'],
        synopsis: jsondata[i]['synopsis'],
      );
      genreanimeList.add(Genanime);
    }
    return true;
  }
}

