import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:govision/core/core.dart';
import 'package:govision/features/auth/auth.dart';
import 'package:govision/features/dashboard/dashboard.dart';
import 'package:govision/utils/utils.dart';
import 'package:govision/widgets/widgets.dart';

class ForgotPasswordPage extends HookWidget {
  ForgotPasswordPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
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
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter Your Email',
                          style: textTheme.headline2Bold,
                        ),
                      ),
                      12.vertical,
                      Text(
                        'Enter your account email to change your password',
                        style: textTheme.body2Regular.copyWith(
                          color: colors.secondaryGray,
                        ),
                      ),
                      24.vertical,
                      CustomTextField(
                        label: 'Email',
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        validator: InputValidator.emailValidator,
                      ),
                      56.vertical,
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            pushAndRemoveUntilTransition(
                              context,
                              LoginPage(),
                            );
                          }
                        },
                        child: const Text('Send'),
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
