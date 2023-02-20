import 'package:data_layer/core/dataprovider/remote/diohelper.dart';
import 'package:data_layer/data/datasource/remote_movie_data_source.dart';
import 'package:data_layer/data/repository/repository_imp.dart';
import 'package:data_layer/domain/repo/repo.dart';
import 'package:data_layer/domain/usecase/popular_movie_usecase.dart';
import 'package:flutter/material.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  getData()async{
    BaseRemoteMovieDataSource baseRemoteMovieDataSource=RemoteMovieDataSource();
    BaseRepository baseRepository=MovieRepository(baseRemoteMovieDataSource: baseRemoteMovieDataSource);
    final result=await PopularUseCase(baseRepository).execute(NoParam());
    result.fold((l) => print(l.message), (r) => print(r));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
