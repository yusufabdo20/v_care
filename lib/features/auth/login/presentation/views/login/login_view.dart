import 'package:flutter/material.dart';
import 'package:v_care/features/auth/login/presentation/views/login/widgets/email_and_pass.dart' show EmailAndPassword;

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const EmailAndPassword(), 
            
          ],
        ),
      ),
    );
  }
}
