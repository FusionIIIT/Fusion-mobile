import 'package:flutter/material.dart';

// Assuming you have a model class for drafted files
class DraftFileData {
  final String id;
  final String name;
  final String description;
  // No need for createdAt since we won't display it

  DraftFileData({
    required this.id,
    required this.name,
    required this.description,
  });
}

class DraftsPage extends StatefulWidget {
  @override
  _DraftsPageState createState() => _DraftsPageState();
}

class _DraftsPageState extends State<DraftsPage> {
  // Replace with your actual logic to fetch draft files
  Future<List<DraftFileData>> _fetchDrafts() async {
    // Simulate data fetching (replace with your API call or service)
    return [
      DraftFileData(
        id: "draft1",
        name: "Important Document",
        description: "Draft for meeting agenda",
      ),
      DraftFileData(
        id: "draft2",
        name: "Personal Notes",
        description: "Unpublished thoughts and ideas",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drafts'),
      ),
      body: FutureBuilder<List<DraftFileData>>(
        future: _fetchDrafts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final drafts = snapshot.data!;
            return ListView.builder(
              itemCount: drafts.length,
              itemBuilder: (context, index) {
                final draft = drafts[index];
                return ListTile(
                  title: Text(draft.name),
                  subtitle: Text(draft.description),
                  // Removed date and time
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Handle draft deletion (e.g., show confirmation dialog)
                      // Your logic to delete the draft (API call, service)
                      // Update the list if deletion is successful
                    },
                  ),
                  onTap: () {
                    // Handle draft item tap (e.g., open editor or view details)
                    Navigator.pushNamed(context, '/fts/view_drafts', arguments: draft);
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching drafts: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
