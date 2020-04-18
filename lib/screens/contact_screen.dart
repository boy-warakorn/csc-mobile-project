import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = '/contactUs';

  Widget buildContactBlock(String text, FaIcon icon) {
    return Center(
      child: Container(
        height: 50,
        width: 250,
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 5),
            icon,
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                child: FittedBox(
                  child: InkWell(
                    onTap:
                        text == ': sit.kmutt.ac.th' || text == ': 02-470-8000'
                            ? text == ': sit.kmutt.ac.th'
                                ? () => launch('https://www.sit.kmutt.ac.th/')
                                : () => launch("tel://024708000")
                            : () => {},
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 20,
                        color: text == ': sit.kmutt.ac.th'
                            ? Colors.blue
                            : Colors.white,
                        decoration: text == ': sit.kmutt.ac.th'
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationStyle: TextDecorationStyle.double,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.orange,
              Colors.orange.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('Contact us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(120),
                bottomRight: Radius.circular(120),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/kmuttTem.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            buildContactBlock(': SIT KMUTT', FaIcon(FontAwesomeIcons.facebook)),
            SizedBox(
              height: 15,
            ),
            buildContactBlock(': @regiskmutt', FaIcon(FontAwesomeIcons.line)),
            SizedBox(
              height: 15,
            ),
            buildContactBlock(
                ': sit.kmutt.ac.th', FaIcon(FontAwesomeIcons.globeAsia)),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 15,
                  ),
                  width: 100.0,
                  height: 100.0,
                  child: new RawMaterialButton(
                    shape: new CircleBorder(),
                    fillColor: Colors.orange[500],
                    elevation: 5.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.phoneVolume,
                          size: 35,
                          color: Colors.white,
                        ),
                        Text(
                          'Call us',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () => launch("tel://024708000"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            // buildContactBlock(': 02-470-8000', FaIcon(FontAwesomeIcons.phone)),
            // SizedBox(
            //   height: 17,
            // ),
            // Container(
            //   height: 220,
            //   child: Image.asset('assets/images/test.png'),
            // )
          ],
        ),
      ),
    );
  }
}
