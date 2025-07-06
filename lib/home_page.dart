import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_gaurav/container_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? containerHeight = 100;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<ContainerProvider>(
                builder: (context,heightProvider,child){
                  return Container(
                    height: heightProvider.containerHeight,
                    width: 100,
                    color: Colors.red,
                  );
                }
            ),
            ElevatedButton(
                onPressed: (){
                  context.read<ContainerProvider>().increaseHeight();
                },
                child: Text("+")
            ),
            ElevatedButton(
                onPressed: (){
                  context.read<ContainerProvider>().decreaseHeight();
                },
                child: Text("-")
            ),
          ],
        ),
      ),
    );
  }
}
