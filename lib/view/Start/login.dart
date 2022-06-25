import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen02/controllers/auth_controller.dart';

import '../Home/home_page.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authControllerState = ref.watch(authControllerProvider);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "ログイン手法",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "匿名ログイン",
                              style: TextStyle(fontSize: 30),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () async {
                                if (authControllerState == null) {
                                  ref
                                      .read(authControllerProvider.notifier)
                                      .appStarted();
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const HomePage())));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.yellow,
                                onPrimary: Colors.black,
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text("ログイン"),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
