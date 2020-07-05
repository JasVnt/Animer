import 'package:flutter/material.dart';
import 'package:my_anime_list/http_functions.dart';
import 'package:my_anime_list/constants.dart';
import 'homepage_anime_detail.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'search_page.dart';
import 'profile_page.dart';
import 'Genreanime_page.dart';

class Homepage extends  StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>{
  bool received = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    takeanime();
    super.initState();
  }

  takeanime() async {
    bool take = await getanime();
    setState(() {
      received = take;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Container(
        width: 250,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(image: AssetImage('assets/icon.png')),
                  SizedBox(height: 20,),
                  Text(
                    'Genres ',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Pacifico',
                      color: Color(0xff47455f),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ),
              for(int i=0;i<genrelist.length;i++) ListTile(
                title: Text(genrelist[i],style:TextStyle(fontSize: 15),),
                trailing: Icon(Icons.chevron_right),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => genreanime(id: i,)));
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: received?gradientEndColor:Colors.white,
      body: received
          ? Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [gradientStartColor, gradientEndColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 0.7],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Column(
                        children: <Widget>[
                          TypewriterAnimatedTextKit(
                            text:['Top Anime','My Anime List'],
                            textStyle: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 25,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 475,
                      padding: EdgeInsets.only(left: 32.0),
                      child: Swiper(
                        itemCount: topanimesList.length,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                        layout: SwiperLayout.STACK,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          homepage_anime_detail(
                                            id: i,
                                          )));
                            },
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(32.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 75),
                                            Text(
                                              topanimesList[i].title,
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 20,
                                                color: const Color(0xff47455f),
                                                fontWeight: FontWeight.w900,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              topanimesList[i].ep.toString() +
                                                  ' Episodes',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 15,
                                                color: primaryTextColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  'Know more',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 16,
                                                    color: secondaryTextColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 8),
                                                  child: Icon(Icons.arrow_forward,size: 16,color: secondaryTextColor,),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Container(
                                    width: 180,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: Colors.black54,
                                            blurRadius: 15.0,
                                            offset: Offset(0.0, 0.75)),
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              topanimesList[i].image_url),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                color: navigationColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/icons8-movie-projector-24.png',color: Colors.white70,),
                      onPressed: () => scaffoldKey.currentState.openDrawer(),

                    ),
                    IconButton(
                      icon: Image.asset('assets/profile_icon.png',color: Colors.white70,),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> profilePage()));
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/search_icon.png',color: Colors.white70,),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => searchpage()),);
                      },
                    ),
                  ],
                ),
              ))
          : Center(
              child: SpinKitThreeBounce(
                color: Color(0xff47455f),
                size: 50,
              ),
            ),
    );
  }
}
