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
              Text("Some characters may not be supported.."),
              //outlined textbox

              SizedBox(height: 80),
              TextFormField(
                controller: _toEncodeController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"""[a-zA-Z0-9.,?!\'/()&:;=+-_" ]"""),
                  ),
                ],
                maxLines: 6,
                minLines: 2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  labelText: 'Enter text to encode',
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  alignment: WrapAlignment.start,
                  spacing: 15,
                  children: [
                    // CircleAvatar(
                    //   child: Icon(Icons.copy),
                    // ),
                    // Chip(
                    //   label: Text("Space"),
                    // ),
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
              if (isEndcodedTextBoxNotEmpty)
                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  controller: _encodedController,
                  maxLines: 5,
                  enabled: false,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
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
                      onPressed: () {
                        final toEncode = _toEncodeController.text;
                        if (toEncode.isNotEmpty) {
                          final encoded = encodeToMorse(toEncode);
                          // encode the text
                          print(encoded);
                          _encodedController.text = encoded;
                        }
                      },
                      child: Text("Encode"),
                    ),
                  ),
                  if (isEndcodedTextBoxNotEmpty)
                    SizedBox(
                      width: width * 0.2,
                      child: FilledButton.icon(
                        onPressed: () async {
                          Clipboard.setData(
                            ClipboardData(text: _encodedController.text),
                          );

                          await Fluttertoast.showToast(
                              msg: "Copied...",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              fontSize: 16.0); // encode the text
                        },
                        label: Icon(Icons.copy),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ));
  }
}
