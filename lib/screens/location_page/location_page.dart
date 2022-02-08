import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

class LocationSearchPage extends SearchDelegate {
  Box<ModelPrayingTimes> pray_times = Boxes.getTime();

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              query = '';
            },
            icon: Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List suggestions = Locations.viloyatlar.where((element) {
      final result = element.toLowerCase().toString();
      final input = query.toLowerCase().toString();
      return result.contains(input);
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () async {
              query = suggestions[index];
              List<ModelPrayingTimes> datas = [];

              await pray_times.clear();
              await ServicePrayingTimes.getTimes(query)
                  .then((value) => datas = value);
              datas.sort((a, b) {
                var aDate = a.date;
                var bDate = b.date;
                return aDate!.compareTo(bDate!);
              });
              for (ModelPrayingTimes model in datas) {
                await pray_times.add(model);
              }

              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
            },
            title: Text("${suggestions[index]} nomoz vaqtlariga o'tish"),
          );
        });
  }
}
