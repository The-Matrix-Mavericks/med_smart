import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_samples/MED_AI/widgets/streamchat.dart';
import 'package:google_fonts/google_fonts.dart';

// void main() {
//   Gemini.init(
//       apiKey: 'AIzaSyAfQbcjOLvntaFuqdmq4uz360RyL8QHFqg', enableDebugging: true);
//   runApp(const MedAI());
// }

// class MedAI extends StatelessWidget {
//   const MedAI({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FlutterDoc',
//       themeMode: ThemeMode.dark,
//       debugShowCheckedModeBanner: false,
//       darkTheme: ThemeData.dark(
//         useMaterial3: true,
//       ).copyWith(
//           colorScheme:
//               ColorScheme.fromSeed(seedColor: Colors.greenAccent.shade200),
//           cardTheme: CardTheme(color: Colors.indigoAccent.shade700)),
//       home: const MedAIHomePage(),
//     );
//   }
// }

class SectionItem {
  final int index;
  final String title;
  final Widget widget;

  SectionItem(this.index, this.title, this.widget);
}

class MedAIHomePage extends StatefulWidget {
  const MedAIHomePage({super.key});

  @override
  State<MedAIHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MedAIHomePage> {
  int _selectedItem = 0;

  final _sections = <SectionItem>[
    SectionItem(0, 'Stream text', const SectionTextStreamInput()),
  ];
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.1,
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
            "AI DOC",
            style: GoogleFonts.stixTwoText(
              color: Colors.white,
              fontSize: 0.035 * height,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        // actions: [
        //   PopupMenuButton<int>(
        //     initialValue: _selectedItem,
        //     onSelected: (value) => setState(() => _selectedItem = value),
        //     itemBuilder: (context) => _sections.map((e) {
        //       return PopupMenuItem<int>(value: e.index, child: Text(e.title));
        //     }).toList(),
        //     child: const Icon(Icons.more_vert_rounded),
        //   )
        // ],
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
      body: IndexedStack(
        index: _selectedItem,
        children: _sections.map((e) => e.widget).toList(),
      ),
    );
  }
}
