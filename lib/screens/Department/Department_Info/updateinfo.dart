import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class UpdateInfoPage extends StatefulWidget {
  @override
  _UpdateInfoPageState createState() => _UpdateInfoPageState();
}

class _UpdateInfoPageState extends State<UpdateInfoPage> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactNumberController = TextEditingController();
  TextEditingController _facilitiesController = TextEditingController();
  TextEditingController _linkController = TextEditingController();
  late FocusNode _facilitiesFocusNode;
  late FocusNode _linkFocusNode;

  late Color facilitiesBorderColor;
  late Color linkBorderColor;

  @override
  void initState() {
    super.initState();
    _facilitiesFocusNode = FocusNode();
    _linkFocusNode = FocusNode();
    facilitiesBorderColor = Colors.grey;
    linkBorderColor = Colors.grey;

    _facilitiesFocusNode.addListener(() {
      setState(() {
        // Update facilitiesBorderColor based on focus state
        facilitiesBorderColor = _facilitiesFocusNode.hasFocus
            ? Theme.of(context).colorScheme.primary
            : Colors.grey;
      });
    });

    _linkFocusNode.addListener(() {
      setState(() {
        linkBorderColor = _linkFocusNode.hasFocus
            ? Theme.of(context).colorScheme.primary
            : Colors.grey;
      });
    });
  }

  @override
  void dispose() {
    _facilitiesFocusNode.dispose();
    _linkFocusNode.dispose();
    super.dispose();
  }

  void _onFacilitiesFocusChange(bool hasFocus) {
    setState(() {
      facilitiesBorderColor =
          hasFocus ? Theme.of(context).colorScheme.primary : Colors.grey;
    });
  }

  void _onLinkFocusChange(bool hasFocus) {
    setState(() {
      linkBorderColor =
          hasFocus ? Theme.of(context).colorScheme.primary : Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Update Information',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: SideDrawer(
        curr_desig: curr_desig,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter email',
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _contactNumberController,
            decoration: InputDecoration(
              labelText: 'Contact Number',
              hintText: 'Enter contact number',
            ),
          ),
          SizedBox(height: 24.0),
          _buildTextFieldWithFocusNode(
            labelText: 'Facilities',
            hintText: 'Enter facilities offered by the department',
            controller: _facilitiesController,
            focusNode: _facilitiesFocusNode,
            borderColor: facilitiesBorderColor,
            onFocusChange: _onFacilitiesFocusChange,
          ),
          SizedBox(height: 24.0),
          _buildTextFieldWithFocusNode(
            labelText: 'Labs',
            hintText: 'Enter lab information of the department',
            controller: _linkController,
            focusNode: _linkFocusNode,
            borderColor: linkBorderColor,
            onFocusChange: _onLinkFocusChange,
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {},
            child: Text('Update Information'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldWithFocusNode({
    required String labelText,
    required String hintText,
    required TextEditingController controller,
    required FocusNode focusNode,
    required Color borderColor,
    required ValueChanged<bool> onFocusChange,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 40.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: EdgeInsets.symmetric(vertical: 16.0),
            ),
            onChanged: (value) {
              onFocusChange(true);
            },
            onTap: () {
              onFocusChange(true);
            },
            onEditingComplete: () {
              onFocusChange(false);
            },
            onSubmitted: (value) {
              onFocusChange(false);
            },
          ),
        ),
      ],
    );
  }
}
