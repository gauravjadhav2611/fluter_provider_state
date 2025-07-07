import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_gaurav/container_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? containerHeight = 100.0;
  ValueNotifier<double> containerWidth = ValueNotifier(100.0);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<ContainerProvider>(
                builder: (context,heightProvider,child){
                  return ValueListenableBuilder(
                    valueListenable: containerWidth,
                    builder: (context, widthProvider, child){
                      return Container(
                        height: heightProvider.containerHeight,
                        width: widthProvider,
                        color: Colors.red,
                      );
                    },
                  );
                }
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      context.read<ContainerProvider>().increaseHeight();
                    },
                    child: const Text("Increase Height")
                ),
                ElevatedButton(
                    onPressed: (){
                      context.read<ContainerProvider>().decreaseHeight();
                    },
                    child: const Text("Decrease Height")
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      increaseWidth();
                    },
                    child: const Text("Increase Width")
                ),
                ElevatedButton(
                    onPressed: (){
                      decreaseWidth();
                    },
                    child: const Text("Decrease Width")
                ),
              ],
            ),
            const SizedBox(height: 10,),

            ElevatedButton(
                onPressed: (){
                  context.read<ContainerProvider>().resetHeight();
                  resetWidth();
                },
                child: const Text("Reset")
            ),
          ],
        ),
      ),
    );
  }

  increaseWidth(){
    if(containerWidth.value !< 300){
      containerWidth.value += 10;
    }
  }

  decreaseWidth(){
    if(containerWidth.value !> 10){
      containerWidth.value -= 10;
    }
  }

  resetWidth(){
    containerWidth.value = 100.0;
  }
}
