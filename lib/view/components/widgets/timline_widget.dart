import 'package:flutter/material.dart';
import 'package:ramleela/view/components/constants/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineWidget extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final double height;
  final String url;
  final bool isFirst;
  final bool isLast;
  final IconData iconData;
  const TimeLineWidget({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.height,
    required this.url,
    required this.isFirst,
    required this.isLast,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: const LineStyle(
        color: primaryColor,
      ),
      indicatorStyle: IndicatorStyle(
        width: 40,
        color: primaryColor,
        iconStyle: IconStyle(
          iconData: iconData,
          color: Colors.white,
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                date,
                style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Colors.black38),
              ),
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.only(bottom: 30),
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      height: height,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            url,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: ListTile(
                      title: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 12.0, bottom: 20),
                            child: Text(
                              description,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
