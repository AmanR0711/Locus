import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late bool usernameVal;
  late bool nameVal;
  late bool locationVal;
  late List<Widget> items1, items2;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    usernameVal = false;
    nameVal = false;
    locationVal = false;
    tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 250),
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final query = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kBottomNavigationBarHeight * 2),
        child: AppBar(
          title: const Text("Search"),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight * 1.2),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                onTap: () => showSearch(
                  context: context,
                  delegate: LocusSearchDelegate(),
                  query: query,
                ),
                side: MaterialStateProperty.resolveWith(
                  (_) => BorderSide(width: 2, color: Colors.grey.shade600),
                ),
                shape: MaterialStateProperty.resolveWith(
                  (_) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                hintText: "Search for users/locations...",
                controller: TextEditingController()..text = query,
                backgroundColor: MaterialStateProperty.resolveWith(
                  (_) => Colors.grey.shade50,
                ),
                textStyle: MaterialStateProperty.resolveWith(
                  (_) => TextStyle(
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15),
              ),
            ),
            child: TabBar(
              controller: tabController,
              indicator: const BoxDecoration(borderRadius: BorderRadius.zero),
              indicatorColor: Theme.of(context).colorScheme.secondary,
              labelColor: Theme.of(context).colorScheme.secondary,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Aleo',
              ),
              tabs: const [
                Tab(text: "Users"),
                Tab(text: "Locations"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (c, i) => items1[i],
                  itemCount: items1.length,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (c, i) => items2[i],
                  itemCount: items2.length,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LocusSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () => query = "",
          icon: const Icon(Icons.close),
        ),
      ];

  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          titleSpacing: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          fillColor: Theme.of(context).colorScheme.tertiary,
          filled: true,
          // TODO: Find a way to make search text be Colors.grey.shade50, can't seem to at the moment
        ),
        searchBarTheme: SearchBarThemeData(
          backgroundColor: MaterialStateProperty.resolveWith(
            (_) => Colors.grey.shade50,
          ),
          shape: MaterialStateProperty.resolveWith(
            (_) => RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade600, width: 2),
            ),
          ),
        ),
        searchViewTheme: SearchViewThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade600, width: 2),
          ),
          side: BorderSide(color: Colors.grey.shade600, width: 2),
        ),
      );

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(
            context,
            query.trim().isEmpty
                ? null
                : query), // Navigator.pop(context, query.trim().isEmpty ? null : query),
        icon: const Icon(Icons.arrow_back_outlined),
      );

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (c, i) => ListTile(
        title: Text("Result $i"),
        onTap: () => close(context, "Result $i"),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (c, i) => ListTile(
        title: Text("Suggestion $i"),
        onTap: () => query = "Suggestion $i",
      ),
    );
  }
}
