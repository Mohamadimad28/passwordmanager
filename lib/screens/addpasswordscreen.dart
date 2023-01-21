import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:passwordmanager/models/addpassdropdownmodel.dart';
import 'package:passwordmanager/provider/passprovider.dart';
import 'package:passwordmanager/screens/main_screen.dart';
import 'package:passwordmanager/widget/text_filed_widget.dart';
import 'package:provider/provider.dart';

class AddPasswordScreen extends StatefulWidget {
  const AddPasswordScreen({Key? key}) : super(key: key);

  @override
  State<AddPasswordScreen> createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  bool obscureText = true;
  String? selectedPassId;
  List<TypePass> typePassword = <TypePass>[
    TypePass(id: 1, name: "Socials"),
    TypePass(id: 2, name: "Apps"),
    TypePass(id: 3, name: "Cards"),
    TypePass(id: 4, name: "Others"),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 804),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Consumer<PasswordProvider>(
            builder: (context, provider, widget) {
              return Scaffold(
                backgroundColor: const Color(0xFFFAF8FC),
                appBar: AppBar(
                  backgroundColor: const Color(0xFFFFFFFF),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const MainScreen();
                        }));
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: const Color(0xFF180E25),
                        size: 30.sp,
                      )),
                  title: Text(
                    'Add Password',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF180E25),
                    ),
                  ),
                  centerTitle: true,
                  elevation: 0,
                  actions: [
                    IconButton(
                        onPressed: () {
                          provider.addNewPass();
                        },
                        icon: Icon(
                          Icons.done,
                          color: const Color(0xFF2F8883),
                          size: 35.sp,
                        )),
                  ],
                ),
                body: Form(
                  key: provider.fromKey,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20)
                            .w,
                    child: ListView(
                      children: [
                        Container(
                          width: 350.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20).r,
                            color: const Color(0xFFFFFFFF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                                elevation: 0,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF035F59),
                                ),
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                iconSize: 35,
                                iconDisabledColor: const Color(0XFF180E25),
                                iconEnabledColor: const Color(0XFF180E25),
                                hint: const Text('Select'),
                                value: selectedPassId,
                                items:
                                    typePassword.map((TypePass typePassword) {
                                  return DropdownMenuItem<String>(
                                    value: typePassword.id.toString(),
                                    child: Text(typePassword.name),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  if (value != null) {
                                    setState(() {
                                      selectedPassId = value;
                                    });
                                  }
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFieldWidget(
                          provider.passNameController,
                          'Add Name',
                          TextInputType.name,
                          const Icon(
                            Icons.person,
                            color: Color(0xFF2F8883),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFieldWidget(
                          provider.passEmailController,
                          'Add Email',
                          TextInputType.emailAddress,
                          const Icon(
                            Icons.email,
                            color: Color(0xFF2F8883),
                          ),
                        ),

                        SizedBox(
                          height: 10.h,
                        ),
                        TextFieldWidget(
                          provider. passUrlImageController,
                          'Add Url Image',
                          TextInputType.url,
                          const Icon(
                            Icons.link,
                            color: Color(0xFF2F8883),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFieldWidget(
                            provider.passPasswordController,
                            'Add Password',
                            TextInputType.visiblePassword,
                            const Icon(
                              Icons.lock,
                              color: Color(0xFF2F8883),
                            ),
                            obscureText,
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xFF2F8883),
                              ),
                            )),

                        SizedBox(
                          height: 10.h,
                        ),
                        TextFieldWidget(
                          provider.passNoteController,
                          'Add Note',
                          TextInputType.text,
                          const Icon(
                            Icons.note,
                            color: Color(0xFF2F8883),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
