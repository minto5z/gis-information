import 'package:banbeis/blocs/bloc.dart';
import 'package:banbeis/configs/config.dart';
import 'package:banbeis/models/model.dart';
import 'package:banbeis/utils/utils.dart';
import 'package:banbeis/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  final textLanguageController = TextEditingController();
  List<Locale> listLanguage = AppLanguage.supportLanguage;
  Locale languageSelected = AppBloc.languageCubit.state;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///On login
  Future<void> onLogin() async {
    AppBloc.signCubit.onLogin(
        username: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  ///On Privacy
  void onPrivacy() {
    Navigator.pushNamed(
      context,
      Routes.webView,
      arguments: WebViewModel(
        title: Translate.of(context).translate('privacy'),
        url: "https://saleboltapp.com/privacy-policy.html",
      ),
    );
  }

  ///On filter language
  void onFilter(String text) {
    if (text.isEmpty) {
      setState(() {
        listLanguage = AppLanguage.supportLanguage;
      });
      return;
    }
    setState(() {
      listLanguage = listLanguage.where(((item) {
        return UtilLanguage.getGlobalLanguageName(item.languageCode)
            .toUpperCase()
            .contains(text.toUpperCase());
      })).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<SignCubit, SignState>(
        builder: (context, login) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  height: heightOfScreen * 0.6,
                  width: widthOfScreen,
                  child: _buildHeader(),
                ),
                Container(
                  margin: EdgeInsets.only(top: heightOfScreen * 0.4),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Sizes.RADIUS_24),
                      topRight: Radius.circular(Sizes.RADIUS_24),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpaceH48(),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                            bottom: 8,
                          ),
                          child: AppTextInput(
                            labelText: Translate.of(context).translate('email'),
                            hintText: Translate.of(context).translate('email'),
                            controller: emailController,
                            maxLines: 1,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color(0xFF6360FF),
                            ),
                            onChanged: onFilter,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                            bottom: 8,
                          ),
                          child: AppTextInput(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            obscureText: true,
                            labelText:
                                Translate.of(context).translate('password'),
                            hintText:
                                Translate.of(context).translate('password'),
                            maxLines: 1,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFF6360FF),
                            ),
                            onChanged: onFilter,
                          ),
                        ),

                        // Padding(
                        //     padding: const EdgeInsets.only(left: 14.0,right: 14.0),
                        //     child:  TextField(
                        //       keyboardType: TextInputType.emailAddress,
                        //       decoration: InputDecoration(
                        //           border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(8.0),
                        //             borderSide: BorderSide.none,
                        //           ),
                        //           filled: true,
                        //           fillColor: const Color(0xFFF5F9FF),
                        //           hintText: "E-mail",
                        //           prefixIcon: Icon(
                        //             Icons.email,
                        //             color: const Color(0xFF6360FF),
                        //           )),
                        //     ),
                        // ),

                        SpaceH24(),

                        SizedBox(
                            width: double.infinity,
                            height: 48, // <-- match_parent
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 14.0, right: 14.0),
                                child: AppButton(
                                  Translate.of(context).translate(
                                    'Sign In for Survey Location',
                                  ),
                                  onPressed: onLogin,
                                  loading: login == SignState.signIn,
                                ))),

                        SpaceH16(),

                        SizedBox(
                            width: double.infinity,
                            height: 48, // <-- match_parent
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0, right: 14.0),
                              child: AppButton(
                                Translate.of(context).translate(
                                  'Skip! Find Nearest Institution',
                                ),
                                // icon: Image.asset(
                                //   Images.banbeis,
                                //   width: 24,
                                //   height: 24,
                                // ),
                                type: ButtonType.normal,
                                onPressed: onLogin,
                                //loading: login == SignState.signIn,
                              ),
                            )),

                        SpaceH24(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
            height: heightOfScreen * 0.5,
            width: widthOfScreen,
            child: Image.asset(
              Images.header,
              height: heightOfScreen,
              width: widthOfScreen,
              fit: BoxFit.cover,
            )),
        Container(
          alignment: Alignment.center,
          height: heightOfScreen * 0.5,
          width: widthOfScreen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                Images.launcher,
                height: heightOfScreen * 0.12,
                width: widthOfScreen * 0.20,
                fit: BoxFit.cover,
              ),
              SpaceH8(),
              Text(
                Translate.of(context).translate('language'),
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.white),
              ),
              SpaceH12(),

              //  Translate.of(context).translate('language')
              Text(
                Translate.of(context).translate('dev_mode'),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white),
              ),
              SpaceH44(),
            ],
          ),
        ),
      ],
    );
  }
}
