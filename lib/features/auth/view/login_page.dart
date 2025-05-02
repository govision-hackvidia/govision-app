import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:govision/core/core.dart';
import 'package:govision/features/auth/auth.dart';
import 'package:govision/features/dashboard/dashboard.dart';
import 'package:govision/utils/utils.dart';
import 'package:govision/widgets/widgets.dart';

class LoginPage extends HookWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome!',
                        style: textTheme.display2Bold,
                      ),
                      8.vertical,
                      Text(
                        'Log In to Your Account',
                        style: textTheme.body2Regular.copyWith(
                          color: colors.secondaryGray,
                        ),
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            print('awjwjjw');
                            pushTransition(
                              context,
                              ForgotPasswordPage(),
                            );
                          },
                          borderRadius: BorderRadius.circular(4),
                          child: Text(
                            'Forgot Password?',
                            style: textTheme.body1Regular.copyWith(
                              color: colors.primary,
                            ),
                          ),
                        ),
                      ),
                      24.vertical,
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            pushAndRemoveUntilTransition(
                              context,
                              const DashboardPage(),
                            );
                          }
                        },
                        child: const Text('Log In'),
                      ),
                      24.vertical,
                      InkWell(
                        onTap: () {
                          pushTransition(
                            context,
                            RegisterPage(),
                          );
                        },
                        borderRadius: BorderRadius.circular(4),
                        child: Text(
                          'Create Account',
                          style: textTheme.body1Bold.copyWith(
                            color: colors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
