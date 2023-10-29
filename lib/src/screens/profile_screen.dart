import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/locus_user.dart';
import '../widgets/profile/profile_details.dart';
import '../widgets/profile/profile_options_sliver_delegate.dart';
import '../widgets/profile/view_locus.dart';

class ProfileScreen extends StatefulWidget {
  final LocusUser user;
  const ProfileScreen(this.user, {super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 450),
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View ${widget.user.username}"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocBuilder<MomentsBloc, MomentsState>(
        builder: (c, s) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: ProfileDetails(widget.user)),
              SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: ProfileOptionsSliverDelegate(tabController),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (c, i) => moments[i],
                      itemCount: moments.length,
                    ),
                    // TODO: Map View
                    ViewLocusScreen(),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
