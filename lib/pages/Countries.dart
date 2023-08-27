import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_project/Api/Countriesapi.dart';
import 'package:test_project/Model/Countries.dart';

class Countrie extends StatefulWidget {
  const Countrie({super.key});

  @override
  State<Countrie> createState() => _CountrieState();
}

class _CountrieState extends State<Countrie> {
  Countries? allcountry;
  List<Places>? myplaces;

  CountriesApi countryapi = new CountriesApi();

  Future<void> fetchcountries() async {
    final data = await countryapi.fetchcountries();

    if (data != null) {
      setState(() {
        allcountry = data;
        myplaces = data.places;
      });
    }
  }

  @override
  void initState() {
    fetchcountries();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Countries")),
      body: allcountry != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(allcountry!.country.toString()),
                Text(allcountry!.countryAbbreviation.toString()),
                Text(allcountry!.places![0].placeName.toString()),
                Text(allcountry!.postCode.toString()),
                myplaces != null
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: myplaces!.length,
                            itemBuilder: (context, index) {
                              final allplaces = myplaces![index];
                              return Padding(
                                padding: EdgeInsets.all(2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(allplaces.placeName.toString()),
                                    Text(allplaces.state.toString()),
                                    Text(allplaces.stateAbbreviation.toString())
                                  ],
                                ),
                              );
                            }))
                    : Text("data Loading")
              ],
            )
          : Text("data Loading please wait"),
    );
  }
}
