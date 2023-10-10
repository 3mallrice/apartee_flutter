import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import '../../core/const/color_const.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBar(
        backgroundColor: ColorPalette.bgColor,
        title: const Text(
          'Message',
          style: TextStyle(color: ColorPalette.textColor, fontSize: 25),
        ),
        elevation: 3, //create the shadow for app bar
        automaticallyImplyLeading: false,
        // bottom: ,
      ),

      body: ListView.builder(
        itemCount: upcomingMessages.length,
        itemBuilder: (context, index) {
          final message = upcomingMessages[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(message.title),
              subtitle: Text(message.date),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Xử lý khi bấm vào một yêu cầu
                // Ví dụ: điều hướng đến trang chi tiết yêu cầu
              },
            ),
          );
        },
      ),
    );
  }
}

class UpcomingMessage {
  final String title;
  final String date;

  UpcomingMessage(this.title, this.date);
}

List<UpcomingMessage> upcomingMessages = [
  UpcomingMessage('Yêu cầu số 1', '10/10/2023'),
  UpcomingMessage('Yêu cầu số 2', '15/10/2023'),
  UpcomingMessage('Yêu cầu số 3', '20/10/2023'),
  // Thêm các yêu cầu khác vào đây
];
