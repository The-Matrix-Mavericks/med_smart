import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get/get.dart';

class AvatarMaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttermoji Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Fluttermoji'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Use your Fluttermoji anywhere\nwith the below widget",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          FluttermojiCircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 100,
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "and create your own page to customize them using our widgets",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Spacer(flex: 2),
              Expanded(
                flex: 3,
                child: Container(
                  height: 35,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.edit),
                    label: const Text("Customize"),
                    onPressed: () => Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => const NewPage())),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Maker",
            style: TextStyle(
                fontSize: 24, fontFamily: 'Poppins', color: primaryColor)),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: FluttermojiSaveWidget(
              onTap: () => Get.back(),
              child: Icon(Icons.check, color: Colors.green[300], size: 30),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: FluttermojiCircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey[200],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: FluttermojiCustomizer(
                  scaffoldWidth: min(600, _width * 0.85),
                  autosave: false,
                  theme: FluttermojiThemeData(
                    selectedIconColor: primaryColor,
                    selectedTileDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: primaryColor, width: 2.5)),
                    iconColor: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: GestureDetector(
      //   onTap: () => Get.back(),
      //   child: FluttermojiSaveWidget(
      //     child: Padding(
      //       padding: const EdgeInsets.all(0.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(0),
      //           color: primaryColor,
      //         ),
      //         height: 60.0,
      //         child: Center(
      //           child: Text(
      //             "Save",
      //             style: TextStyle(
      //                 fontSize: 20, color: Colors.white, fontFamily: 'Poppins'),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
