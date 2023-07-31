
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class StatusMessageBuilder extends StatefulWidget {
  const StatusMessageBuilder({
    super.key,
  });

  @override
  State<StatusMessageBuilder> createState() => _StatusMessageBuilderState();
}

class _StatusMessageBuilderState extends State<StatusMessageBuilder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.status == Status.authenticating) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.5),
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (authProvider.status == Status.error) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Error', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24)),
                  const SizedBox(height: 16.0),
                  Text(authProvider.error ?? 'Unknown error', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16)),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {
                      authProvider.reset();
                    },
                    child: const Text('Try again', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
