import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// ----- GLOBALS: COLOURS -----
const Color mainYellow = Color(0xffccff11);
const Color mainTeal = Color(0xffccffee);
const Color mainGray = Color(0xff778087);
const Color secondaryGray = Color(0xFF1C1C1C);
const Color lightGray = Color(0xFF3B3B3B);



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white24, 
                  Colors.white38, 
                  Colors.white54,
                  mainTeal,
                  mainYellow,
                  ]
                )                
              )
            ),
            Align(
              alignment: const Alignment(-0.9, -1.0),
              child: Container(
                width: 300.0,
                height: 300.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                  mainTeal,
                  Colors.white54,
                  mainTeal,
                  ]                    
                  ),
                  color: mainTeal,
                ),
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width *0.8,
                    height: MediaQuery.of(context).size.height *0.8,
                    color: Colors.white30,
                    child: Column(
                      children: [
                        Expanded(child: Row(
                          children: [
                            Expanded(child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nursing Overtime Shouldn't Be An Assumption.",
                                    style: TextStyle(
                                      fontSize: 32.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height: 16.0),
                                  Text(
                                    "Don't let overtime burn you out.",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ), 
                                  ),
                                  // RichText(
                                  //   text: TextSpan(
                                  //     style: DefaultTextStyle.of(context).style,
                                  //     children: <TextSpan>[
                                  //       TextSpan(text: 'Get ', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold,)),
                                  //       TextSpan(text: 'O', style: TextStyle(color: mainGray, fontSize: 20.0, fontWeight: FontWeight.bold,)),
                                  //       TextSpan(text: 'ver', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold,)),
                                  //       TextSpan(text: 'W', style: TextStyle(color: mainGray, fontSize: 20.0, fontWeight: FontWeight.bold,)),
                                  //       TextSpan(text: 'ork', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold,)),
                                  //     ],
                                  //   ),
                                  // ),
                                  Text(
                                    "Get OverWork.",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ), 
                                  ),                                  
                                  SizedBox(height:24.0),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed:  _launchMailto,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                          child: Text(
                                            "Contact Us",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            )),
                                        ),
                                      ),
                                      SizedBox(width: 16.0),
                                      ElevatedButton(
                                        onPressed: null,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                          child: Text(
                                            "Learn More",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]
                              )
                            )),
                            Expanded(
                              child: Container(
                                color: const Color.fromARGB(13, 203, 255, 17), // Background color
                                margin: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage("assets/ow_logo_stealth_no_bg.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                                  ),
                                ),
                              ),
                            ),
                          ]
                        )),
                        //const Spacer(),
                        IconTheme(
                          data: IconThemeData(
                            color: Colors.blueGrey[90],
                            size: 25.0,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: null,
                                color: Colors.grey,
                                icon: const Icon(FontAwesomeIcons.twitter),
                              ),
                              IconButton(
                                onPressed: null,
                                color: Colors.grey,
                                icon: const Icon(FontAwesomeIcons.linkedin),
                              ),
                              IconButton(
                                onPressed: _launchGitHub,
                                icon: const Icon(FontAwesomeIcons.github),
                              ),                            
                            ]
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ),
            ),
          ]
        )
      )   
    );
  }
}


// ----- HELPERS -----
void _launchMailto() async {
  final mailtoUri = Uri(
    scheme: 'mailto',
    path: 'contact@overwork.ai',
  );

  if (await canLaunchUrl(mailtoUri)) {
    try {
      await launchUrl(mailtoUri);
      // print('sending email to $mailtoUri');
    } catch (e) {
      // print('Could not launch $mailtoUri');
    }
  } else {
    // print('Could not launch $mailtoUri');
  }
}

void _launchGitHub() async {
  final Uri url = Uri.parse('https://github.com/overworkAI');
  if (await canLaunchUrl(url)) {
    try {
      await launchUrl(url);
    } catch (e) {
      print('Could not launch $url');
    }
  } else {
    print('Could not launch $url');
  }
}
