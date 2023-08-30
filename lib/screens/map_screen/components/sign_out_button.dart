import 'package:flutter/material.dart';
import 'package:flutter_map_002/components/auth_modal/components/app_loading.dart';

// importは省略しています
class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: isLoading ? const AppLoading() : const Icon(Icons.logout),
    );
  }
}
