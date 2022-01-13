import 'package:flutter/material.dart';
import 'package:local_event_meetup/model/event.dart';
import 'package:local_event_meetup/ui/home_page/event_widget.dart';
import 'package:provider/provider.dart';
import 'package:local_event_meetup/model/category.dart';
import 'package:local_event_meetup/styleguide.dart';
import '../../app_state.dart';
import '../event_detail/events_details_page.dart';
import './home_page_background.dart';
import './category_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (BuildContext context) => AppState(),
        child: SafeArea(
          child: Stack(
            children: [
              HomePageBackground(
                screenHeight: MediaQuery.of(context).size.height,
              ),
              SingleChildScrollView(
                // Revove this guy
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('LOCAL EVENTS', style: fadedTextStyle),
                          const Icon(
                            Icons.person_outline,
                            color: Color(0x99FFFFFF),
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'What\'s Up',
                        style: whiteHeadingTextStyle,
                      ),
                    ),
                    Consumer<AppState>(
                      builder: (BuildContext context, appState, _) =>
                          SingleChildScrollView(
                        padding: EdgeInsets.all(20),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (final category in categories)
                              CategoryWidget(category: category)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Consumer<AppState>(
                        builder: (BuildContext context, appState, Widget) =>
                            Column(
                          children: [
                            for (final event in events.where((e) => e
                                .categoryIds
                                .contains(appState.selectedCategoryId)))
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EventDetailsPage(
                                                    event: event)));
                                  },
                                  child: EventWidget(event: event))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
