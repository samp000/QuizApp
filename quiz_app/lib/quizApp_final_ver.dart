import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/HomeScreen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class SingleQuestionModel {
  final String? question;
  final List? options;
  final int? answerIndex;

  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State {
  List allQuestions = [
    const SingleQuestionModel(
        question:
            "Which type of operating system allows multiple users to access the system simultaneously ?",
        options: ["Single-user", "Multi-user", "Real-time", "Batch"],
        answerIndex: 1),
    const SingleQuestionModel(
        question:
            "Which component of the operating system is responsible for managing input and output operations ?",
        options: [
          "Scheduler",
          "Device driver",
          "File system",
          "Interrupt handler"
        ],
        answerIndex: 1),
    const SingleQuestionModel(
        question:
            "What is the name of the mechanism used by an operating system to handle multiple processes ?",
        options: [
          "Multitasking",
          "Multiprocessing",
          "Multithreading",
          "Parallelism"
        ],
        answerIndex: 0),
    const SingleQuestionModel(
        question:
            "What type of file system is commonly used in Windows operating systems ?",
        options: ["FAT32", "NTFS", "Ext4", "HFS+"],
        answerIndex: 1),
    const SingleQuestionModel(
        question:
            "Which scheduling algorithm selects the process with the shortest expected processing time next ?",
        options: ["FCFS", "Round Robin", "Priority", "SJF"],
        answerIndex: 3),
  ];

  String errorMsg = "Select option first.. !!!";

  bool isQuestionScreen = true;
  int questionIndex = 0;
  int selectedIndex = -1;
  int score = 0;

  bool isPlaing = false;
  bool isSelected = false;
  bool errorFlg = false;

  double progressBarValue = 0.0;

  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();

    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget showError() {
    return errorFlg
        ? Text(
            errorMsg,
            style: TextStyle(color: Colors.red),
          )
        : SizedBox();
  }

  void validateBtn() {
    if (selectedIndex == -1) {
      errorFlg = true;
      setState(() {});
      return;
    }

    //increasing score
    if (selectedIndex == allQuestions[questionIndex].answerIndex) {
      score++;
    }

    // iterating to question list
    if (selectedIndex != -1) {
      if (questionIndex == allQuestions.length - 1) {
        isQuestionScreen = false;
      }
      questionIndex++;

      selectedIndex = -1;
      errorFlg = false;
    }

    //calculating value for progressbar
    progressBarValue = progressBarValue + (1 / allQuestions.length);

    setState(() {});
  }

  MaterialStatePropertyAll<Color?>? getBtnColor(int btnIndex) {
    if (selectedIndex != -1) {
      if (btnIndex == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (selectedIndex == btnIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  MaterialStatePropertyAll<Color?>? getTxtColor(int btnIndex) {
    if (selectedIndex != -1) {
      if (btnIndex == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.white);
      } else if (selectedIndex == btnIndex) {
        return const MaterialStatePropertyAll(Colors.white);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  Widget getScreen() {
    // if flg is true we are showing questions screen
    if (isQuestionScreen) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 117, 187, 245),
          title: const Text(
            "QuizApp",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: progressBarValue,
              backgroundColor: const Color.fromARGB(14, 158, 158, 158),
              color: const Color.fromARGB(255, 107, 188, 255),
              minHeight: 15,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Question : ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${questionIndex + 1} / ${allQuestions.length}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            SizedBox(
              height: 100,
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      "${allQuestions[questionIndex].question}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
                foregroundColor: getTxtColor(0),
                backgroundColor: getBtnColor(0),
                fixedSize: const MaterialStatePropertyAll(Size(200, 20)),
              ),
              onPressed: () {
                if (selectedIndex == -1) {
                  selectedIndex = 0;
                  setState(() {});
                }
              },
              child: Text(allQuestions[questionIndex].options[0]),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
                foregroundColor: getTxtColor(1),
                backgroundColor: getBtnColor(1),
                fixedSize: const MaterialStatePropertyAll(Size(200, 20)),
              ),
              onPressed: () {
                if (selectedIndex == -1) {
                  selectedIndex = 1;
                  setState(() {});
                }
              },
              child: Text(allQuestions[questionIndex].options[1]),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
                foregroundColor: getTxtColor(2),
                backgroundColor: getBtnColor(2),
                fixedSize: const MaterialStatePropertyAll(Size(200, 20)),
              ),
              onPressed: () {
                if (selectedIndex == -1) {
                  selectedIndex = 2;
                  setState(() {});
                }
              },
              child: Text(allQuestions[questionIndex].options[2]),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
                foregroundColor: getTxtColor(3),
                backgroundColor: getBtnColor(3),
                fixedSize: const MaterialStatePropertyAll(Size(200, 20)),
              ),
              onPressed: () {
                if (selectedIndex == -1) {
                  selectedIndex = 3;
                  setState(() {});
                }
              },
              child: Text(allQuestions[questionIndex].options[3]),
            ),
            const SizedBox(
              height: 200,
            ),
            showError()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 145, 202, 248),
          onPressed: () {
            validateBtn();
          },
          child: const Icon(
            Icons.forward,
          ),
        ),
      );
    } else {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://img.freepik.com/free-vector/trophy_78370-345.jpg",
                      width: 200,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Your Score:  ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 35),
                        ),
                        Text(
                          "$score / ${allQuestions.length} ",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 250, 192, 2),
                              fontSize: 35),
                        )
                      ],
                    ),
                  ],
                )),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          questionIndex = 0;
                          score = 0;
                          isQuestionScreen = true;
                          selectedIndex = -1;
                          progressBarValue = 0.0;
                          isPlaing = false;
                          setState(() {});
                        },
                        child: const Text("Restart")),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            // Moves to actual Quiz Page
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                        child: const Text("Home Page")),
                  ],
                )
              ],
            ),
          ),
          ConfettiWidget(
            numberOfParticles: 20,
            emissionFrequency: 0.05,
            blastDirection: pi,
            minimumSize: const Size(10, 10),
            maximumSize: const Size(20, 18),
            blastDirectionality: BlastDirectionality.explosive,
            confettiController: controller,
            shouldLoop: true,
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return getScreen();
  }
}
