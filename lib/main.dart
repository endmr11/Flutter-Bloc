import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/form_data_bloc.dart';
import 'formdata_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: CounterObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Bloc"),
      ),
      body: BlocProvider(
        create: (context) => FormDataBloc(),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Expanded(child: LeftWidgetA()),
              Expanded(child: RightWidgetA()),
            ],
          ),
        ),
      ),
    );
  }
}

class LeftWidgetA extends StatelessWidget {
  const LeftWidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        children: [
          const Text(
            "Left Widget A",
            style: TextStyle(fontSize: 20),
          ),
          BlocBuilder<FormDataBloc, FormDataState>(
            builder: (context, state) {
              if (state is FormDataChanged) {
                return Text(
                  "City: ${state.data}",
                  style: const TextStyle(fontSize: 20),
                );
              }
              return const Text(
                "City: .....",
                style: TextStyle(fontSize: 20),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RightWidgetA extends StatelessWidget {
  const RightWidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: const [
          Text(
            "Right Widget A",
            style: TextStyle(fontSize: 20),
          ),
          RightWidgetB(),
        ],
      ),
    );
  }
}

class RightWidgetB extends StatelessWidget {
  const RightWidgetB({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Column(
        children: const [
          Text(
            "Right Widget B",
            style: TextStyle(fontSize: 20),
          ),
          RightWidgetC(),
        ],
      ),
    );
  }
}

class RightWidgetC extends StatelessWidget {
  const RightWidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FormDataChanged? c = context.select((FormDataBloc bloc) => (bloc.state is FormDataChanged) ? bloc.state as FormDataChanged : null);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text(
            "Right Widget C $c ${c?.data}",
            style: const TextStyle(fontSize: 20),
          ),
          BlocBuilder<FormDataBloc, FormDataState>(
            builder: (context, state) {
              if (state is FormDataChanged) {
                return Text(
                  "City: ${state.data}",
                  style: const TextStyle(fontSize: 20),
                );
              }
              return const Text(
                "City: .....",
                style: TextStyle(fontSize: 20),
              );
            },
          ),
          TextField(
            decoration: const InputDecoration(labelText: "City", border: OutlineInputBorder()),
            onChanged: (value) {
              context.read<FormDataBloc>().add(FormDataChange(value));
            },
          ),
        ],
      ),
    );
  }
}
