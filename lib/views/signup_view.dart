import 'package:exclusive_details_and_restorations/const/text.dart';
import 'package:exclusive_details_and_restorations/models/api_service.dart';
import 'package:exclusive_details_and_restorations/models/customer_model.dart';
import 'package:exclusive_details_and_restorations/views/widgets/form_helper.dart';
import 'package:flutter/material.dart';

class signUpView extends StatefulWidget {
  const signUpView({super.key});

  @override
  State<signUpView> createState() => _signUpViewState();
}

class _signUpViewState extends State<signUpView> {
  late APIService apiService;
  late CustomerModel model;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidepassword = true;
  bool isAPIcallprocess = false;

  @override
  void initState() {
    apiService = APIService();
    model = CustomerModel(email: '', firstName: '', lastName: '', password: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromRGBO(0, 40, 70, 100),
            Colors.red.shade900,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 40, 70, 100),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromRGBO(0, 40, 70, 100),
          title: const CustomText(
            text: "Sign up",
            color: Colors.white,
          ),
          actions: [
            SizedBox(
              width: 100,
              child: Image.asset("assets/images/exclusive-details-rename.png"),
            )
          ],
        ),
        body: Column(
          children: [
            Form(
              key: globalKey,
              child: _formUI(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHelper.fieldLabel("First Name"),
                FormHelper.textInput(context, model.firstName,
                    (value) => {this.model.firstName = value},
                    onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return "Please enter first name";
                  }
                  return null;
                }),
                FormHelper.fieldLabel("Last Name"),
                FormHelper.textInput(context, model.lastName,
                    (value) => {this.model.lastName = value},
                    onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return "Please enter last name";
                  }
                  return null;
                }),
                FormHelper.fieldLabel("Email"),
                FormHelper.textInput(
                    context, model.email, (value) => {this.model.email = value},
                    onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return "Please enter email address";
                  }
                  return null;
                }),
                FormHelper.fieldLabel("Password"),
                FormHelper.textInput(
                  context,
                  model.password,
                  (value) => {this.model.password = value},
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return "Please enter Password";
                    }
                    return null;
                  },
                  obscureText: hidepassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidepassword = !hidepassword;
                      });
                    },
                    color: Colors.red.shade800,
                    icon: Icon(
                        hidepassword ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: FormHelper.saveButton("Register", () {
                    if (validateandSave()) {
                      print(model.toJson());
                      setState(() {
                        isAPIcallprocess = true;
                      });

                      apiService.createCustomer(model).then(
                        (ret) {
                          setState(() {
                            isAPIcallprocess = false;
                          });

                          if (ret) {
                            FormHelper.showMessage(
                                context,
                                "Woocommerce App",
                                "Registration Successful",
                                "Ok",
                                () => Navigator.of(context).pop);
                          } else {
                            FormHelper.showMessage(context, "Woocommerce App",
                                "Email Already in use.", "Ok", () {
                              Navigator.of(context).pop();
                            });
                          }
                        },
                      );
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateandSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
