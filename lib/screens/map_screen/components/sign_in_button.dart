import 'package:flutter/material.dart';
import 'package:flutter_map_002/components/auth_modal/auth_modal.dart';

// importは省略しています
class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            builder: (BuildContext context) {
              return const AuthModal();
            });
      },
      label: const Text('SIGN IN'),
    );
  }
}
