import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leand_bloc/logic/counter/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
              } else if (state.counterValue >= 6 && state.counterValue <= 10) {
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: "ddffd",
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  backgroundColor: widget.color,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  backgroundColor: widget.color,
                  heroTag: "gbgf",
                  onPressed: () => context.read<CounterCubit>().increment(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            MaterialButton(
              onPressed: () {},
              padding: const EdgeInsets.all(10),
              color: Colors.blueAccent,
              child: const Text(
                "Home Screen",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
