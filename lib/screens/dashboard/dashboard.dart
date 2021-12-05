import 'package:banbeis/configs/config.dart';
import 'package:banbeis/utils/utils.dart';
import 'package:banbeis/widgets/widget.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() {
    return _DashBoardState();
  }
}

class _DashBoardState extends State<DashBoard> {
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
      appBar: AppBar(
        backgroundColor: const Color(0xff01579B),
        elevation: 0.0,
        title: Text(
          Translate.of(context).translate('dashboard'),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text(Translate.of(context).translate('home')),
              onTap: () {
                onNavigate(Routes.home);
              },
            ),
            ListTile(
              title: Text(Translate.of(context).translate('account')),
              onTap: () {
                onNavigate(Routes.manageAccount);
              },
            ),
          ],
        ),
      ),
      body: dashBoardView(),
    );
  }

  Widget dashBoardView() {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Container(
          height: heightOfScreen * 0.2,
          width: widthOfScreen,
          color: const Color(0xff01579B),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 50, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SpaceH8(),
                    Text(
                      Translate.of(context).translate('welcome'),
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                    SpaceH8(),
                    Text(
                      Translate.of(context).translate('name'),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                    SpaceH4(),
                    Text(
                      Translate.of(context).translate('address'),
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: heightOfScreen * 0.6,
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
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Translate.of(context).translate('service_status'),
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.normal,
                            color: AppColors.black),
                      ),
                      SpaceH16(),
                      GridView.count(
                        primary: false,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              onNavigate(Routes.surveyLocation);
                            }, // Handle your callback
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xff01579B),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  Translate.of(context).translate('geo_eiin'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {}, // Handle your callback
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xff1BB55C),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  Translate.of(context)
                                      .translate('geo_eiin_new'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {}, // Handle your callback
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFBB12),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  Translate.of(context)
                                      .translate('nearest_institute'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {}, // Handle your callback
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xff01579B),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  Translate.of(context)
                                      .translate('previous_location'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.white),
                                ),
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
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: MaterialButton(
            onPressed: () => {},
            child: Text(
              Translate.of(context).translate('copy'),
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.bold, color: AppColors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
