import 'package:flutter/material.dart';
import 'package:flutter_lesson_3/utils/login/login_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final loginService = LoginRepo();
  void _logout() async {
    final bool? isLoggedOut = await loginService.logout();
    if (isLoggedOut!) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
