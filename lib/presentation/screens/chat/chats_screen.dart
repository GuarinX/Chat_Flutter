import 'package:chat_connect_2/domain/entities/message.dart';
import 'package:chat_connect_2/presentation/providers/chat_provider.dart';
import 'package:chat_connect_2/presentation/widgets/chat/her_message_bubble.dart';
import 'package:chat_connect_2/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat_connect_2/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://gestion.pe/resizer/bsSVpnxhj-ZDODsXtvCqaRJLkL4=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/NXYKEHDEBBAP3IOKMHGY5O3PZ4.jpg'),
          ),
        ),
        title: const Text('Cristiano Ronaldo', style: TextStyle(fontSize: 18),),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
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
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message,);
                    })),

            // caja de texto
                MessageFieldBox(
                  onValue: chatProvider.sendMessage,
                ),
          ],
        ),
      ),
    );
  }
}
