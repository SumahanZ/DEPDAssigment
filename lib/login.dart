import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //dapat value dari sini
  List inputTexts = [];
  @override
  void initState() {
    super.initState();
  }

  //setiap widget yang dipake harus ada controllernya untuk melakukan validasi
  //dan mengambil value dari field tersebut
  final controllerEmail = TextEditingController();
  final controllerName = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerCity = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String inputName = "";
  String inputEmail = "";
  String inputPhone = "";
  String inputCity = "";
  bool isHide = true;

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerName.dispose();
    controllerPhone.dispose();
    controllerCity.dispose();
    super.dispose();
  }

  //for validating if phone number is numeric or not
  //if int.tryparse value is a string it will return null
  bool isNumeric(String value) {
    return (int.tryParse(value) == null) ? false : true;
  }

  void disposeshowAlertDialogSuccess(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Booking Confirmation"),
      content: Text(
          "Name: $inputName\nEmail: $inputEmail\nPhone: $inputPhone\nCity: $inputCity"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void disposeshowAlertDialogFailure(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Booking Confirmation"),
      content: Text("Please fill all form field!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              //Key untuk mengecek jika semua field sudah tervalidasi dan terisi
              key: _formKey,
              child: Column(
                //singlescrollview
                children: <Widget>[
                  const SizedBox(height: 64),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Full Name",
                      prefixIcon: Icon(Icons.people),
                    ),
                    controller: controllerName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return (value.toString().length <= 6)
                          ? "Your name must be at least 6 characters"
                          : null;
                    },
                  ),
                  const SizedBox(height: 64),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email Address",
                      prefixIcon: Icon(Icons.email),
                    ),
                    //controller is used if you want put text in different fields
                    controller: controllerEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return !EmailValidator.validate(value!)
                          ? "Your email is not valid"
                          : null;
                    },
                  ),
                  const SizedBox(height: 64),
                  TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Phone Number",
                      prefixIcon: Icon(Icons.phone_android),
                    ),
                    controller: controllerPhone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return (!isNumeric(value.toString()))
                          ? "Your Phone Number must be numeric"
                          : null;
                    },
                  ),
                  const SizedBox(height: 64),
                  TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "City",
                      prefixIcon: Icon(Icons.location_city),
                    ),
                    controller: controllerCity,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return (value.toString().length < 4)
                          ? "Your City Location must be at least 8 characters"
                          : null;
                    },
                  ),
                  const SizedBox(height: 64),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text("Book Now"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        inputName = controllerName.text;
                        inputEmail = controllerEmail.text;
                        inputPhone = controllerPhone.text.toString();
                        inputCity = controllerCity.text.toString();
                        disposeshowAlertDialogSuccess(context);
                      } else {
                        disposeshowAlertDialogFailure(context);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
