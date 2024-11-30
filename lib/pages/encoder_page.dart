import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../shared/encoding_logic.dart';

class EncoderPage extends StatefulWidget {
  const EncoderPage({super.key});

  @override
  State<EncoderPage> createState() => _EncoderPageState();
}

class _EncoderPageState extends State<EncoderPage> {
  final TextEditingController _encodedController = TextEditingController();
  final TextEditingController _toEncodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isEndcodedTextBoxNotEmpty = true;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Encode with Morse...'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              //outlined textbox

              SizedBox(height: 80),
              Text("Decoded text appears below..."),
              Text(_encodedController.text,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
              SizedBox(
                height: 50,
              ),
              Text("Some characters may not be supported ⓘ"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _toEncodeController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"""[a-zA-Z0-9.,?!\'/()&:;=+-_" ]"""),
                  ),
                ],
                maxLines: 6,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  hintText: "Enter text to encode...",
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  alignment: WrapAlignment.start,
                  spacing: 15,
                  children: [
                    InkWell(
                      onTap: () {
                        _toEncodeController.text += '   ';
                      },
                      child: Chip(
                        label: Text("Long Space"),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),

              //sb-50
              SizedBox(
                height: 20,
              ),

              // a button to encode the text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: width * 0.7,
                    child: FilledButton(
                      onPressed: () async {
                        final toEncode = _toEncodeController.text;
                        final toBeEncode = toEncode.trim();
                        if (toBeEncode.isEmpty) {
                          await Fluttertoast.showToast(
                              msg: "Spaces or empty text not allowed",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              fontSize: 16.0); // encode the text
                          return;
                        }
                        if (toBeEncode.isNotEmpty) {
                          final encoded = encodeToMorse(toEncode);
                          _encodedController.text = encoded;
                        }
                      },
                      child: Text("Encode"),
                    ),
                  ),
                  if (isEndcodedTextBoxNotEmpty)
                    SizedBox(
                      width: width * 0.2,
                      child: InkWell(
                        onTap: () async {
                          Clipboard.setData(
                            ClipboardData(text: _encodedController.text),
                          );

                          await Fluttertoast.showToast(
                              msg: "Copied...",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              fontSize: 16.0);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.deepPurple.shade200,
                          child: Icon(Icons.copy),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ));
  }
}
