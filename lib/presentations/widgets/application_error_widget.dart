import 'package:flutter/material.dart';

class ApplicationError extends StatelessWidget {
  const ApplicationError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          size: 50,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(height: 24),
        Text(
          'Something went wrong, check again later.',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        )
      ],
    );
  }
}
