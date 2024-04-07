// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  TextEditingController _userInput = TextEditingController();
  var height, width;
  static const apiKey = "AIzaSyADNFwjDH0URweDWD96eeYUheF1ZNsQUy0";

  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  final List<Message> _messages = [];

  Future<void> sendMessage() async {
    final message = _userInput.text;

    setState(() {
      _messages
          .add(Message(isUser: true, message: message, date: DateTime.now()));
    });

    final content = [Content.text(message)];
    final response = await model.generateContent(content);

    setState(() {
      _messages.add(Message(
          isUser: false, message: response.text ?? "", date: DateTime.now()));
      _isLoading = false;
    });
  }

  bool _focused = false;
  FocusNode? _node;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _node = FocusNode();
    _node!.addListener(() {
      if (!_node!.hasFocus) {
        setState(() {
          _focused = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _node!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // elevation: 10,
        // shadowColor: Color.fromARGB(255, 33, 32, 28),
        // actions: [Image.asset('assets/chatbot1-removebg-preview.png')],
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        // title: Text(widget.previous_path),
        // iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: height * 0.1,
        // backgroundColor: Colors.black,
        // backgroundColor: Color.fromARGB(255, 33, 32, 28),
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [
                Color.fromARGB(255, 75, 146, 255),
                // Color.fromARGB(255, 60, 113, 194),
                Color.fromARGB(255, 116, 122, 220),
                Color.fromARGB(255, 156, 114, 203),
                Color.fromARGB(255, 185, 107, 159),
                Color.fromARGB(255, 217, 100, 112),
                Color.fromARGB(255, 217, 101, 112),
                // Color.fromARGB(255, 75, 131, 240),
              ],
              // stops: [0.5, 0.9],
              // begin: Alignment.topCenter,
              // end: Alignment.bottomCenter,
            ).createShader(bounds);
          },
          child: Text(
            "AI ASSISTANT",
            style: GoogleFonts.stixTwoText(
              color: Colors.white,
              fontSize: 0.035 * height,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              'assets/icons/aidoc.png',
              height: 40,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return MessageBubble(
                  user: message.isUser,
                  msgText: message.message,
                  msgSender: DateFormat('hh:mm').format(message.date),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8), ///////////////////////////////// imp
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(25),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border.all(color: Colors.grey[200]!),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[400]!,
                          offset: Offset(0, 5),
                          spreadRadius: 2,
                          blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(25)),
                child: TextField(
                  enabled: _isLoading ? false : true,
                  cursorColor: Color.fromARGB(255, 33, 32, 28),
                  cursorHeight: 25,
                  focusNode: _node,
                  onTap: () {
                    setState(() {
                      _focused = true;
                    });
                  },
                  controller: _userInput,
                  style: GoogleFonts.arimo(
                    textStyle:
                        TextStyle(color: Color.fromARGB(255, 33, 32, 28)),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefix: SizedBox(
                      width: 10,
                    ),
                    // contentPadding: EdgeInsets.symmetric(
                    //     vertical: 10), //////////////// height of text field
                    // fillColor: Colors.white,
                    // filled: true,
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //     color: Color.fromARGB(255, 33, 32, 28),
                    //     width: 1,
                    //   ),
                    // ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //     color: Color.fromARGB(255, 33, 32, 28),
                    //     width: 1,
                    //   ),
                    // ),
                    // border: InputBorder.none,

                    hintText: 'Ask me Anything...',
                    hintStyle: GoogleFonts.arimo(
                      textStyle: TextStyle(
                          color: Color.fromARGB(255, 33, 32, 28),
                          fontWeight: FontWeight.w600),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(
                          0.0), /////////////////////////////// icon ki padding
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            // borderRadius: BorderRadius.circular(15),
                            shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_userInput.text != '') {
                                _isLoading = true;
                                sendMessage();
                                _userInput.text = '';
                              }
                            });
                          },
                          // Icons.attach_file,
                          icon: _isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Icon(
                                  Icons.send,
                                  size: 20,
                                ),
                          color: Colors.white,
                          // size: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Spacer(),
          ),
          // _focused
          //     ? SizedBox(
          //         height: 5,
          //       )
          //     : SizedBox(
          //         height: height * 0.07,
          //       ),
        ],
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String message;
  final DateTime date;

  Message({required this.isUser, required this.message, required this.date});
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;

  Messages({
    Key? key,
    required this.isUser,
    required this.message,
    required this.date,
  }) : super(key: key);

  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      // constraints: BoxConstraints(maxWidth: width / 2),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: 15).copyWith(
        left: isUser ? width * 0.2 : 10,
        right: isUser ? 10 : 10,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(1, 1),
          )
        ],
        color: isUser ? Color.fromARGB(255, 33, 32, 28) : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: isUser ? Radius.circular(5) : Radius.zero,
          topRight: Radius.circular(5),
          bottomRight: isUser ? Radius.zero : Radius.circular(5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // !isUser
          //     ? Padding(
          //         padding: const EdgeInsets.only(
          //           right: 3,
          //         ),
          //         child: Image.asset(
          //           'assets/chatbot1-removebg-preview.png', // Adjust with your image path
          //           // width: 20, // Adjust width as needed
          //           height: 30, // Adjust height as needed
          //         ),
          //       )
          //     : Padding(
          //         padding:
          //             EdgeInsets.all(5)), // Add image if user is not the sender
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextSelectionTheme(
                  data: TextSelectionThemeData(
                      // cursorColor: Colors.red,
                      selectionColor: isUser ? Colors.grey : Colors.grey[400]),
                  child: SelectableText(
                    message,
                    // showCursor: true,
                    style: !isUser
                        ? GoogleFonts.arimo(
                            textStyle: TextStyle(
                              color: Color.fromARGB(255, 33, 32, 28),
                              fontSize: 15,
                            ),
                          )
                        : GoogleFonts.arimo(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      date,
                      style: !isUser
                          ? GoogleFonts.robotoSlab(
                              textStyle: TextStyle(
                                color: Color.fromARGB(255, 33, 32, 28),
                                fontSize: 8,
                              ),
                            )
                          : GoogleFonts.arimo(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                            ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String msgText;
  final String msgSender;
  final bool user;
  MessageBubble(
      {required this.msgText, required this.msgSender, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 2, top: 5),
      child: Column(
        crossAxisAlignment:
            user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              topLeft: user ? Radius.circular(50) : Radius.circular(0),
              bottomRight: Radius.circular(50),
              topRight: user ? Radius.circular(0) : Radius.circular(50),
            ),
            color: user ? primaryColor : Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.5,
                ),
                child: Text(
                  msgText,
                  style: TextStyle(
                    color: user ? Colors.white : Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Text(
              msgSender,
              style: TextStyle(
                  fontSize: 11, fontFamily: 'Inter', color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
