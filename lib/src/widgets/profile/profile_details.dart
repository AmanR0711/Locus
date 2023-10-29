import 'package:flutter/material.dart';

import '../../models/locus_user.dart';
// import '../../screens/view_follow_screen.dart';
import 'display_number_button.dart';

class ProfileDetails extends StatelessWidget {
  final LocusUser user;
  const ProfileDetails(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PhysicalModel(
                elevation: 8,
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(64),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  radius: 64,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      user.avatarUrl,
                    ),
                    radius: 60,
                  ),
                ),
              ),
              Text(
                user.name.isEmpty ? "A Locus User" : user.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.grey.shade50),
              ),
              Text(
                user.bioData.isEmpty ? "I am a Locus User" : user.bioData,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey.shade50,
                      fontWeight: FontWeight.w100,
                    ),
              ),
              const SizedBox(height: 8),
              // TODO:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const DisplayNumberButton(
                    0, 
                    "Moments",
                    onTap: null,
                  ),
                  DisplayNumberButton(
                    225,
                    "Followers",
                    onTap: () {},
                  ),
                  DisplayNumberButton(
                    250,
                    "Following",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
