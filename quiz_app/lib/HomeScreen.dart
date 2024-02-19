import 'package:flutter/material.dart';
import 'package:quiz_app/quizApp_final_ver.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 116, 182, 236),
                Color.fromARGB(255, 81, 111, 136)
              ],
            ),
          ),
          child: const Text(
            "Quiz App",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Select Topic",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MouseRegion(
              //This is just to show different cursor behaviour
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                // This is for adding onTab Gesture
                onTap: () {
                  Navigator.push(
                    // Moves to actual Quiz Page
                    context,
                    MaterialPageRoute(builder: (context) => const QuizApp()),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 48, 47, 47),
                      Color.fromARGB(255, 48, 20, 75)
                    ]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 250,
                  width: 350,
                  child: const Text(
                    "Computer Architecture",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MouseRegion(
              //This is just to show different cursor behaviour
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                // This is for adding onTab Gesture
                onTap: () {
                  Navigator.push(
                    // Moves to actual Quiz Page
                    context,
                    MaterialPageRoute(builder: (context) => const QuizApp()),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 48, 20, 47),
                      Color.fromARGB(255, 8, 21, 32),
                    ]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 250,
                  width: 350,
                  child: const Text(
                    "Computer Networks",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MouseRegion(
              //This is just to show different cursor behaviour
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                // This is for adding onTab Gesture
                onTap: () {
                  Navigator.push(
                    // Moves to actual Quiz Page
                    context,
                    MaterialPageRoute(builder: (context) => const QuizApp()),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 8, 36, 8),
                      Color.fromARGB(255, 48, 20, 47),
                    ]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 250,
                  width: 350,
                  child: const Text(
                    "System Programming",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MouseRegion(
              //This is just to show different cursor behaviour
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                // This is for adding onTab Gesture
                onTap: () {
                  Navigator.push(
                    // Moves to actual Quiz Page
                    context,
                    MaterialPageRoute(builder: (context) => const QuizApp()),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 17, 17, 17),
                      Color.fromARGB(255, 52, 10, 83)
                    ]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 250,
                  width: 350,
                  child: const Text(
                    "Operating System",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
