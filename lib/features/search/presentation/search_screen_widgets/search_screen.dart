import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class SearchScreenWidget extends StatelessWidget {
  const SearchScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          InputFieldWidget(
              prefixicon: Icon(
                CupertinoIcons.search,
                color: Theme.of(context).colorScheme.secondary,
              ),
              hintColor: Theme.of(context).colorScheme.secondary,
              hintText: "Search for Activities",
              onChanged: (val) {}),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: List.generate(
                  2,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: "Indoor Friday Afternoon Games",
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            Image.asset(
                              "assets/images/go_icon.png",
                              width: 10,
                            )
                          ],
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
