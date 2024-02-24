import 'package:flutter/material.dart';
import 'package:my_sneakers/constants.dart';
import 'package:my_sneakers/data/dummy_data.dart';
import 'package:my_sneakers/models/shoes.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<String> categories = [
    'All',
    'Nike',
    'Adidas',
    'Puma',
    'Balenciaga',
    'Converse',
  ];

  var selectedCategory = 'All';

  List<Shoes> shoeList = [];

  @override
  void initState() {
    // filteredItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var filteredList = selectedCategory.isEmpty || selectedCategory == 'All'
        ? dummyData
        : dummyData.where((element) => element.id == selectedCategory).toList();

    shoeList = filteredList;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          Container(
            width: 55,
            margin: const EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.network(
                  AppColors.sampleImage,
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.cover,
                ),
              ),
              itemBuilder: (context) => [],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSearchBar(),
            const SizedBox(height: 20),
            Text(
              'Categories',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            buildCategoryButtons(),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: shoeList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8),
                itemBuilder: (ctx, index) => Card(
                  child: Column(
                    children: [
                      Text(shoeList[index].name),
                      Text(
                        shoeList[index].price.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return SearchAnchor(
      builder: ((context, controller) => SearchBar(
            controller: controller,
            hintText: 'Find shoes',
            trailing: [
              IconButton(
                onPressed: () {},
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
      suggestionsBuilder: ((context, controller) {
        return List<ListTile>.generate(5, (index) {
          return ListTile(
            title: Text('Item $index'),
          );
        });
      }),
    );
  }

  Widget buildCategoryButtons() {
    List<Widget> buttons = [];

    for (var category in categories) {
      buttons.add(
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(() {
              selectedCategory = category;

              print(selectedCategory);
            });
          },
          child: Text(category),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttons,
    );
  }
}
