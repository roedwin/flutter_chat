import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://media.licdn.com/dms/image/C4E03AQHb-Rc3C5FRGQ/profile-displayphoto-shrink_800_800/0/1659400362079?e=1691625600&v=beta&t=DX-eNpitcopTtNQmtKoGDYeKrp7dLXvbvV_SbQKgVws'),
          ),
        ),
        title: const Text('Mi amor ❤️'),
      ),
    );
  }
}