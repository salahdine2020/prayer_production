import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as english_words;
import 'package:prayer_production/controller/api_provider.dart';
import 'package:prayer_production/views/mosques_list.dart';

// Adapted from search demo in offical flutter gallery:
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/search_demo.dart
class AppBarSearchExample extends StatefulWidget {
  const AppBarSearchExample({Key key}) : super(key: key);

  @override
  _AppBarSearchExampleState createState() => _AppBarSearchExampleState();
}

class _AppBarSearchExampleState extends State<AppBarSearchExample> {
  final List<String> kPostalList; // should contain list of mosques
  _MySearchDelegate _delegate;
  final List<String> postal_codes = [];
  _AppBarSearchExampleState()
      :
    /// here you should inject values into list
        kPostalList = List.from(Set.from(
          //english_words.all
          List.generate(10000, (index) => index.toString()),
        ))
          ..sort(
            (w1, w2) => w1.toLowerCase().compareTo(
                  w2.toLowerCase(),
                ),
          ),
        super();

  @override
  void initState() {
    super.initState();
    _delegate = _MySearchDelegate(kPostalList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.search),
//        backgroundColor: Colors.teal,
//        foregroundColor: Colors.white,
//        onPressed: () async {
//          //PrayerProvider().getUrlInformation();
//          final String selected = await showSearch<String>(
//            context: context,
//            delegate: _delegate,
//          );
//          if (selected != null) {
//            ScaffoldMessenger.of(context).showSnackBar(
//              SnackBar(
//                content: Text('You have selected the word: $selected'),
//              ),
//            );
//          }
//        },
//      ),
      appBar: AppBar(
        // backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text('Cherche {code postale}', style: TextStyle(color: Colors.teal),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            tooltip: 'GET',
            icon: const Icon(Icons.search, color: Colors.teal, size: 28,),
            onPressed: () async {
              final String selected = await showSearch<String>(
                context: context,
                delegate: _delegate,
              );
              if (selected != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You have selected the word: $selected'),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/images/prayer_mosque.png'),
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                'cherche le mosquée le plus proche en utilisant le code postal',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
//        ListView.builder(
//          itemCount: kEnglishWords.length,
//          itemBuilder: (context, idx) => ListTile(
//            title: Text(kEnglishWords[idx]),
//          ),
//        ),
      ),
    );
  }
}

// Defines the content of the search page in `showSearch()`.
// SearchDelegate has a member `query` which is the query string.
class _MySearchDelegate extends SearchDelegate<String> {
  final List<String>
      _words; // you should extract from list of exicte potale in belgim
  final List<String> _history;

  _MySearchDelegate(List<String> words)
      : _words = words,
        _history = <String>['1300', '1650', '1700', '1800'],
        super();

  // Leading icon in search bar.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
        this.close(context, null);
      },
    );
  }

  // Widget of result page.
  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('les mosque dans cette region : '),
            GestureDetector(
              onTap: () {
                // Returns this.query as result to previous screen, c.f.
                // `showSearch()` above.
                this.close(context, this.query);
              },
              child: Text(
                this.query,
                style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing (this.query).
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where(
            (word) => word.startsWith(query),
          );
    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isEmpty)
        Container()
      else
        IconButton(
          tooltip: 'Clear',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        )
    ];
  }
}

// Suggestions list widget displayed in the search page.
class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty
              ? const Icon(Icons.history)
              : const Icon(Icons.update),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () async {
            /// suggestion contain the postal code
            /*
            print('-------suggestion list is : $suggestion--------');
            List<String> list_add = [];
            var list_inf = await PrayerProvider().PostSearchMosque(postal_code: '${suggestion.toString()}');
            //onSelected(suggestion);
            list_inf.forEach((e) {
              list_add.add(e.adresse.toString());
              onSelected(e.adresse);
            });
            */
            var list_inf = await PrayerProvider().PostSearchMosques(postal_code: '${suggestion.toString()}');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MosquesList(
                  list_mosques: list_inf,
                ),
              ),
            );

            //onSelected(suggestion); /// suggestion
          },
        );
      },
    );
  }
}
