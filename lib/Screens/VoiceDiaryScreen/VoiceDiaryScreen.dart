import 'package:app/Screens/CommonComponents/AppBar/AppBarPicker.dart';
import 'package:app/Screens/CommonComponents/BottomNavigationBar/CustomBottomNavigationBar.dart';
import 'package:app/Screens/CommonComponents/Drawer/CustomDrawer.dart';
import 'package:app/Screens/VoiceDiaryScreen/speechApi/speech_api.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class VoiceDiaryScreen extends StatefulWidget {
  // const VoiceDiaryScreen({Key? key}) : super(key: key);

  @override
  _VoiceDiaryScreenState createState() => _VoiceDiaryScreenState();
}

class _VoiceDiaryScreenState extends State<VoiceDiaryScreen> {
  String text = 'Press the button to start recording';
  bool isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBarPicker(0, "Voice Diary"),
      drawer: CustomDrawer(),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            padding: const EdgeInsets.all(30).copyWith(bottom: 150),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        endRadius: 100.0,
        showTwoGlows: true,
        glowColor: Theme.of(context).primaryColor,
        child: FloatingActionButton(
          child: Icon(
            isListening ? Icons.mic : Icons.mic_none,
            size: 36,
          ),
          onPressed: toggleRecording,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(1),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
      onResult: (text) => setState(() => this.text = text),
      onListening: (isListening) {
        setState(() => this.isListening = isListening);

        if (!isListening) {
          Future.delayed(Duration(seconds: 3), () {});
        }
      });
}
