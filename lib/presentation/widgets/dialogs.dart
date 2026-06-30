import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String? message;

  const LoadingDialog({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onPressed;

  const ErrorDialog({
    Key? key,
    required this.title,
    required this.message,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: onPressed ?? () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onPressed;

  const SuccessDialog({
    Key? key,
    required this.title,
    required this.message,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: onPressed ?? () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
