import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/event.dart';
import '../event_detail/event_details_background.dart';
import '../event_detail/event_details_content.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;
  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(
        value: event,
        child: Stack(
          children: [
            EventDetailBackground(),
            EventDetailContent(),
          ],
        ),
      ),
    );
  }
}
