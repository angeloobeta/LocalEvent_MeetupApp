import 'package:flutter/material.dart';
import 'package:local_event_meetup/model/guest.dart';
import 'package:local_event_meetup/styleguide.dart';
import 'package:provider/provider.dart';
import '../../model/event.dart';

class EventDetailContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.width;
    final Event event = Provider.of<Event>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeigth * 0.10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .2),
            child: Text(
              event.title,
              style: eventWhiteTitleTextStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.25),
            child: FittedBox(
              child: Row(
                children: [
                  Text('--',
                      style: eventLocationTextStyle.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w700)),
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Text(event.location,
                      textAlign: TextAlign.end,
                      style: eventLocationTextStyle.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text('Guest', style: guestTextStyle),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final guest in guests)
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ClipOval(
                      child: Image.asset(guest.imagePath,
                          width: 90, height: 90, fit: BoxFit.fill),
                    ),
                  )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: event.punchLine1,
                  style: punchLine1TextStyle,
                ),
                TextSpan(
                  text: event.punchLine2,
                  style: punchLine2TextStyle,
                )
              ]),
            ),
          ),
          if (event.description.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                event.description,
                style: eventLocationTextStyle,
              ),
            ),
          if (event.galleryImages.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Gallery', style: guestTextStyle),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      for (final gallery in event.galleryImages)
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 30),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(gallery,
                                width: 150, height: 150, fit: BoxFit.fill),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
