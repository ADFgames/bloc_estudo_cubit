import 'package:bloc_cubit_estudo_simplificado/cubit/greeting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BloC Cubit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<GreetingCubit>(
        create: (context) => GreetingCubit(),
        child: const MyHomePage(title: 'Flutter Demo BloC Cubit'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextMessage(),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                final greetingCubit = context.read<GreetingCubit>();
                greetingCubit.getNextGreetingState();
              },
              child: const Text(
                'Próxima Vista!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                final greetingCubit = context.read<GreetingCubit>();
                greetingCubit.resetCounting();
              },
              child: const Text(
                'Reset Counting',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GreetingCubit, GreetingState>(
      builder: (context, state) {
        String message = '';

        if (state is GreetingInitial) {
          message = 'Bem vindo!';
        } else if (state is GreetingSeconfTime) {
          message = 'É seu segundo acesso.';
        } else if (state is GreetingThirdTime) {
          message = 'É seu terceiro acesso.';
        } else {
          message = 'Bem vindo novamente.';
        }
        return Text(
          message,
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }
}
