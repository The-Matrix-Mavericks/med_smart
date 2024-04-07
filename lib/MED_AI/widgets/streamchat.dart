import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_samples/FITNESS_APP/common/colo_extension.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:intl/date_symbols.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class SectionTextStreamInput extends StatefulWidget {
  const SectionTextStreamInput({super.key});

  @override
  State<SectionTextStreamInput> createState() => _SectionTextInputStreamState();
}

class _SectionTextInputStreamState extends State<SectionTextStreamInput> {
  // final ImagePicker picker = ImagePicker();

  final controller = TextEditingController();
  final gemini = Gemini.instance;
  String? searchedText,
      // result,
      _finishReason;

  List<Uint8List>? images;

  String? get finishReason => _finishReason;

  set finishReason(String? set) {
    if (set != _finishReason) {
      setState(() => _finishReason = set);
    }
  }

  // Questions
  final List<String> questions = [
    'Tell me about the main reason you\'re here today. What symptoms are you experiencing?',
    'When did these symptoms first start? Have they been constant or come and go?',
    'Can you describe the symptoms in more detail? Are there any specific triggers that make them worse or better?',
    'Have you experienced any other symptoms alongside this main one?',
    'Do you have any pre-existing medical conditions?',
    'Are you taking any medications currently?',
    'Do you ever feel dizzy or lightheaded?',
    'Have you recently made any significant lifestyle changes, like diet or exercise?',
    'Is there anything else you feel is important for me to know about your health?',
  ];

  List<TextEditingController> _controllers = [
    for (int i = 0; i < 10; i++) TextEditingController()
  ];
  // Index to keep track of Stringent question
  int _currentQuestionIndex = 0;

  // Responses for each question
  String response0 = '';
  String response1 = '';
  String response2 = '';
  String response3 = '';
  String response4 = '';
  String response5 = '';
  String response6 = '';
  String response7 = '';
  String response8 = '';

  // Responses for each question
  final List<String?> responses = List.filled(10, null);

  String _heartrelated() {
    return '''
          Your are an expert doctor with all knowledge of all fields and you own a medical clinic. A patient comes to your clinic and you have to diagnose him/her
          You have given some details on the person's condition give your feedback on the 
          analysis for the provided Question and Answer with that patient :-
          Question 1 : Tell me about the main reason you're here today. What symptoms are you experiencing?,
          Answer 1 : ${response0}
          Question 2 : When did these symptoms first start? Have they been constant or come and go?,
          Answer 2 : ${response1}
          Question 3 : Can you describe the symptoms in more detail? Are there any specific triggers that make them worse or better?,
          Answer 3 : ${response2}
          Question 4 : Have you experienced any other symptoms alongside this main one?,
          Answer 4 : ${response3} 
          Question 5 : Do you have any pre-existing medical conditions?,
          Answer 5 : ${response4}
          Question 6 : Are you taking any medications currently?,
          Answer 6 : ${response5}
          Question 7 : Do you have a family history of any relevant conditions?,
          Answer 7 : ${response6}
          Question 8 : Have you recently made any significant lifestyle changes, like diet or exercise?,
          Answer 8 : ${response7}
          Question 9 : Is there anything else you feel is important for me to know about your health?,
          Answer 9 : ${response8}
          Based on these questions and answers give your feedback in given format:
          ### What is the Risk For Now?

          ### Precaution Needed

          ### Abstinence in food
            ''';
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchTextController = TextEditingController();

    return Column(
      children: [
        Card(
          color: Colors.white,
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * .31,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      TColor.primaryColor2.withOpacity(0.6),
                      TColor.primaryColor1.withOpacity(0.6),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12)),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    questions[_currentQuestionIndex],
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _controllers[_currentQuestionIndex],
                    onChanged: (value) {
                      switch (_currentQuestionIndex) {
                        case 0:
                          response0 = value;
                          break;
                        case 1:
                          response1 = value;
                          break;
                        case 2:
                          response2 = value;
                          break;
                        case 3:
                          response3 = value;
                          break;
                        case 4:
                          response4 = value;
                          break;
                        case 5:
                          response5 = value;
                          break;
                        case 6:
                          response6 = value;
                          break;
                        case 7:
                          response7 = value;
                          break;
                        case 8:
                          response8 = value;
                          break;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type your response here',
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      _currentQuestionIndex == questions.length - 1
                          ? 'Done'
                          : 'Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ).onTap(() {
                    // WidgetsBinding.instance
                    //     .addPostFrameCallback((_) => controller.clear());
                    _controllers[_currentQuestionIndex].clear();
                    // Check if it's the last question
                    if (_currentQuestionIndex == questions.length - 1) {
                      // Save responses
                      // For demonstration purposes, logging the responses
                      String searchText = searchTextController.text;
                      // if (searchText.isNotEmpty) {
                      gemini
                          .streamGenerateContent(_heartrelated(),
                              images: images)
                          .listen((value) {
                        setState(() {
                          images = null;
                        });
                        if (value.finishReason != 'STOP') {
                          finishReason = 'Finish reason is `RECITATION`';
                        }
                      }).onError((e) {
                        log('streamGenerateContent error', error: e);
                      });
                    } else {
                      // Move to the next question
                      setState(() {
                        _currentQuestionIndex++;
                      });
                    }
                  }),
                ],
              ),
            ),
          ),
        ),

        Expanded(
          child: GeminiResponseTypeView(
            builder: (context, child, response, loading) {
              if (loading) {
                return Center(
                  child: Lottie.asset('assets/loading.json'),
                );
              }

              if (response != null) {
                return Markdown(
                  controller: ScrollController(),
                  data: response,
                  selectable: true,
                );
              } else {
                return const Center(child: Text(''));
              }
            },
          ),
        ),

        if (finishReason != null) Text(finishReason!),

        // Button named "Done"
        // GestureDetector(
        //   onTap: () {
        //     String searchText = searchTextController.text;
        //     // if (searchText.isNotEmpty) {
        //     gemini
        //         .streamGenerateContent(_heartrelated(), images: images)
        //         .listen((value) {
        //       setState(() {
        //         images = null;
        //       });
        //       if (value.finishReason != 'STOP') {
        //         finishReason = 'Finish reason is `RECITATION`';
        //       }
        //     }).onError((e) {
        //       log('streamGenerateContent error', error: e);
        //     });
        //     // }
        //   },
        //   child: Container(
        //     padding: EdgeInsets.all(10),
        //     decoration: BoxDecoration(
        //         color: primaryColor, borderRadius: BorderRadius.circular(15)),
        //     child: Text(
        //       'Done',
        //       style: TextStyle(
        //         fontSize: 20,
        //         fontFamily: 'Poppins',
        //         fontWeight: FontWeight.w500,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
