import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import './animations.dart';
import './../pages/index/index.dart';

class PageTemplate extends StatelessWidget {
  final String endText;
  final IconButton leadingButton;
  final Widget body;

  PageTemplate({
    @required this.endText,
    @required this.leadingButton,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            color: Color.fromRGBO(70, 70, 70, 1),
            hoverColor: Colors.red,
            child: Row(
              children: <Widget>[
                FadeIn(
                  duration: Duration(milliseconds: 700),
                  start: -130,
                  stop: 0,
                  delay: 4.5,
                  child: Text(
                    "Matthew",
                    style: GoogleFonts.abel(
                      fontSize: 25,
                      letterSpacing: 5,
                    ),
                  ),
                ),
                FadeIn(
                  duration: Duration(milliseconds: 700),
                  start: -100,
                  stop: 0,
                  delay: 4.0,
                  child: Text(
                    " / ",
                    style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 5,
                      color: Colors.red,
                    ),
                  ),
                ),
                FadeIn(
                  duration: Duration(milliseconds: 700),
                  start: -100,
                  stop: 0,
                  delay: 3.5,
                  child: Text(
                    "Gleich",
                    style: GoogleFonts.abel(
                      fontSize: 25,
                      letterSpacing: 5,
                    ),
                  ),
                ),
                FadeIn(
                  duration: Duration(milliseconds: 700),
                  start: -100,
                  stop: 0,
                  delay: 3,
                  child: Text(
                    endText,
                    style: GoogleFonts.abel(
                      fontSize: 25,
                      letterSpacing: 5,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 10.0,
        actions: <Widget>[
          SocialMediaIcon(
              MdiIcons.twitter, "https://twitter.com/GleichMatthew"),
          SocialMediaIcon(MdiIcons.instagram,
              "https://www.instagram.com/gleichphotography/"),
          SocialMediaIcon(MdiIcons.linkedinBox,
              "https://www.linkedin.com/in/matthew-gleich-636618178/"),
          SocialMediaIcon(
              MdiIcons.githubCircle, "https://github.com/Matt-Gleich"),
          SocialMediaIcon(
              MdiIcons.docker, "https://hub.docker.com/u/mattgleich"),
          SocialMediaIcon(
              MdiIcons.strava, "https://www.strava.com/athletes/30124266"),
        ],
        leading: leadingButton,
      ),
      body: body,
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  final String linkURL;
  final icon;

  SocialMediaIcon(this.icon, this.linkURL);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.red,
      ),
      splashColor: Colors.black,
      hoverColor: Colors.white,
      onPressed: () async {
        if (await canLaunch(linkURL)) {
          await launch(linkURL);
        } else {
          throw "Could not launch $linkURL";
        }
      },
    );
  }
}
