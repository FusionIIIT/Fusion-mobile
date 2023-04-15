import 'package:flutter/material.dart';
import 'package:fusion/Components/custom_widgets.dart';

class IndentStatus extends StatefulWidget {
  IndentStatus({Key? key}) : super(key: key);

  @override
  State<IndentStatus> createState() => _IndentStatusState();
}

class _IndentStatusState extends State<IndentStatus> {
  int currentStep = 0;

  // List<Step> stepList() => [
  //       const Step(title: Text(''), content: Text('')),
  //       const Step(
  //           title: Text(''),
  //           content: Center(
  //             child: Text('Address'),
  //           )),
  //       const Step(
  //           title: Text(''),
  //           content: Center(
  //             child: Text('Confirm'),
  //           ))
  //     ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Filed Indents",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      drawer: customDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          statusCard('Projector', '1001', '07/07/2023'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              'Status:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Stepper(
              steps: getSteps(),
              type: StepperType.vertical,
              currentStep: currentStep,
              onStepCancel: () => currentStep == 0
                  ? null
                  : setState(() {
                      currentStep -= 1;
                    }),
              onStepContinue: () {
                bool isLastStep = (currentStep == getSteps().length - 1);
                if (isLastStep) {
                  //Do something with this information
                } else {
                  setState(() {
                    currentStep += 1;
                  });
                }
              },
              onStepTapped: (step) => setState(() {
                    currentStep = step;
                  }),
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                final _isLastStep = currentStep == getSteps().length - 1;
                return Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Row(children: [
                      Expanded(
                          child: TextButton(
                        child: Text('Accept',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        onPressed: details.onStepContinue,
                      )),
                      const SizedBox(
                        width: 2,
                      ),
                      Expanded(
                          child: TextButton(
                        child: Text(
                          'Decline',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: details.onStepCancel,
                      ))
                    ]));
              })
        ]),
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: Text("HOD Approval"),
        content: Container(),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("Director Approval"),
        content: Container(),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text("Financial Approval"),
        content: Container(),
      ),
    ];
  }
}
