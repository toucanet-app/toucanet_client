import 'package:flutter/material.dart';
import 'package:toucanet/app/pages/messages/dialog_page/dialog_page.dart';
import 'package:toucanet/data/objects/message/conversation.dart';

import '../../../../styles/app_colors.dart';
import '../../../../styles/indents.dart';

import 'dialog_text.dart';
import 'dialog_title.dart';
import 'user_avatar.dart';

class DialogWidget extends StatefulWidget {
  final Conversation conversation;

  const DialogWidget({Key key, this.conversation}) : super(key: key);
  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DialogPage(conversation : widget.conversation) )),
        child: Padding(
          padding: const EdgeInsets.only(bottom: Indents.medium, top: Indents.medium),
          child: Container(
            height: 80,
            color: AppColors.mainColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               // UserAvatar(url : widget.conversation.avatarUrl),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[700], width: .5))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            DialogTitle(
                                text:
                                    'asd '),
                            //DialogText(text: widget.conversation.lastMessage.text),
                            Expanded(
                              child: Container(),
                            )
                          ],
                        ))),
              ],
            ),
          ),
        ));
  }
}
