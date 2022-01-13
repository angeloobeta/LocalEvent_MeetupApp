import 'package:local_event_meetup/styleguide.dart';
import 'package:provider/provider.dart';
import '../../model/event.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  const EventWidget({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Image.asset(event.imagePath, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(event.title, style: eventTitleTextStyle),
                        SizedBox(height: 5),
                        FittedBox(
                          child: Row(
                            children: [
                              Icon(Icons.location_on),
                              Text(event.location,
                                  textAlign: TextAlign.end,
                                  style: eventLocationTextStyle)
                            ],
                          ),
                        )
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(
                      event.duration.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: eventLocationTextStyle.copyWith(
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
