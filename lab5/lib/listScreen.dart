import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab5/apiService/api.dart';
import 'package:lab5/model/model.dart';
import 'package:http/http.dart' as http;

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List",
        style: TextStyle(fontSize: 24.0),),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: FutureBuilder<List<Model>>(
          future: fetchModel(http.Client()),
          builder: (context, snapshot){
             if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
            ? ModelList(models: snapshot.data)
            : Center(child: CircularProgressIndicator());
          }),)
    );
  }
}

class ModelList extends StatelessWidget {
  final List<Model> models;

  const ModelList({Key key, this.models}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: models.length,
      itemBuilder: (context, index){
        return InkWell(
          onTap: (){
            showDialog(context:context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),
              ),
              elevation: 16,
              child: Container(
                height: 600,
                width: 400,
                child: 
                    Center(
                      child:Expanded(
                        child:Column(children: [
                          SizedBox(height: 20.0),
                          Image.network("https"+models[index].image.substring(4),
                          width: 300,
                          height: 500,),
                        Expanded(child: Column(children: [
                          Text(models[index].title),
                          Text(models[index].id)
               ],))
              ]))
                      )
                ),
              );
            },);
          },
          child: Card(
          child:Row(children: [
                Image.network("https"+models[index].image.substring(4),
                width: 100,
                height: 100,),
               Expanded(child: Column(children: [
                 Text(models[index].title),
                 Text(models[index].id)
               ],))
              ])
          ));
      });
  }
}