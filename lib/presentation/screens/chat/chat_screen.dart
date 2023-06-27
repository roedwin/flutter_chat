import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

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
      body: _chatView(),
    );
  }
}

class _chatView extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {

    

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  
                  return ( message.fromWho == FromWho.hers ) ? HerMessageBubble(answer: message ,) : MyMessageBubble(message: message);

                },
              )
            ),
            //Caja de texto
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}