import 'package:flutter/material.dart';
import 'package:my_anime_list/http_functions.dart';
import 'package:my_anime_list/constants.dart';
import 'searchpage_anime_detail.dart';

class searchpage extends StatefulWidget {
  @override
  _searchpageState createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  int i = 0;
  bool isfetched = false;
  final mycontroller = TextEditingController();

  @override
  void dispose() {
    mycontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  getsearchanime(String searchtext) async {
    bool value = await searchpagefunction(searchtext);
    setState(() {
      isfetched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(32.0),
          child: ListView(
            children: <Widget>[
              Text(
                'Search Animes',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 30,
                  color: Color(0xff47455f),
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: mycontroller,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {
                      i++;
                      if (i == 1) {
                        getsearchanime(mycontroller.text);
                      } else {
                        searchanimesList = [];
                        setState(() {
                          isfetched = false;
                        });
                        getsearchanime(mycontroller.text);
                      }
                    },
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Color(0xff47455f),
                    ),
                  ),
                  hintText: 'Search...',
                  hintStyle: TextStyle(fontSize: 20),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff47455f),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff47455f),
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff47455f),
                    ),
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff47455f),
                ),
                onSubmitted: (String name) {
                  getsearchanime(name);
                },
              ),
              SizedBox(
                height: 50,
              ),
              if (isfetched)
                for (int i = 0; i < searchanimesList.length; i++)
                  Container(
                    child: ListTile(
                      title: Text(searchanimesList[i].title),
                      subtitle:
                          Text('Type '+searchanimesList[i].type+' (${searchanimesList[i].ep.toString()} Episodes)'),
                      leading: Image.network(searchanimesList[i].image_url),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => searchpage_anime_detail(
                                      id: i,
                                    )));
                      },
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
