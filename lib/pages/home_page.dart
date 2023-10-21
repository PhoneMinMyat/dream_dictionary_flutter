import 'package:dream_dictionary/bloc/home_bloc.dart';
import 'package:dream_dictionary/constants/colors.dart';
import 'package:dream_dictionary/constants/dimens.dart';
import 'package:dream_dictionary/constants/strings.dart';
import 'package:dream_dictionary/model/vos/blog_detail.dart';
import 'package:dream_dictionary/pages/dream_list_page.dart';
import 'package:dream_dictionary/widgets/background.dart';
import 'package:dream_dictionary/widgets/dream_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundView(),
            SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MARGIN_MEDIUM_2x, vertical: MARGIN_MEDIUM),
                    child: SearchView(),
                  ),
                  Consumer<HomeBloc>(
                    builder: (context, bloc, child) => Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: MARGIN_MEDIUM_2x,
                            vertical: MARGIN_MEDIUM),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 10 / 4,
                                crossAxisSpacing: MARGIN_MEDIUM,
                                mainAxisSpacing: MARGIN_MEDIUM_2x),
                        itemCount: bloc.dreamHeader?.length ?? 0,
                        itemBuilder: (context, index) {
                          return DreamItem(
                            text: bloc.dreamHeader?[index].blogTitle ?? '',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DreamListPage(
                                        headerId:
                                            bloc.dreamHeader?[index].blogId,
                                      )));
                            },
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeBloc>(
      builder: (context, bloc, child) => Container(
        decoration: BoxDecoration(
            color: PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2x)),
        child: Autocomplete<BlogDetail>(
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return List.empty();
            } else {
              return bloc.dreamDetailList.where((element) =>
                  element.blogContent?.contains(textEditingValue.text) ??
                  false);
            }
          },
          displayStringForOption: (option) => option.blogContent ?? '',
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextField(
              onSubmitted: (value) {
                String search = value;
                textEditingController.clear();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DreamListPage(
                          search: search,
                        )));
              },
              controller: textEditingController,
              focusNode: focusNode,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  hintText: SEARCH,
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none),
            );
          },
          optionsViewBuilder: (context, onSelected, options) {
            return Material(
              color: Colors.transparent,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: (options.length > 5) ? 5 : options.length,
                itemBuilder: (context, index) {
                  String text = options.elementAt(index).blogContent ?? '';
                  return Container(
                      color: AUTOCOMPLETE_OPTIONS_COLOR,
                      padding: const EdgeInsets.symmetric(
                          vertical: MARGIN_MEDIUM_2x,
                          horizontal: MARGIN_MEDIUM),
                      child: Text(
                        text,
                        style: const TextStyle(color: Colors.white),
                      ));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
