import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/moment/moment.dart';
import '../models/moment.dart';
import '../widgets/moment/comment_modal.dart';
import '../widgets/moment/locus_post_content.dart';

class MomentScreen extends StatefulWidget {
  final Moment moment;
  const MomentScreen(this.moment, {super.key});

  @override
  State<MomentScreen> createState() => _MomentScreenState();
}

class _MomentScreenState extends State<MomentScreen> {
  @override
  Widget build(BuildContext context) {
    final momentBloc = MomentBloc(context.read(), widget.moment.momentId);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Moment"),
      ),
      body: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey.shade50,
                        ),
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          widget.moment.creator.avatarUrl,
                        ),
                      ),
                      title: Text("${widget.moment.creator.username} posted"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey.shade50,
                        ),
                      ),
                    ),
                    child: LocusPostContent(widget.moment.content),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey.shade50,
                        ),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.person_pin),
                      title: Text(
                        widget.moment.location.place,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlocBuilder<MomentBloc, MomentState>(
                            bloc: momentBloc,
                            builder: (c, s) {
                              return IconButton(
                                icon: Icon(
                                  s is LikedMomentState
                                      ? Icons.thumb_up
                                      : Icons.thumb_up_alt_outlined,
                                ),
                                onPressed: () => momentBloc.add(
                                  ToggleLikeMomentEvent(
                                    widget.moment.momentId,
                                    widget.moment.creator.username,
                                  ),
                                ),
                              );
                            }),
                        IconButton(
                          icon: const Icon(Icons.forum_outlined),
                          onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (c) => Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CommentModal(widget.moment.comments),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Google Map
          SizedBox(
            height: 400,
            child: GoogleMap(
              zoomGesturesEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.moment.location.latitude,
                  widget.moment.location.longitude,
                ),
              ),
              markers: {
                Marker(
                  markerId: MarkerId(widget.moment.momentId),
                  position: LatLng(
                    widget.moment.location.latitude,
                    widget.moment.location.longitude,
                  ),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
