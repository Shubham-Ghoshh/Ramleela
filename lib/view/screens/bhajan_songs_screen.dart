import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ramleela/view/components/constants/colors.dart';

class BhajanSongScreen extends StatefulWidget {
  const BhajanSongScreen({super.key});

  @override
  State<BhajanSongScreen> createState() => _BhajanSongScreenState();
}

class _BhajanSongScreenState extends State<BhajanSongScreen> {
  // Initialize AudioPlayer for playing audio
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Declare state variables
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  // Declare lists for song details
  final List<String> songUrls = [
    "audio/mere_ghar_ram_ayenge.mp3",
    "audio/ram_ayenge.mp3",
    "audio/ram_siya_ram.mp3",
  ];

  final List<String> songNames = [
    "Mere Ghar Ram Aaye Hain",
    "Ram Ayenge",
    "Ram Siya Ram",
  ];

  final List<String> artistNames = [
    "Jubian Nautiyal, Payel Dev",
    "Payal Dev, Vishal Mishra, Manoj Muntashir",
    "Sachet Tondon",
  ];

  final List<String> songThumbnails = [
    'https://imgs.search.brave.com/T_m3J-FpDa3fg9vFBz7837wwyfHBdzYfuClTM0LceDQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzdlL2E0/LzNmLzdlYTQzZjdl/ODc3ODk2YTc5MTg2/MjQwNjBmMTk5MGE5/LmpwZw',
    'https://i.pinimg.com/236x/f0/22/7c/f0227c810f6aa9f73f73e2b7117e4cfb.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPAidG6SGmxYKBsygotkbDIEIadWH2wWiP6g',
  ];

  // Initialize current index to track the current song
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadAudio();

    // Listen for player state changes
    _audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    // Listen for duration changes
    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // Listen for position changes
    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  // Function to play/pause the audio
  void _playPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      if (isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }
    }
  }

  // Function to play the next song
  void _playNext() async {
    if (currentIndex < songUrls.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    await _loadAudio();
    await _audioPlayer.resume();
  }

  // Function to play the previous song
  void _playPrevious() async {
    if (currentIndex > 0) {
      currentIndex--;
    } else {
      currentIndex = songUrls.length - 1;
    }
    await _loadAudio();
    await _audioPlayer.resume();
  }

  // Function to load audio for the current song
  Future<void> _loadAudio() async {
    await _audioPlayer.setSourceAsset(songUrls[currentIndex]);
  }

  // Function to format time duration
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text(
          "Bhajans",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: appBarHeadingColor,
            fontSize: 29,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                viewportFraction: 1.0,
                onPageChanged: (index, _) {
                  setState(() {
                    currentIndex = index;
                    _loadAudio();
                    position = Duration.zero;
                  });
                },
              ),
              items: songUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          songThumbnails[currentIndex],
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Text(
              songNames[currentIndex],
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 26,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'by ${artistNames[currentIndex]}',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: Colors.black38,
              ),
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await _audioPlayer.seek(position);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)),
                  Text(formatTime(duration - position)),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                    icon: const Icon(Icons.skip_previous),
                    iconSize: 32,
                    onPressed: _playPrevious,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    iconSize: 40,
                    onPressed: _playPause,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                    icon: const Icon(Icons.skip_next),
                    iconSize: 32,
                    onPressed: _playNext,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
