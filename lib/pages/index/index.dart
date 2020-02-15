import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/socialMedia.dart';
import './widgets/logo.dart';
import './widgets/pageButton.dart';
import './../languages/languages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Matthew / Gleich",
          style: GoogleFonts.abel(
            fontSize: 25,
            letterSpacing: 5,
          ),
        ),
        titleSpacing: 50,
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
      ),
      body: Center(
        child: MediaQuery.of(context).size.width < 1313
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 75,
                      bottom: 75,
                    ),
                    child: Logo(),
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 250),
                    child: Logo(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: PageButton(
                      route: Languages(),
                      pageName: "Languages",
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
