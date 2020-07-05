import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_anime_list/http_functions.dart';

class searchpage_anime_detail extends StatefulWidget {
  searchpage_anime_detail({@required this.id});
  final int id;

  @override
  _searchpage_anime_detailState createState() =>
      _searchpage_anime_detailState();
}

class _searchpage_anime_detailState extends State<searchpage_anime_detail> {
  bool isreceived = false;
  bool activate = false;

  @override
  void initState() {
    getanime();
    super.initState();
  }

  getanime() async {
    bool take =
        await searchdetailfunction(null, searchanimesList[widget.id].mal_id);
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
                    child: Image.network(searchanimesList[widget.id].image_url),
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
                                'Airing',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 20,
                                  color: Color(0xff47455f),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                searchanimesList[widget.id].airing
                                    ? 'Ongoing'
                                    : 'Ended',
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
                          child: Text(searchanimesList[widget.id].title,
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
                                searchanimesList[widget.id].score.toString(),
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
                    for (int i = 1; i <= searchanimesList[widget.id].ep; i++)
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
