import 'package:courseapp/app_blocs.dart';
import 'package:courseapp/app_events.dart';
import 'package:courseapp/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBlocs(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Built Using Bloc"),
        ),
        body: Center(
          child: BlocBuilder<AppBlocs, AppStates>(
            // blockbuilder is used to show the changes in the ui
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    "${BlocProvider.of<AppBlocs>(context).state.counter}", // by this we can get access to the counter variable in the AppStates class.
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () =>
                  BlocProvider.of<AppBlocs>(context).add(Increment()),
              tooltip: "Increment",
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () =>
                  BlocProvider.of<AppBlocs>(context).add(Decrement()),
              tooltip: "Decrement",
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
