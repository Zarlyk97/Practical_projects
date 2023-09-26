import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_exemple/feature/domain/model/model.dart';
import 'package:form_exemple/feature/presentation/home/second_page.dart';
import 'package:form_exemple/feature/presentation/widgets/text_form_button.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<RegisterFormPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final lifeStoryController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  String? _selectedValue;

  List<String> listOfValue = [
    'Kyrgyzstan',
    'Rossia',
    'Korea',
    'Kazaxstan',
  ];

  FocusNode namefocus = FocusNode();
  FocusNode phoneNumberfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();
  @override
  void initState() {
    super.initState();

    namefocus = FocusNode();
    phoneNumberfocus = FocusNode();
    passwordfocus = FocusNode();
  }

  @override
  void dispose() {
    phoneMaskFormatter.clear();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    lifeStoryController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    namefocus.dispose();
    phoneNumberfocus.dispose();
    passwordfocus.dispose();

    super.dispose();
  }

  final UserModel userModel = UserModel(
    name: 'name',
    story: 'story',
    phone: 'phone',
    email: 'email',
    country: 'country',
  );

  bool hidepass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Register Form',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                children: [
                  TextFormButton(
                    onFieldSubmitted: (p0) => namefocus.requestFocus(),
                    focusNode: namefocus,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is requared';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.name,
                    inputFormatters: [phoneMaskFormatter],
                    controller: nameController,
                    icon: const Icon(Icons.person),
                    text: 'Full Name',
                    hintext: 'What do people call you',
                    suffixicon: IconButton(
                      onPressed: () {
                        nameController.clear();
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    maxLines: 1,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    obscureText: false,
                    onSaved: (value) {
                      userModel.name = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormButton(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is requared';
                      } else {
                        return null;
                      }
                    },
                    maxLines: 1,
                    controller: phoneController,
                    icon: const Icon(Icons.call),
                    text: 'Phone Number',
                    hintext: 'Where can we reach you',
                    helptext: 'Phone format: (xxx)xxxxxxxx',
                    suffixicon: IconButton(
                      onPressed: () {
                        phoneController.clear();
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    obscureText: false,
                    onSaved: (value) {
                      userModel.phone = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormButton(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is requared';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    border: const UnderlineInputBorder(),
                    icon: const Icon(Icons.email),
                    text: "Email address",
                    maxLines: 1,
                    obscureText: false,
                    onSaved: (value) {
                      userModel.email = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    value: _selectedValue,
                    decoration: const InputDecoration(
                      labelText: 'Country?',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.map),
                    ),
                    items: listOfValue.map((String val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                        userModel.country = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormButton(
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    controller: lifeStoryController,
                    text: 'Life Story',
                    hintext: 'Tell us about your self',
                    helptext: 'Keep it short this is just a demo',
                    maxLines: 3,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    obscureText: false,
                    onSaved: (value) {
                      userModel.story = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormButton(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    border: const UnderlineInputBorder(),
                    icon: const Icon(Icons.security),
                    suffixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidepass = !hidepass;
                          });
                        },
                        icon: Icon(hidepass
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    maxLines: 1,
                    maxLength: 8,
                    text: "password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is requared';
                      } else {
                        return null;
                      }
                    },
                    obscureText: hidepass,
                    onSaved: (value) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormButton(
                    maxLength: 8,
                    controller: confirmController,
                    border: const UnderlineInputBorder(),
                    icon: const Icon(Icons.border_color),
                    maxLines: 1,
                    text: "Confirm  Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is requared';
                      } else {
                        return null;
                      }
                    },
                    obscureText: false,
                    onSaved: (value) {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 40,
                    width: 370,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();

                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.black,
                                  content: Text('A SnackBar has been shown.'),
                                ),
                              );
                            }
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                    'Сиздин катталуңуз илгиликтүү өттү'),
                                content: const Text('AlertDialog description'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Артка кайтуу'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SecondPage(
                                          userinfo: userModel,
                                        ),
                                      ),
                                    ),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Submit Form',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
