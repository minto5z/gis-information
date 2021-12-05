import 'package:banbeis/configs/config.dart';
import 'package:banbeis/widgets/spaces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurveyLocation extends StatefulWidget {
  const SurveyLocation({Key? key}) : super(key: key);

  @override
  _SurveyLocationState createState() {
    return _SurveyLocationState();
  }
}

class _SurveyLocationState extends State<SurveyLocation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///On navigation
  void onNavigate(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: surveyLocationView(),
    );
  }

  Widget surveyLocationView() {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Container(
          height: heightOfScreen * 0.3,
          width: widthOfScreen,
          color: const Color(0xff01579B),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 30, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        onNavigate(Routes.home);
                      }, // Handle your callback
                      child: const SizedBox(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'Survey Location',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.add_alert_rounded,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Column(
                  children: <Widget>[
                    SpaceH16(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: heightOfScreen * 0.7,
          width: widthOfScreen,
          color: const Color(0xff01579B),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.white, Colors.white])),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: Container(
                    height: 60,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Name',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Email',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Type something about yourself',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Phone number',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
