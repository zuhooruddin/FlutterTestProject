import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_project/Api/AlbumApi.dart';
import 'package:test_project/Model/Albummodel.dart';

class AlbumList extends StatefulWidget {
  const AlbumList({super.key});

  @override
  State<AlbumList> createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  List<Album>? myalbums;

  AlbumApi albumapis = new AlbumApi();

  Future<void> fetchalbum() async {
    final datas = await albumapis.fetchalbum();
    setState(() {
      if (datas != null) {
        myalbums = datas;
      }
    });
  }

  @override
  void initState() {
    fetchalbum();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album  Page"),
      ),
      body: Column(
        children: [
          myalbums != null
              ? Expanded(
                  child: ListView.builder(
                      itemCount: myalbums!.length,
                      itemBuilder: (context, index) {
                        final album = myalbums![index];
                        return Padding(
                          padding: EdgeInsets.all(2),
                          child: Row(
                            children: [
                              Text(album.id.toString()),
                              Text(album.title.toString()),
                              Text(album.userId.toString()),
                              Text(album.id.toString()),
                            ],
                          ),
                        );
                      }))
              : Text("data Loading")
        ],
      ),
    );
  }
}
