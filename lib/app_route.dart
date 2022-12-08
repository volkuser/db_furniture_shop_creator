import 'package:flutter/material.dart';
import '../../presentation/admin/admin_main_page.dart';
import '../../presentation/client/client_main_page.dart';
import '../../presentation/authorization.dart';
import '../../presentation/registration.dart';

const String signInScreen='SignIn';
const String signUpScreen='SignUp';
const String adminNameMainPage='AdminPage';
const String clientNameMainPage='ClientPage';

class AppRouter{
  Route<dynamic>?generateRouter(RouteSettings settings)
  {
    switch(settings.name){
      case signInScreen:{
        return MaterialPageRoute(builder: (_) => const SignIn()); // login
      }
      case signUpScreen:{
        return MaterialPageRoute(builder: (_) => const SignUp()); // registration
      }
      case adminNameMainPage:{
        return MaterialPageRoute(builder: (_) => const AdminMainPage()); // admin page
      }
      case clientNameMainPage:{
        return MaterialPageRoute(builder: (_) => const ClientMainPage()); // client page
      }
    }
    return null;
  }
}