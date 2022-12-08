import '../../data/repositories/auth_repositories_impl.dart';
import '../../domain/usecase/auth.dart';
import '../../custom_widgets/text_field_obscure.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _key = GlobalKey();

  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = false;

  // layout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 221, 243),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Text(
                  'Регистрация',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26),
                ),
                const Spacer(),
                TextFormField(
                  style: const TextStyle(color: Color.fromARGB(255, 56, 56, 83)),
                  maxLength: 30,
                  controller: _lastNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Поле фамилии не должно быть пустое';
                    }
                    if (value.length < 2) {
                      return 'Фамилия не может быть меньше двух символов';
                    }
                    if (!validationFIO(value)) {
                      return 'Фамилия пишется с большой буквы и содержит только кириллицу';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Фамилия',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                 style: const TextStyle(color: Color.fromARGB(255, 56, 56, 83)),
                  maxLength: 30,
                  controller: _firstNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Поле имени не должно быть пустое';
                    }
                    if (value.length < 2) {
                      return 'Имя не может быть меньше двух символов';
                    }
                    if (!validationFIO(value)) {
                      return 'Имя пишется с большой буквы и содержит только кириллицу';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Имя',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Color.fromARGB(255, 56, 56, 83)),
                  maxLength: 30,
                  controller: _middleNameController,
                  validator: (value) {
                    if (value!.isNotEmpty && !validationFIO(value)) {
                      return 'Отчество пишется с большой буквы и содержит только кириллицу';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Отчество (необязательное поле)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Color.fromARGB(255, 56, 56, 83)),
                  maxLength: 15,
                  controller: _loginController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Поле логина не должно быть пустое';
                    }
                    if (value.length < 8) {
                      return 'Логин должен быть более восьми символов';
                    }
                    if (!validationLogin(value)) {
                      return 'Логин должен содержать только латинские символы';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Логин',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle( color: Color.fromARGB(255, 56, 56, 83)),
                  maxLength: 20,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Поле пароля не должно быть пустое';
                    }
                    if (value.length < 8) {
                      return 'Пароль должен быть длинной 8 символов';
                    }
                    if (!validationPassword(value)) {
                      return 'Пароль должен содеражать по одной букве всех регистров и специальный символ';
                    }
                    return null;
                  },
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    hintText: 'Пароль',
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
                    backgroundColor: const Color.fromARGB(255, 160, 150, 219),
                    shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text('Регистрация', style: TextStyle(color: Color.fromARGB(225, 224, 221, 243)),),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      signUp();
                    } else {}
                  },
                ),
                const Spacer(flex: 3),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(15),
                      backgroundColor: const Color.fromARGB(255, 160, 150, 219)
                    ),
                    child: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 224, 221, 243)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // main function of registration

  void signUp() async {
    final AuthRepositoriesImpl auth = AuthRepositoriesImpl();

    var result = await Auth(auth).signUp(RegistrationParams(
        lastName: _lastNameController.text,
        firstName: _firstNameController.text,
        middleName: _middleNameController.text,
        login: _loginController.text,
        password: _passwordController.text));

    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
        ),
      );
    }, (r) {
      Navigator.pop(context);
    });
  }

  // validation functions

  bool validationPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validationFIO(String value) {
    String pattern = r'[А-Я][-а-я]+';
    RegExp regExp = RegExp(pattern);
    String patternDights = r'[0-9]';
    RegExp regExpDights = RegExp(patternDights);
    bool b = !regExpDights.hasMatch(value);
    bool a= regExp.hasMatch(value);
    return a&&b;
  }

  bool validationLogin(String value) {
    String patternAlph = r'[-a-z]+';
    String patternDights = r'[0-9]';
    RegExp regExp = RegExp(patternAlph);
    RegExp regExpDights = RegExp(patternDights);
    bool b = !regExpDights.hasMatch(value);
    bool a = regExp.hasMatch(value);
    return a && b;
  }
}