import 'package:flutter/material.dart';

void main() {
  runApp(TransferFunds());
}


class TransferFunds extends StatefulWidget {
  @override
  _TransferFundsState createState() => _TransferFundsState();
}

class _TransferFundsState extends State<TransferFunds> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,

        title: Text('Transfer Funds'),

      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: ProcessBill1(),
            ),
          ),
          Container(
            color: Colors.white,
            child: Center(
              child: DownloadButton(
                onPressed: () {
                  // Add your download logic here
                  print('Downloading...');
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz), // Transfer icon
            label: 'Transfer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history), // History icon
            label: 'History',
          ),
        ],
      ),
    );
  }
}

class DownloadButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DownloadButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.download),
      label: Text('Download Report'),
    );
  }
}

class ProcessBill1 extends StatefulWidget {
  @override
  _ProcessBill1FormState createState() => _ProcessBill1FormState();
}

class _ProcessBill1FormState extends State<ProcessBill1> {
  final _formKey = GlobalKey<FormState>();
  String _billAmount = '';
  String _department = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the bill amount';
                  }
                  return null;
                },
                onSaved: (value) => _billAmount = value ?? '',
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the department';
                  }
                  return null;
                },
                onSaved: (value) => _department = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print('Bill Amount: $_billAmount');
                    print('Department: $_department');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Process Bill',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






