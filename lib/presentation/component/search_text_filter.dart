import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipe_state.dart';
import 'package:recipe_app/ui/color.dart';

import '../../ui/text.dart';

class SearchTextFilter extends StatelessWidget {
  final SearchRecipeState state;
  final void Function(String) onKeywordChanged;


  const SearchTextFilter({super.key, required this.state, required this.onKeywordChanged, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search recipe',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.grey,),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: onKeywordChanged,
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorStyles.primary100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/filter.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state.keyword.isEmpty ? 'Recent Search' : 'Search Result',
                style: TextStyles.normalTextBold,
              ),
              if (state.keyword.isNotEmpty)
                Text('${state.filterRecipes.length} results',
                style: TextStyles.smallerTextRegular.copyWith(
                  color: Colors.grey,
                ),)
            ],
          )
        ],
      ),
    );
  }
}
