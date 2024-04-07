import 'package:flutter/material.dart';
import 'package:flutter_samples/FITNESS_APP/common/colo_extension.dart';
import 'package:flutter_samples/MENTAL_HEALTH/QuizPage.dart';
import 'package:google_fonts/google_fonts.dart';

class Assessment extends StatefulWidget {
  const Assessment({Key? key}) : super(key: key);

  @override
  State<Assessment> createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  List<String> depression = [
    'Are you having thoughts that you would be better off dead, or of hurting yourself?',
    'Are you having trouble concentrating on things such as reading the newspaper or watching TV?',
    'Are you feeling bad about yourself (ex. feel like a failure or constantly let your family down)?',
    'Do you have a poor appetite or are you overeating?',
    'Are you feeling tired or having little energy?',
    'Are you having trouble falling or staying asleep, or sleeping too much?',
    'Are you feeling down, depressed, or hopeless?',
    'Do you have little interest or pleasure in doing things?'
  ];

  List<String> anxiety = [
    'Are you feeling nervous, anxious, or on edge?',
    'Are you feeling unable to stop or control worrying?',
    'Are you worrying too much about different things?',
    'Are you having trouble relaxing?',
    'Are you so restless that it is hard to sit still?',
    'Are you feeling easily annoyed or irritable?',
    'Are you feeling as if something awful might happen?'
  ];

  List<String> pstd = [
    'Are you having nightmares about a distressing event(s) or thought about the event(s) when you did not want to?',
    'Are you trying hard not to think about a distressing event(s) or went out of your way to avoid situations that reminded you of the event(s)?',
    'Do you feel constantly on guard, watchful, or easily startled?',
    'Do you feel numb or detached from people, activities, or your surroundings?',
    'Do you feel guilty or unable to stop blaming yourself or others for a distressing events(s) or any problems the event(s) may have caused?'
  ];

  List<String> schizophrenia = [
    'Are you experiencing any brain fog?',
    'Are you struggling to remember to eat or drink water?',
    'Are your thoughts jumbled or are you unable to think clearly?',
    "Are you having trouble seeing things or are you seeing things that aren't there?",
    'Do you feel extremely tired?',
    'Are the happy thoughts speeding up your thought process?',
    'Are the sad thoughts slowing down your thought process?',
    'Are you having any grandiose thoughts?'
  ];

  List<String> addiction = [
    'Are you using substances to numb any physical or emotional pain?',
    'Do you feel like you should cut down on your substance use?',
    'Are you feeling guilty about using substances?',
    'Is anyone annoying you by criticizing your substance use?',
    'Do you feel that your substance use significantly decreases your ability to function?',
    'Are you using substances as soon as you wake up in the morning?'
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.07,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
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
            "SELF ASSESSMENT",
            style: GoogleFonts.stixTwoText(
              color: Colors.white,
              fontSize: 0.0325 * height,
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
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height / 3,
                width: 0.90 * width,
                child: Image(
                  image: AssetImage('assets/images/assess.png'),
                ),
              ),
              SizedBox(height: height / 80),
              Text(
                'Choose self assesment test based on following conditions :',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter'
                    // fontStyle: FontStyle.italic,
                    ),
              ),
              SizedBox(height: height / 50),
              H_card_button(
                nextScreen: QuizPage(depression, 8, 'Depression', [
                  Color(0xFF3F2B96).withOpacity(0.7),
                  Color(0xFFA8C0FF),
                ]),
                name: 'Depression',
              ),
              SizedBox(height: height / 60),
              H_card_button(
                nextScreen: QuizPage(anxiety, 7, 'Anxiety and stress', [
                  Color(0xFF3b4ceb).withOpacity(0.8),
                  Color(0xFF959dff).withOpacity(0.8),
                  Color(0xFFfffeff).withOpacity(0.8),
                ]),
                name: 'Anxiety & Stress',
              ),
              SizedBox(height: height / 60),
              H_card_button(
                nextScreen: QuizPage(pstd, 5, 'PTSD', [
                  Color(0xFFfcd033).withOpacity(0.8),
                  Color(0xFFe79fbc).withOpacity(0.8),
                  Color(0xFFf8f3f0).withOpacity(0.8),
                ]),
                name: 'PTSD',
              ),
              SizedBox(height: height / 60),
              H_card_button(
                nextScreen: QuizPage(schizophrenia, 8, 'Schizophrenia', [
                  Color(0xFF205688).withOpacity(0.8),
                  Color(0xFF31a0ff).withOpacity(0.8),
                  Color(0xFFf9ffff).withOpacity(0.8),
                ]),
                name: 'Schizophrenia',
              ),
              SizedBox(height: height / 60),
              H_card_button(
                nextScreen: QuizPage(addiction, 6, 'Addiction', [
                  Color(0xFc67700).withOpacity(0.8),
                  Color(0xFFfcff9e).withOpacity(0.8),
                ]),
                name: 'Addiction',
              ),
              SizedBox(height: height / 60),
            ],
          ),
        ),
      ),
    );
  }
}

class H_card_button extends StatelessWidget {
  H_card_button({
    super.key,
    required this.nextScreen,
    required this.name,
  });

  // final List<String> depression;
  final Widget nextScreen;
  final String name;
  final style = TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins'
      // fontStyle: FontStyle.italic,
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 5,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Center(child: Text(name, style: style)),
          // tileColor: Colors.grey[100],
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  colors: [TColor.primaryColor2, TColor.primaryColor1])
              // side: BorderSide(color: Colors.black, width: 1),
              ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextScreen));
        },
      ),
    );
  }
}
