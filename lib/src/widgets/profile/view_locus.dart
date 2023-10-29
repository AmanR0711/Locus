import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/moment.dart';
import '../home/locus_image_with_caption_post.dart';
import '../home/locus_text_only_post.dart';

class ViewLocusScreen extends StatefulWidget {
  final List<Moment> moments;
  const ViewLocusScreen(this.moments, {super.key});

  @override
  State<ViewLocusScreen> createState() => _ViewLocusScreenState();
}

class _ViewLocusScreenState extends State<ViewLocusScreen> {
  @override
  Widget build(BuildContext context) {
    var fromDateTime = DateTime.now().subtract(const Duration(days: 1));
    var toDateTime = DateTime.now();
    final markers = <Marker>{};
    for (var m in widget.moments) {
      markers.add(
        Marker(
          markerId: MarkerId(m.momentId),
          draggable: false,
          infoWindow: InfoWindow(
            title: m.title,
            snippet: m.content.content,
          ),
          position: LatLng(m.location.latitude, m.location.longitude),
          visible: true,
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: double.infinity,
              height: 48,
              child: Center(
                child: Text(
                  "View Locus",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.grey.shade50,
                      ),
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                final range = await showDateRangePicker(
                  useRootNavigator: true,
                  context: context,
                  firstDate: fromDateTime,
                  lastDate: toDateTime,
                );
                if (range != null) {
                  setState(() {
                    fromDateTime = range.start;
                    toDateTime = range.end;
                  });
                }
              },
              leading: Text(fromDateTime.toIso8601String().substring(0, 9)),
              trailing: Text(toDateTime.toIso8601String().substring(0, 9)),
              title: const Text(
                textAlign: TextAlign.center,
                "to",
              ),
              titleAlignment: ListTileTitleAlignment.center,
            ),
            SizedBox(
              height: 400,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: markers.last.position,
                ),
                markers: markers,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.moments.length,
                itemBuilder: (c, i) {
                  final m = widget.moments[i];
                  if (m.content.url == null) {
                    return LocusTextOnlyPost(
                      context: c,
                      moment: m,
                    );
                  } else {
                    return LocusImageWithCaptionPost(
                      context: c,
                      moment: m,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}