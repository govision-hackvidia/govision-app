import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:govision/core/core.dart';
import 'package:govision/features/dashboard/dashboard.dart';
import 'package:govision/utils/utils.dart';
import 'package:govision/widgets/widgets.dart';

class RegisterPage extends HookWidget {
  RegisterPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Your Personal Information',
                style: textTheme.headline2SemiBold,
              ),
              24.vertical,
              CustomTextField(
                label: 'Name',
                controller: nameController,
                textInputType: TextInputType.name,
                validator: InputValidator.emptyValidator,
              ),
              16.vertical,
              CustomTextField(
                label: 'Email',
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                validator: InputValidator.emailValidator,
              ),
              16.vertical,
              CustomTextField(
                label: 'Password',
                isPassword: true,
                controller: passwordController,
                textInputType: TextInputType.visiblePassword,
                validator: InputValidator.passwordValidator,
              ),
              16.vertical,
              CustomTextField(
                label: 'Confirm Password',
                isPassword: true,
                controller: confirmPasswordController,
                textInputType: TextInputType.visiblePassword,
                validator: (value) => InputValidator.retypePasswordValidator(
                  value,
                  passwordController.text,
                ),
              ),
              24.vertical,
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    pushAndRemoveUntilTransition(
                      context,
                      const DashboardPage(),
                    );
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
