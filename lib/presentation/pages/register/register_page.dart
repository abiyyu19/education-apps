import 'package:education_app/presentation/widgets/custom_appbar.dart';
import 'package:education_app/presentation/widgets/custom_buttom.dart';
import 'package:education_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          const CustomAppbar(title: 'Register Page', isBackButtonVisible: true),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 25,
              ),
              textFormFieldWidget('Name'),
              textFormFieldWidget('Email'),
              textFormFieldWidget('Password'),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Consumer<AppProvider>(
                    builder: (context, checkBox, _) => Checkbox(
                      value: checkBox.isChecked,
                      onChanged: (value) {
                        context.read<AppProvider>().changeIsChecked(value!);
                      },
                    ),
                  ),
                  const Text(
                    "Remember",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  const Text(
                    "Lorem Ipsum?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {},
                size: 28,
                isLight: false,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Lorem Ipsum dolor sit amet?",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const Text(
                "New Password",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textFormFieldWidget(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      keyboardType: TextInputType.text,
      controller: _nameController,
    );
  }
}
