import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/encoding_logic.dart';

class ChatUI extends StatefulWidget {
  ChatUI({super.key});

  @override
  State<ChatUI> createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> with AutomaticKeepAliveClientMixin {
  final List<MyMessage> messages = [];
  final TextEditingController _controller = TextEditingController();
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Stack(
      children: [
        (messages.isEmpty)
            ? Center(
                child: Text("Enter something to get their morse code.."),
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final thisMessage = messages[index];
                    return Container(
                      width: MediaQuery.of(context).size.width - 10,
                      alignment: thisMessage.isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: thisMessage.isMe
                          ? Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),

                              //margin only right 30
                              margin: const EdgeInsets.only(
                                  left: 30, right: 10, top: 20),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                textAlign: TextAlign.right,
                                messages[index].message,
                                maxLines: 3,
                              ))
                          : InkWell(
                              onLongPress: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Copied to clipboard: ${messages[index].message}"),
                                  ),
                                );
                                Clipboard.setData(
                                  ClipboardData(
                                    text: messages[index].message,
                                  ),
                                );
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  //margin only right 30
                                  margin: const EdgeInsets.only(
                                      bottom: 20, top: 20, left: 10, right: 30),
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    textAlign: TextAlign.right,
                                    messages[index].message,
                                    maxLines: 3,
                                  ))),
                    );
                  },
                ),
              ),
        Positioned(
          bottom: 11,
          child: Container(
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width - 10,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r"""[a-zA-Z0-9.,?!\'/()&:;=+-_" ]"""),
                ),
              ],
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      //scroll to the bottom

                      if (messages.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Long press to copy the morse code..."),
                          ),
                        );
                      }
                      if (_controller.text.isNotEmpty) {
                        messages.add(
                            MyMessage(message: _controller.text, isMe: true));

                        final resp = encodeToMorse(_controller.text);
                        messages.add(MyMessage(message: resp, isMe: false));
                        _controller.clear();
                        if (_scrollController.hasClients) {
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        }

                        setState(() {});
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter some text..."),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.send),
                  ),
                  hintText: "Type text to get morse code..."),
            ),
          ),
        )
      ],
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class MyMessage {
  String message;
  bool isMe;

  MyMessage({required this.message, this.isMe = false});
}
