import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_anime_list/http_functions.dart';

class homepage_anime_detail extends StatefulWidget {
  homepage_anime_detail({@required this.id});
  final int id;

  @override
  _homepage_anime_detailState createState() => _homepage_anime_detailState();
}

class _homepage_anime_detailState extends State<homepage_anime_detail> {
  bool isreceived = false;
  bool activate = false;

  @override
  void initState() {
    getanime();
    super.initState();
  }

  getanime() async {
    bool take =
        await searchdetailfunction(null, topanimesList[widget.id].mal_id);
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
                    child: Image.network(topanimesList[widget.id].image_url),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Rank',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 20,
                                  color: Color(0xff47455f),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                '#' + topanimesList[widget.id].rank.toString(),
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 20,
                                  color: Color(0xff47455f),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(topanimesList[widget.id].title,
                              style: Kanimedetailtitle),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Score',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 20,
                                  color: Color(0xff47455f),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                topanimesList[widget.id].score.toString(),
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 20,
                                  color: Color(0xff47455f),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
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
                    for (int i = 1; i <= topanimesList[widget.id].ep; i++)
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
