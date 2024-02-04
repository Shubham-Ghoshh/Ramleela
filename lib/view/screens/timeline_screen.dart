import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ramleela/view/components/constants/colors.dart';
import 'package:ramleela/view/components/constants/image_urls.dart';
import 'package:ramleela/view/components/widgets/time_line_widget.dart';
import 'package:ramleela/view/screens/bhajan_songs_screen.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TimelineScreen> {
  // var w = MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    // Set preferred orientations to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Get screen height
    var h = MediaQuery.of(context).size.height;

    // Build the Scaffold with an AppBar and a ListView of timeline events
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Timeline',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: appBarHeadingColor,
            fontSize: 29,
          ),
        ),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BhajanSongScreen(),
                ),
              );
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.music_note,
                color: appBarHeadingColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),

            // Timeline event widget for Lord Rama's birth
            TimeLineWidget(
              iconData: Icons.brightness_3_rounded,
              isFirst: true,
              isLast: false,
              title: 'Lord Rama birth',
              description: 'Lord Rama was born in Ayodhya.',
              date: 'Treta Yuga',
              height: h * .2,
              url: ramBirthUrl,
            ),

            // Timeline event widget for the construction of the temple
            TimeLineWidget(
              iconData: Icons.build,
              isFirst: false,
              isLast: false,
              title: 'Construction',
              description:
                  'The original construction of the temple is said to have been done by King Vikramaditya.',
              date: 'Ancient Times',
              height: h * .2,
              url: constructionUrl,
            ),

            // Timeline event widget for Gupta era Ayodhya
            TimeLineWidget(
              iconData: Icons.temple_hindu_rounded,
              isFirst: false,
              isLast: false,
              title: 'Gupta era Ayodhya',
              description:
                  'Ayodhya, identified as Saket, became an important trade center during the Gupta era, as described by Chinese traveler Fa Hien.',
              date: '600 CE',
              height: h * .29,
              url: guptaEraAyodhyaUrl,
            ),

            // Timeline event widget for Challenges
            TimeLineWidget(
              iconData: Icons.flag,
              isFirst: false,
              isLast: false,
              title: 'Challenges',
              description:
                  'Despite facing invasions and attacks, Ayodhya\'s Ram Mandir retains its grandeur.',
              date: '14th Century CE',
              height: h * .2,
              url: challengesUrl,
            ),

            // Timeline event widget for Babri Masjid
            TimeLineWidget(
              iconData: Icons.mosque_rounded,
              isFirst: false,
              isLast: false,
              title: 'Babri Masjid',
              description:
                  'Babri Masjid built by Mughal Emperor Babur in Ayodhya.',
              date: '1528',
              height: h * .2,
              url: babriMasjidUrl,
            ),

            TimeLineWidget(
              iconData: Icons.warning,
              isFirst: false,
              isLast: false,
              title: 'Religious Violence',
              description:
                  'First recorded incident of religious violence at the site.',
              date: '1853',
              height: h * .2,
              url: religiousViolenceUrl,
            ),

            // Timeline event widget for Religious Violence
            TimeLineWidget(
              iconData: Icons.dangerous,
              isFirst: false,
              isLast: false,
              title: 'Communal Tensions',
              description:
                  'Following communal tensions, a fence was erected to separate the inner court into two portions - one for Muslims and one for Hindus.',
              date: '1859',
              height: h * .3,
              url: communalTensionUrl,
            ),

            // Timeline event widget for Communal Tensions
            TimeLineWidget(
              iconData: Icons.star,
              isFirst: false,
              isLast: false,
              title: 'Idol Controversy',
              description:
                  'Idols of Lord Rama appeared inside the Babri Masjid. The site becomes a focal point of religious tension.',
              date: '1949',
              height: h * .25,
              url: ramIdolUrl,
            ),

            // Timeline event widget for Idol Controversy
            TimeLineWidget(
              iconData: Icons.gavel,
              isFirst: false,
              isLast: false,
              title: 'Supreme Court Verdict',
              description:
                  'Supreme Court delivers a unanimous verdict, granting the entire disputed land to Hindus for the construction of the Ram Mandir and providing an alternative five-acre site for the construction of a mosque.',
              date: 'November 9, 2019',
              height: h * .4,
              url: supremeCourtUrl,
            ),

            // Timeline event widget for Supreme Court Verdict
            TimeLineWidget(
              iconData: Icons.wb_sunny,
              isFirst: false,
              isLast: false,
              title: 'Bhoomi Pujan Ceremony',
              description:
                  'Bhoomi Pujan for the construction of the Ram Mandir, performed by Narendra Modi, Prime Minister of India.',
              date: 'August 5, 2020',
              height: h * .27,
              url: bhoomiPujanUrl,
            ),

            // Timeline event widget for Prana Pratishtha
            TimeLineWidget(
              iconData: Icons.event,
              isFirst: false,
              isLast: true,
              title: 'Prana Pratishtha',
              description:
                  'Narendra Modi serves as the Mukhya Yajman of rituals for the event and performs the prana pratishtha of the temple.',
              date: 'January 22, 2024',
              height: h * .27,
              url: pranaPratisthaUrl,
            ),
          ],
        ),
      ),
    );
  }
}
