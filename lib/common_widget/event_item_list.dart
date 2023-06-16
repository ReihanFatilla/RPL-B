import 'package:flutter/material.dart';
import 'package:rpl_b/data/model/event.dart';
import 'package:rpl_b/ui/event_detail_page.dart';
import 'package:transparent_image/transparent_image.dart';

import '../utils/style_manager.dart';

class EventItemList extends StatelessWidget {
  const EventItemList({
    super.key,
    required this.event,
    required this.index,
    required this.length,
  });

  final Event event;
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            EventDetailPage.routeName,
            arguments: event.title.toLowerCase(),
          );
        },
        child: Padding(
          padding: index != length - 1
              ? EdgeInsets.only(right: 16)
              : EdgeInsets.zero,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 160,
                  width: 120,
                  child: FadeInImage.memoryNetwork(
                    image: event.imageUrl,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (a, b, c) {
                      return Image.asset(
                        "assets/images/gray_place_holder.png",
                        fit: BoxFit.cover,
                      );
                    },
                    placeholder: kTransparentImage,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
                width: 10,
              ),
              Text(
                event.title,
                style: getBlackTextStyle(fontSize: 14),
              )
            ],
          ),
        ));
  }
}
