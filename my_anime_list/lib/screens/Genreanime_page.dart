import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/http_functions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'genrepage_anime_detail.dart';

class genreanime extends StatefulWidget {
  genreanime({this.id});
  int id;
  @override
  _genreanimeState createState() => _genreanimeState();
}

class _genreanimeState extends State<genreanime> {
  bool isreceived=false;

  @override
  void initState() {
    boxfunction();
    // TODO: implement initState
    super.initState();
  }

  boxfunction() async{
    genreanimeList=[];
    isreceived=false;
    bool take=await getgenreanime(widget.id+1);
    setState(() {
      isreceived=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff47455f),
        title: Text('${genrelist[widget.id]}'+' Anime',style: TextStyle(color:Colors.white),),
      ),
      body: isreceived?ListView.builder(
        itemCount: genreanimeList.length,
        itemBuilder: (context,i){
          return ListTile(
            title: Text(genreanimeList[i].title),
            leading: Image.network(genreanimeList[i].image_url),
            subtitle: Text(genreanimeList[i].ep.toString()+' Episodes'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => genrepage_anime_detail(id: i,)));
            },
          );
        },
      ):Center(
        child: SpinKitThreeBounce(
          color: Color(0xff47455f),
          size: 50,
        ),
      ),
    );
  }
}
