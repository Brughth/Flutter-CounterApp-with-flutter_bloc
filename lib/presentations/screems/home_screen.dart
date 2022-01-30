import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leand_bloc/constants/enums.dart';
import 'package:leand_bloc/logic/counter/counter_cubit.dart';
import 'package:leand_bloc/logic/internet/internet_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: BlocListener<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state is InternetConnected &&
              state.connectionType == ConnectionType.wifi) {
            context.read<CounterCubit>().increment();
          } else if (state is InternetConnected &&
              state.connectionType == ConnectionType.wifi) {
            context.read<CounterCubit>().decrement();
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return Text(
                    "Wi-Fi",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.green),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return Text(
                    "Mobile",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.green),
                  );
                } else if (state is InternetDisconnected) {
                  return Text(
                    "Disconnected",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.green),
                  );
                }
                return const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: LinearProgressIndicator(),
                );
              }),
              const Text(
                'You have pushed the button this many times:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                if (state.wasIncrementd == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "incremented",
                      ),
                      duration: Duration(milliseconds: 600),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Decremented"),
                      duration: Duration(milliseconds: 600),
                    ),
                  );
                }
              }, builder: (context, state) {
                if (state.counterValue == 5) {
                  return const Text(
                    "bravo! Cinq",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  );
                } else if (state.counterValue >= 6 &&
                    state.counterValue <= 10) {
                  return const Text(
                    "t'es entre 6 et 10 broh",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  );
                }
                return Text(
                  state.counterValue.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                );
              }),
              // const SizedBox(
              //   height: 20,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     FloatingActionButton(
              //       heroTag: "ddffd",
              //       onPressed: () {
              //         context.read<CounterCubit>().decrement();
              //       },
              //       backgroundColor: widget.color,
              //       tooltip: 'Decrement',
              //       child: const Icon(Icons.remove),
              //     ),
              //     FloatingActionButton(
              //       backgroundColor: widget.color,
              //       heroTag: "gbgf",
              //       onPressed: () => context.read<CounterCubit>().increment(),
              //       tooltip: 'Increment',
              //       child: const Icon(Icons.add),
              //     ),
              //   ],
              // ),
              // MaterialButton(
              //   onPressed: () {
              //     Navigator.of(context).pushNamed("/second");
              //   },
              //   padding: const EdgeInsets.all(10),
              //   color: Colors.purple,
              //   child: const Text(
              //     "Second Screen",
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 18,
              //     ),
              //   ),
              // ),
              // MaterialButton(
              //   onPressed: () {
              //     Navigator.of(context).pushNamed("/third");
              //   },
              //   padding: const EdgeInsets.all(10),
              //   color: Colors.pink,
              //   child: const Text(
              //     "Third Screen",
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 18,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
