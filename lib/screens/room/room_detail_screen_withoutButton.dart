import 'package:flutter/material.dart';
import '../../models/room.dart';
import '../../data/dummy_data.dart';

class RoomDetailScreen2 extends StatefulWidget {
  static const routeName = '/roomDetail2';
  final Function todoHandler;
  final Function isTodo;
  RoomDetailScreen2(this.todoHandler, this.isTodo);

  @override
  _RoomDetailScreen2State createState() => _RoomDetailScreen2State();
}

class _RoomDetailScreen2State extends State<RoomDetailScreen2> {
  @override
  Widget build(BuildContext context) {
    final roomId = ModalRoute.of(context).settings.arguments as String;
    final selectedRoom =
        DUMMY_ROOM.firstWhere((element) => roomId == element.id);
    final title = selectedRoom.title;
    final description = selectedRoom.description;
    final imgPath = selectedRoom.imgPath;
    final location = selectedRoom.location;
    final category = selectedRoom.category;
    String category_text;
    if (category == Category.Education) {
      category_text = 'Education';
    }
    if (category == Category.Game) {
      category_text = 'Game';
    }
    if (category == Category.Show) {
      category_text = 'Show';
    }

    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text(
          '${title}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(),
                  child: Image.asset(
                    imgPath,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned(
                //   right: 8,
                //   top: 10,
                //   child: Container(
                //     margin: EdgeInsets.all(2),
                //     padding: EdgeInsets.only(right: 5),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //     child: Row(
                //       children: <Widget>[
                //         Icon(
                //           icondata,
                //           size: 50,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Rooms :',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    '${title}',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    '( Category : ${category_text} )',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Divider(
                thickness: 2,
                color: Colors.grey,
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 60,
                  margin: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.insert_comment,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              'Detail : ',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          child: ListView(
                            children: <Widget>[
                              Text(
                                '${description}',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 100,
                  margin: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.room),
                          Container(
                            margin: EdgeInsets.only(
                              left: 5,
                            ),
                            child: Text(
                              'Location : ${location}',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}