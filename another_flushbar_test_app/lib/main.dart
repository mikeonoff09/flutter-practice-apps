import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const NestedWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Will not work because it needs a level diferent than that from the Scaffold
            await Flushbar(
              title: 'Hey Ninja',
              message:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
              duration: const Duration(seconds: 3),
            ).show(context);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class NestedWidget extends StatelessWidget {
  const NestedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => simpleFlushbar().show(context),
            child: const Text('Show Flushbar'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shadowColor: Colors.red, backgroundColor: Colors.red),
            onPressed: () async => errorFlushBar(context),
            child: const Text('Show Error Flushbar'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => styledFlushbar().show(context),
            child: const Text('Show Flushbar Dismisible'),
          ),
          const Divider(height: 20),
          const Text('Fron Flushbar Helper'),
          const FlushBarHelperWidgets(),
        ],
      ),
    );
  }

  Flushbar<dynamic> infoHelperFlushBar() {
    return FlushbarHelper.createInformation(
      message:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      title: 'Hey Ninja',
      duration: const Duration(seconds: 3),
    );
  }

  /// Creates and returns a simple Flushbar, a basic notification widget, with default settings.
  ///
  /// Returns:
  ///   A [Flushbar] widget with a simple title and message.
  ///
  /// Example Usage:
  /// ```dart
  /// simpleFlushbar().show(context);
  ///
  Flushbar<dynamic> simpleFlushbar() {
    return Flushbar(
      title: 'Hey Ninja',
      message:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      duration: const Duration(seconds: 3),
    );
  }

  /// Creates and returns a styled Flushbar, a custom notification widget, with various customizations.
  ///
  /// Returns:
  ///   A [Flushbar] widget customized with specific properties for appearance and behavior. this way there is a need
  /// to add the .show(context) method to show the Flushbar when calling the function.
  ///
  /// Example Usage:
  /// ```dart
  /// styledFlushbar().show(context);
  /// ```
  Flushbar<dynamic> styledFlushbar() {
    return Flushbar(
      title: 'Show FlashBar dismissible',
      message:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      duration: const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      boxShadows: [
        BoxShadow(
          color: Colors.green[800]!.withOpacity(0.5),
          offset: const Offset(3.0, 3.0),
          blurRadius: 3.0,
        )
      ],
      borderColor: Colors.amber,
      borderWidth: 5,
      padding: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(10),
      margin: const EdgeInsets.all(20),
      forwardAnimationCurve: Curves.bounceIn,
      reverseAnimationCurve: Curves.bounceOut,
      backgroundGradient:
          const LinearGradient(colors: [Colors.red, Colors.blue]),
      icon: const Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
    );
  }

  /// Displays an error Flushbar, a custom notification widget, in the given [context].
  /// This function is a convenient way to show error messages to the user.
  ///
  /// Parameters:
  ///   - context: The [BuildContext] in which the Flushbar will be shown.
  ///
  /// Example Usage:
  /// ```dart
  /// errorFlushBar(context);
  /// ```
  void errorFlushBar(BuildContext context) {
    Flushbar(
      title: 'Error Flushbar',
      message:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      duration: const Duration(seconds: 3),
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
    ).show(context);
  }
}

class FlushBarHelperWidgets extends StatefulWidget {
  const FlushBarHelperWidgets({super.key});

  @override
  State<FlushBarHelperWidgets> createState() => _FlushBarHelperWidgetsState();
}

class _FlushBarHelperWidgetsState extends State<FlushBarHelperWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => FlushbarHelper.createInformation(
            message:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
            title: 'Hey Ninja',
            duration: const Duration(seconds: 3),
          ).show(context),
          child: const Text('Show Info Flushbar'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => FlushbarHelper.createError(
            message:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
            title: 'Hey Ninja',
            duration: const Duration(seconds: 3),
          ).show(context),
          child: const Text('Show Error Flushbar'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            FlushbarHelper.createLoading(
              message:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
              title: 'Hey Ninja',
              duration: const Duration(seconds: 3),
              linearProgressIndicator: const LinearProgressIndicator(),
              progressIndicatorBackgroundColor: Colors.blueGrey[800],
            ).show(context);
          },
          child: const Text('Show Loading Flushbar'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
