/*import 'package:country_picker/country_picker.dart' ;
import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geovisualizer_lg/country.dart';

class CountryCodePickerWidget extends StatefulWidget {
  const CountryCodePickerWidget({super.key});

  @override
  State<CountryCodePickerWidget> createState() => _CountryCodePickerWidgetState();
}

class _CountryCodePickerWidgetState extends State<CountryCodePickerWidget> {
  late Future<List> countries;
  Future<List> getCountries() async {
    var response = await Dio().get('https://restcountries.com/v3.1/all');
    return response.data;
  }

  @override
  void initState() {
    countries = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  getCountries();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 77, 2, 252),
        title: const Text(
          'All Countries',
          style: TextStyle(fontFamily: 'Unbounded'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
                onPressed: () {
                  showCountryPicker(context: context, onSelect: (Country value) {
                  
                  });
                },
                child: Text('tap')),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder<List>(
            future: countries,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                Country(snapshot.data?[index]),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          child: Text(
                            snapshot.data?[index]['name'],
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ));
                });
              }
              return const Text('error');
            },
          )
           ListView(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Country("India");
                      },
                    ),
                  );
                },
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8.0),
                    child: Text(
                      'India',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Country("Canada");
                      },
                    ),
                  );
                },
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8.0),
                    child: Text(
                      'Canada',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
          ],
        ),
          ),
    );
  }
}*/

/*import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:geovisualizer_lg/map_screen.dart';

class CountryPickerWidget extends StatefulWidget {
  const CountryPickerWidget({Key? key}) : super(key: key);

  @override
  State<CountryPickerWidget> createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  String countryCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 77, 2, 252),
        title: const Text(
          'Select Country',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(countryCode.toString()),
          Center(
            child: TextButton(
                onPressed: () {
                  showCountryPicker(
                      context: context,
                      // showPhoneCode: true,
                      countryListTheme: CountryListThemeData(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10)),
                          inputDecoration: InputDecoration(
                            labelText: 'Search ',
                          )),
                      //  favorite: ['PK'],
                      onSelect: (Country value) {
                       /* Navigator.of(context).push(
                            
                            MaterialPageRoute(
                                builder: (ctx) =>  MapScreen()));*/
                        //putmap
/*print(value.countryCode.toString());
                        print(value.phoneCode.toString());

                        countryCode = value.phoneCode.toString();*/
                        setState(() {
                          Navigator.of(context).push(
                            
                            MaterialPageRoute(
                                builder: (ctx) =>  MapScreen()));
                        });
                      });
                },
                child: Text('Show Country list')),
          )
        ],
      ),
    );
  }
}*/

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geovisualizer_lg/settings_screen.dart';
import 'package:geovisualizer_lg/map_screen.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  List countries = [];
  bool isSearching = false;
  getCountries() async {
    var response = await Dio().get('https://countrycode.dev/api/countries');
    return response.data;
  }

  @override
  void initState() {
    getCountries().then((data) {
      setState(() {
        countries = data;
      });
    });
    super.initState();
  }

  void _filterCountries(value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    print(countries);
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.pink,
          title: !isSearching
              ? Text('Map')
              : TextField(
                  onChanged: (value) {
                    _filterCountries(value);
                  },
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Search Country",
                      hintStyle: TextStyle(color: Colors.white)),
                  style: TextStyle(color: Colors.white),
                ),
          actions: <Widget>[
            isSearching
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                      });
                    },
                    icon: Icon(Icons.cancel))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    },
                    icon: Icon(Icons.search))
          ],
        ),
        preferredSize: Size.fromHeight(65.0),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: countries.length > 0
            ? ListView.builder(
                itemCount: countries.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MapScreen(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 8.0),
                        child: Text(countries[index]),
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
