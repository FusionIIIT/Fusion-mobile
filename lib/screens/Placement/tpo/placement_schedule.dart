import 'package:flutter/material.dart';
import 'package:fusion/screens/Placement/tpo/tpo_sidebar.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';

class PlacementSchedule extends StatefulWidget {
  @override
  _PlacementScheduleState createState() => _PlacementScheduleState();
}
class Note {
  final int id;
  final String title;
  final String content;

  Note({required this.id, required this.title, required this.content});
}
class NotesProvider {
  List<Note> _notes = [
    Note(
      id: 1,
      title: '25/04/2024-01/05/2024',
      content: 'Mock interviews as part of PDC classes.\nVenue:Placement Cell, DSA.\nTime:9am - 1pm(Mor),2pm-6pm(Even).\n\nCSE 2021 - 25/04/2024 & 26/04/2024.\nECE 2021 - 27/04/2024.\nME 2021 - 28/04/2024.\nSM 2021 - 29/04/2024.\nDES 2021 - 30/04/2024.\nMTech 2021 - 01/05/2024.\nPhD 2021 - 01/05/2024.',
    ),

    Note(
      id: 2,
      title: '27/04/2024',
      content: 'Workshop by PostMan.\nVenue : L103, Audi.\nTime:10am.',
    ),
  ];
  int _nextId = 1;

  List<Note> get notes => _notes;

  int get nextId => _nextId;

  void addNote(String title, String content) {
    final note = Note(id: _nextId, title: title, content: content);
    _notes.add(note);
    _nextId++;
  }

  void updateNote(Note note, String title, String content) {
    final updatedNote = Note(
      id: note.id,
      title: title,
      content: content,
    );
    final index = _notes.indexWhere((n) => n.id == note.id);
    if (index != -1) {
      _notes[index] = updatedNote;
    }
  }

  void deleteNote(Note note) {
    _notes.remove(note);
  }
}

class _PlacementScheduleState extends State<PlacementSchedule> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  final _notesProvider = NotesProvider();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  Note? _editingNote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Placement Schedule",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });

        },
      ), // This is default app bar used in all modules
      bottomNavigationBar:
      MyBottomNavigationBar(),
      drawer:Sidebar(),
      body: ListView.builder(
        itemCount: _notesProvider.notes.length,
        itemBuilder: (context, index) {
          final note = _notesProvider.notes[index];
          return ListTile(
            leading: Icon(Icons.schedule_sharp),
            title: Text(note.title),
            subtitle: Text(note.content),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      _editingNote = note;
                      _titleController.text = note.title;
                      _contentController.text = note.content;
                    });
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(_editingNote == null ? 'Add Note' : 'Edit Note'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: _titleController,
                                decoration: InputDecoration(hintText: 'Date'),
                              ),
                              TextField(
                                controller: _contentController,
                                decoration: InputDecoration(hintText: 'Details of the event, time and venue if required'),
                                maxLines: null,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text(_editingNote == null ? 'Add' : 'Save'),
                              onPressed: () {
                                final title = _titleController.text;
                                final content = _contentController.text;
                                if (title.isNotEmpty && content.isNotEmpty) {
                                  if (_editingNote == null) {
                                    _notesProvider.addNote(title, content);
                                  } else {
                                    _notesProvider.updateNote(_editingNote!, title, content);
                                  }
                                  Navigator.pop(context);
                                  setState(() {});
                                }
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),

                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _notesProvider.deleteNote(note);
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _editingNote = null;
            _titleController.clear();
            _contentController.clear();
          });
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Schedule'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(hintText: 'Date'),
                    ),
                    TextField(
                      controller: _contentController,
                      decoration: InputDecoration(hintText: 'Details of the event, time and venue if required'),
                      maxLines: null,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(

                    child: Text('Add'),

                    onPressed: () {

                      final title = _titleController.text;

                      final content = _contentController.text;

                      if (title.isNotEmpty && content.isNotEmpty) {

                        final note = Note(

                          id: _notesProvider.nextId,

                          title: title,

                          content: content,

                        );

                        _notesProvider.addNote(title, content);

                        Navigator.pop(context);

                        setState(() {});

                      }

                    },

                  ),

                ],

              );

            },

          );

        },

      ),

    );

  }

}

