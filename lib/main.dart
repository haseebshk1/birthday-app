import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const BirthdayApp());
}

class BirthdayApp extends StatelessWidget {
  const BirthdayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Birthday',
      debugShowCheckedModeBanner: false,
      home: const BirthdayScreen(),
    );
  }
}

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playNasheed();
  }

  void _playNasheed() async {
    // Corrected the asset path to 'assets/nasheedki.mp3'
    await _player.play(AssetSource('assets/nasheedki.mp3'));
  }

  // Method to pause audio
  void _pauseAudio() async {
    await _player.pause();
  }

  // Method to stop audio
  void _stopAudio() async {
    await _player.stop();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset('assets/celebration.json',
                  height: 250, repeat: true),
              const SizedBox(height: 10),
              const Text(
                '🎉 Happy Birthday Ninja Eman 🎉',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                '9 August 2025',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              const Text(
                // Corrected Urdu text from the screenshot
                'دعاؤں بھرا یہ دن ہو، روشنیوں سے بھرپور\nاللہ آپ کو دین و دنیا کی کامیابیاں عطا کرے',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    PrayerTile(
                      arabic: 'رَبِّ زِدْنِي عِلْمًا',
                      urdu: 'اے میرے رب! میرے علم میں اضافہ فرما',
                    ),
                    PrayerTile(
                      arabic: 'اللَّهُمَّ بَارِكْ لَهَا',
                      urdu: 'یا اللہ! اس کے لیے برکت عطا فرما',
                    ),
                    PrayerTile(
                      arabic: 'اللهم اجعلها من الصالحين',
                      urdu: 'یا اللہ! اسے نیک لوگوں میں شامل فرما',
                    ),
                    PrayerTile(
                      arabic: 'اللهم ارزقها حبك',
                      urdu: 'یا اللہ! اپنے پیار سے نواز دے',
                    ),
                  ],
                ),
              ),
              // Audio Player Controls for the user to interact with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _playNasheed,
                      child: const Text("Play"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _pauseAudio,
                      child: const Text("Pause"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _stopAudio,
                      child: const Text("Stop"),
                    ),
                  ],
                ),
              ),
              const Text(
                'From Haseeb ✨',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class PrayerTile extends StatelessWidget {
  final String arabic;
  final String urdu;

  const PrayerTile({
    super.key,
    required this.arabic,
    required this.urdu,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(arabic,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal)),
        const SizedBox(height: 4),
        Text(urdu,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
            textAlign: TextAlign.center),
        const SizedBox(height: 12),
      ],
    );
  }
}
