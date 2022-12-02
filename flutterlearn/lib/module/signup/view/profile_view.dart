import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String name, email, phone;
  const ProfileScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.phone});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: Container(
        color: const Color.fromARGB(255, 227, 212, 212),
        child: getData(),
      ),
    );
  }

  Widget getData() {
    return ListView(
      children: [
        const Text(
          "User Details",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Name : ${widget.name}",
          style: const TextStyle(
              fontSize: 20, decorationStyle: TextDecorationStyle.dashed),
        ),
        Text(
          "Email : ${widget.email}",
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          "Phone : ${widget.phone}",
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
