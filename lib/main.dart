import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import './pages/about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final vaker = new Faker();
    return MaterialApp(
  home: Builder(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Contact App'),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Chat(
              imageUrl: "https://picsum.photos/id/$index/200/300",
              title: vaker.person.name(),
              subtitle: vaker.lorem.sentence(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AboutPage(),
              ),
            );
          },
          child: const Icon(Icons.arrow_right),
        ),
      );
    },
  ),
);

  }
}

class Chat extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const Chat({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: CircleAvatar(
        // backgroundImage: AssetImage("images/tes.png"),
        backgroundImage: NetworkImage(imageUrl),
        radius: 24,
      ),
      trailing: Text("10.00 AM"),
    );
  }
}
