import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_anime_list/http_functions.dart';

class genrepage_anime_detail extends StatefulWidget {
  genrepage_anime_detail({@required this.id});
  final int id;

  @override
  genrepage_anime_detailState createState() => genrepage_anime_detailState();
}

class genrepage_anime_detailState extends State<genrepage_anime_detail> {
  bool isreceived = false;
  bool activate = false;

  @override
  void initState() {
    getanime();
    super.initState();
  }

  getanime() async {
    bool take =
    await searchdetailfunction(null, genreanimeList[widget.id].mal_id);
    setState(() {
      isreceived = take;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isreceived
          ? Padding(
        padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.network(genreanimeList[widget.id].image_url),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(genreanimeList[widget.id].title,
                        style: Kanimedetailtitle),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black38,
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              child: Text(
                info,
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 12,
                  color: Color(0xff47455f),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Divider(
              color: Colors.black38,
            ),
            SizedBox(
              height: 32,
            ),
            FlatButton(
              child: Text(
                'View all Episodes',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xff47455f),
              onPressed: () {
                setState(() {
                  activate = !activate;
                });
              },
            ),
            if (activate)
              for (int i = 1; i <= genreanimeList[widget.id].ep; i++)
                ListTile(
                  title: Text(
                    'Episode $i',
                    style: TextStyle(color: Color(0xff47455f)),
                  ),
                )
            else
              Container(),
          ],
        ),
      )
          : Center(
        child: SpinKitThreeBounce(
          color: Color(0xff47455f),
          size: 50,
        ),
      ),
    );
  }
}
