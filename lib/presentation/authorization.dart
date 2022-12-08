import '../../app_route.dart';
import '../../data/repositories/auth_repositories_impl.dart';
import '../../domain/entity/role_entity.dart';
import '../../domain/usecase/auth.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/text_field_obscure.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // checkers

  bool isObscure = true;
  bool _isValid = true;

  // layout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 221, 243),
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(child: SizedBox()),
                const Text(
                  'Твой, а может и не твой, дом',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      color: Color.fromARGB(255, 56, 56, 83)),
                ),
                const Expanded(child: SizedBox()),
                TextFormField(
                  controller: _loginController,
                  validator: (value) {
                    if (!_isValid) {
                      return null;
                    }
                    if (value!.isEmpty) {
                      return 'Введите логин';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Логин',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (!_isValid) {
                      return null;
                    }
                    if (value!.isEmpty) {
                      return 'Введите пароль';
                    }
                    return null;
                  },
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    suffixIcon: TextFieldObscure(isObscure: (value) {
                      setState(() {
                        isObscure = value;
                      });
                    }),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 50),
                      backgroundColor: const Color.fromARGB(255, 160, 150, 219),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    _isValid = true;
                    if (_key.currentState!.validate()) {
                      signIn();
                    } else {}
                  },
                  child: const Text(
                    'Войти',
                    style: TextStyle(color: Color.fromARGB(255, 224, 221, 243)),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      
                        fixedSize: const Size(150, 40),
                        backgroundColor: const Color.fromARGB(255, 160, 150, 219),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      _loginController.clear();
                      _passwordController.clear();
                      _isValid = false;
                      _key.currentState!.validate();
                      Navigator.pushNamed(context, signUpScreen);
                    },
                    
                    child: const Text(
                      'Регистрация',
                      style: TextStyle(color: Color.fromARGB(255, 224, 221, 243)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // main function of authorization

  void signIn() async {
    final AuthRepositoriesImpl auth = AuthRepositoriesImpl();
    var result = await Auth(auth).signIn(AuthParams(
      login: _loginController.text,
      password: _passwordController.text,
    ));
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
        ),
      );
    }, (r) {
      switch (r) {
        case RoleEnum.admin:
          {
            Navigator.pushNamed(context, adminNameMainPage);
//print('admin');
            break;
          }
        case RoleEnum.user:
          Navigator.pushNamed(context, clientNameMainPage);
//print('client');
          break;
      }
    });
  }
}