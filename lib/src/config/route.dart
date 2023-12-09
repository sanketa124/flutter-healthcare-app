import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/screens/welcome/welcome_screen.dart';
import 'package:flutter_healthcare_app/src/model/dactor_model.dart';
import 'package:flutter_healthcare_app/src/pages/detail_page.dart';
import 'package:flutter_healthcare_app/src/pages/home_page.dart';
import 'package:flutter_healthcare_app/screens/auth/sign_in_screen.dart';
import 'package:flutter_healthcare_app/screens/auth/components/sign_in_form.dart';
import 'package:flutter_healthcare_app/screens/auth/components/sign_up_form.dart';
import 'package:flutter_healthcare_app/screens/auth/sign_up_screen.dart';
import 'package:flutter_healthcare_app/src/pages/splash_page.dart';
import 'package:flutter_healthcare_app/src/widgets/coustom_route.dart';

import '../model/data.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => SplashPage(),
      '/HomePage': (_) => HomePage(),
      '/WelcomePage': (_) => WelcomeScreen(),
      '/SignInPage': (_) => SignInScreen(),
      '/SignInFormPage': (_) => SignInForm(formKey: new GlobalKey(),),
      '/SignUpPage': (_) => SignUpScreen(),
      '/SignUpFormPage': (_) => SignUpForm(formKey: new GlobalKey(),),
    };
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    final List<String>? pathElements = settings.name?.split('/');
    if (pathElements?[0] != '' || pathElements?.length == 1) {
      return null;
    }
    switch (pathElements?[1]) {
      case "DetailPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => DetailPage(model: new DoctorModel(name: doctorMapList[0]['name'], type: doctorMapList[0]['type'], description: doctorMapList[0]['description'], rating: doctorMapList[0]['rating'], goodReviews: doctorMapList[0]['goodReviews'], totalScore: doctorMapList[0]['totalScore'], satisfaction: doctorMapList[0]['satisfaction'], isfavourite: doctorMapList[0]['isfavourite'], image: doctorMapList[0]['image']) ), settings: new RouteSettings());
    }
    return null;
  }
}
