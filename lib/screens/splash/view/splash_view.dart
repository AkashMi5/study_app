import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/routes.dart';
import 'package:study_app/screens/splash/bloc/splash_bloc.dart';
import 'package:study_app/screens/splash/bloc/splash_event.dart';
import 'package:study_app/screens/splash/bloc/splash_state.dart';
import 'package:study_app/utils/helper_functions.dart';
import 'package:study_app/widgets/snackbar.dart';
import 'package:study_app/widgets/try_again_button.dart';
import 'package:flutter/services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    //  SystemChrome.setEnabledSystemUIMode(SystemUiMode.);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setDeviceOrientationPortraitOnly();
    return Scaffold(
      body: Material(
        child: BlocProvider<SplashBloc>(
            create: (BuildContext context) =>
                SplashBloc()..add(SplashLoadingEvent()),
            child: BlocListener<SplashBloc, SplashState>(
              listener: (context, state) {
                if (state is SplashNavigateToOtherScreenState) {
                  if (state.isUserLoggedin) {
                    Navigator.of(context).pushReplacementNamed(Routes.home);
                  } else {
                    Navigator.of(context).pushReplacementNamed(Routes.home);
                  }
                } else if (state is SplashErrorState) {
                  CustomSnackBar.showSnackBar(context, state.errorMessage);
                }
              },
              child: BlocBuilder<SplashBloc, SplashState>(
                builder: (BuildContext context, SplashState state) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/splash_image.webp',
                                // color: Colors.yellowAccent,
                                height: 190,
                                width: 190,
                              ),
                              const SizedBox(height: 40),
                              if (state is SplashLoadingState)
                                const CircularProgressIndicator(
                                    color: Colors.yellowAccent)
                              else if (state is SplashErrorState)
                                TryAgainButton(
                                    onButtonPress: () =>
                                        BlocProvider.of<SplashBloc>(context)
                                          ..add(SplashLoadingEvent()))
                            ],
                          ),
                        ),
                        const Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                            child: Text(
                              "MentorMind Assignment",
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NunitoSans",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )),
      ),
    );
  }
}
