import 'dart:ffi';

import 'package:app/DeviceInfo/symptomInfo.dart';
import 'package:app/objects/info.dart';
import 'package:flutter/material.dart';
import 'package:app/Screens/AddSymptoms/components/background.dart';
import 'package:app/Screens/TableCalendar/tableCalendar.dart';
import 'package:app/constants.dart';
import 'package:app/models/postSymptoms.dart';

class AddSymptoms extends StatefulWidget {
  UserInfo userInfo;

  List<SymptomInfo> symptomInfo;
  final void Function() callBack;

  AddSymptoms({
    this.userInfo,
    this.symptomInfo,
    @required this.callBack,
  });

  @override
  _AddSymptomsState createState() => _AddSymptomsState(userInfo, symptomInfo);
}

class _AddSymptomsState extends State<AddSymptoms> {
  UserInfo userInfo;
  List<SymptomInfo> symptomInfo;
  _AddSymptomsState(this.userInfo, this.symptomInfo);

  int state = 0;

  int tempSymptomLevel = 0;

  String symptomLevel = "";

  List<int> levelState = [0, 0, 0, 0, 0, 0];

  void initState() {
    for (var i = 0; i < symptomInfo.length; i++) {
      if (symptomInfo[i].date == userInfo.addSymptomDate)
        for (var u = 0; u < symptomInfo[i].symptomLevel.length; u++) {
          levelState[u] = int.parse(symptomInfo[i].symptomLevel[u]);
        }
    }
    print(symptomInfo.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove AppBar shadow.
        centerTitle:
            true, // Align AppBar title to center. Default is left side.
        iconTheme: IconThemeData(
            color: color_0), // Make all buttons on AppBar the same color.

        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.cancel),

              onPressed: () {
                // Because we replaced the drawer button with an icon containing no logic,...
                Navigator.pop(
                    context); // ...we have to add the logic back so that it opens the drawer when pressed.
              }, // This is stupid.

              tooltip:
                  'Cancel', // An entire code block just to get to this single line fml.
            );
          },
        ),

        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done),
            tooltip: 'Save',
            onPressed: () async {
              //Navigator.pop(context);
              for (var i = 0; i < levelState.length; i++)
                symptomLevel = symptomLevel + levelState[i].toString();
              userInfo.addSymptomLevel = symptomLevel;
              await submitSymptom(
                userInfo,
                symptomInfo,
              );
              widget.callBack();
              Navigator.of(context).pop();
            },
          ),
        ],
        // 'title' is a string given by whatever screen is being displayed.
        title: Text("Symptoms", style: TextStyle(color: color_0)),
      ),
      body: Background(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          state = 0;
                        });
                      },
                      child: SymptomType(
                        img:
                            "assets/images/symptoms/bleeding/icon_bleeding_heavy.png",
                        state: state,
                        symptomType: 0,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          state = 1;
                        });
                      },
                      child: SymptomType(
                        img:
                            "assets/images/symptoms/emotions/icon_emotions_moodSwings.png",
                        state: state,
                        symptomType: 1,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          state = 2;
                        });
                      },
                      child: SymptomType(
                        img:
                            "assets/images/symptoms/energy/icon_energy_energized.png",
                        state: state,
                        symptomType: 2,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          state = 3;
                        });
                      },
                      child: SymptomType(
                        img:
                            "assets/images/symptoms/pain/icon_pain_headache.png",
                        state: state,
                        symptomType: 3,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          state = 4;
                        });
                      },
                      child: SymptomType(
                        img: "assets/images/symptoms/sex/icon_sex_none.png",
                        state: state,
                        symptomType: 4,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          state = 5;
                        });
                      },
                      child: SymptomType(
                        img:
                            "assets/images/symptoms/sleep/icon_sleep_general.png",
                        state: state,
                        symptomType: 5,
                      )),
                ],
              ),
            ),
            if (state == 0)
              Column(
                children: <Widget>[
                  SymptomName(symptomName: "Bleeding"),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 0;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/bleeding/icon_bleeding_heavy.png",
                      levelState: levelState,
                      level: "Heavy",
                      state: state,
                      levelType: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 1;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/bleeding/icon_bleeding_spotting.png",
                      levelState: levelState,
                      level: "Spotting",
                      state: state,
                      levelType: 1,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 2;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/bleeding/icon_bleeding_none.png",
                      levelState: levelState,
                      level: "None",
                      state: state,
                      levelType: 2,
                    ),
                  ),
                ],
              )
            else if (state == 1)
              Column(
                children: <Widget>[
                  SymptomName(symptomName: "Emotions"),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 0;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/emotions/icon_emotions_happy.png",
                      levelState: levelState,
                      level: "Happy",
                      state: state,
                      levelType: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 1;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/emotions/icon_emotions_sad.png",
                      levelState: levelState,
                      level: "Sad",
                      state: state,
                      levelType: 1,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 2;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/emotions/icon_emotions_moodSwings.png",
                      levelState: levelState,
                      level: "Mood Swings",
                      state: state,
                      levelType: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 3;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/emotions/icon_emotions_sensitive.png",
                      levelState: levelState,
                      level: "Sensitive",
                      state: state,
                      levelType: 3,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 4;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/emotions/icon_emotions_none.png",
                      levelState: levelState,
                      level: "None",
                      state: state,
                      levelType: 4,
                    ),
                  ),
                ],
              )
            else if (state == 2)
              Column(
                children: <Widget>[
                  SymptomName(symptomName: "Energy"),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 0;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/energy/icon_energy_energized.png",
                      levelState: levelState,
                      level: "Energized",
                      state: state,
                      levelType: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 1;
                      });
                    },
                    child: SymptomLevel(
                      img: "assets/images/symptoms/energy/icon_energy_none.png",
                      levelState: levelState,
                      level: "None",
                      state: state,
                      levelType: 1,
                    ),
                  ),
                ],
              )
            else if (state == 3)
              Column(
                children: <Widget>[
                  SymptomName(symptomName: "Pain"),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 0;
                      });
                    },
                    child: SymptomLevel(
                      img: "assets/images/symptoms/pain/icon_pain_headache.png",
                      levelState: levelState,
                      level: "Headache",
                      state: state,
                      levelType: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 1;
                      });
                    },
                    child: SymptomLevel(
                      img: "assets/images/symptoms/pain/icon_pain_cramps.png",
                      levelState: levelState,
                      level: "Cramps",
                      state: state,
                      levelType: 1,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 2;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/pain/icon_pain_tenderBreasts.png",
                      levelState: levelState,
                      level: "Tender Breasts",
                      state: state,
                      levelType: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 3;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/pain/icon_pain_ovulation.png",
                      levelState: levelState,
                      level: "Ovulation",
                      state: state,
                      levelType: 3,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 4;
                      });
                    },
                    child: SymptomLevel(
                      img: "assets/images/symptoms/pain/icon_pain_none.png",
                      levelState: levelState,
                      level: "None",
                      state: state,
                      levelType: 4,
                    ),
                  ),
                ],
              )
            else if (state == 4)
              Column(
                children: <Widget>[
                  SymptomName(symptomName: "Sex"),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 0;
                      });
                    },
                    child: SymptomLevel(
                      img: "assets/images/symptoms/sex/icon_sex_protected.png",
                      levelState: levelState,
                      level: "Protected",
                      state: state,
                      levelType: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 1;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/sex/icon_sex_unprotected.png",
                      levelState: levelState,
                      level: "Unprotected",
                      state: state,
                      levelType: 1,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 2;
                      });
                    },
                    child: SymptomLevel(
                      img: "assets/images/symptoms/sex/icon_sex_withdrawal.png",
                      levelState: levelState,
                      level: "Withdrawal",
                      state: state,
                      levelType: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 3;
                      });
                    },
                    child: SymptomLevel(
                      img: "assets/images/symptoms/sex/icon_sex_highLibido.png",
                      levelState: levelState,
                      level: "HighLibido",
                      state: state,
                      levelType: 3,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 4;
                      });
                    },
                    child: SymptomLevel(
                      img: "assets/images/symptoms/sex/icon_sex_none.png",
                      levelState: levelState,
                      level: "None",
                      state: state,
                      levelType: 4,
                    ),
                  ),
                ],
              )
            else if (state == 5)
              Column(
                children: <Widget>[
                  SymptomName(symptomName: "Sleep"),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 0;
                      });
                    },
                    child: SymptomLevel(
                      img:
                          "assets/images/symptoms/sleep/icon_sleep_general.png",
                      levelState: levelState,
                      level: "General",
                      state: state,
                      levelType: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        levelState[state] = 1;
                      });
                    },
                    child: SymptomLevel(
                      img: "assets/images/symptoms/sleep/icon_sleep_none.png",
                      levelState: levelState,
                      level: "None",
                      state: state,
                      levelType: 1,
                    ),
                  ),
                ],
              )
          ],
        ),
      )),
    );
  }
}

class SymptomType extends StatelessWidget {
  const SymptomType({
    Key key,
    @required this.state,
    this.img,
    this.symptomType,
  }) : super(key: key);

  final int state;
  final String img;
  final int symptomType;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.25,
      height: size.width * 0.25,
      alignment: Alignment.center,
      child: Container(
        width: size.width * 0.17,
        child: Image.asset(
          img,
        ),
      ),
      decoration: BoxDecoration(
        border: state == symptomType
            ? Border.all(color: color_3, width: 2)
            : Border.all(
                color: Colors.white,
              ),
        shape: BoxShape.circle,
      ),
    );
  }
}

class SymptomName extends StatelessWidget {
  const SymptomName({
    Key key,
    this.symptomName,
  }) : super(key: key);

  final String symptomName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.15,
        child: Center(
          child: Text(
            symptomName,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: color_0),
          ),
        ));
  }
}

class SymptomLevel extends StatelessWidget {
  const SymptomLevel({
    Key key,
    @required this.levelState,
    this.img,
    this.level,
    this.state,
    this.levelType,
  }) : super(key: key);

  final List<int> levelState;
  final String img;
  final String level;
  final int state;
  final int levelType;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.7,
      height: size.width * 0.2,
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.1,
          ),
          Image.asset(
            img,
            width: size.width * 0.15,
          ),
          SizedBox(
            width: size.width * 0.2,
          ),
          Text(
            level,
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: levelState[state] == levelType
              ? Border.all(color: color_3, width: 2)
              : Border.all(
                  color: Colors.white,
                ),
          borderRadius: BorderRadius.circular(30)
          //shape: BoxShape.circle,
          ),
    );
  }
}
