import 'package:dream_dictionary/bloc/dream_list_bloc.dart';
import 'package:dream_dictionary/constants/colors.dart';
import 'package:dream_dictionary/constants/dimens.dart';
import 'package:dream_dictionary/widgets/background.dart';
import 'package:dream_dictionary/widgets/dream_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DreamListPage extends StatelessWidget {
  final int? headerId;
  final String? search;
  const DreamListPage({super.key, this.headerId, this.search});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DreamListBloc(headerId: headerId, search: search),
      child: Consumer<DreamListBloc>(
        builder: (context, bloc, child) => Scaffold(
          body: Stack(children: [
            const BackgroundView(),
            Column(
              children: [
                Expanded(
                  child: (bloc.dreamList?.isEmpty ?? false)
                      ? Center(
                          child: Container(
                            padding: const EdgeInsets.all(MARGIN_XLARGE),
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  color: AUTOCOMPLETE_OPTIONS_COLOR,
                                  size: MARGIN_XLARGE,
                                ),
                                Text(
                                  'No Dream\nFound',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: AUTOCOMPLETE_OPTIONS_COLOR),
                                )
                              ],
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: MARGIN_MEDIUM_2x,
                              vertical: MARGIN_LARGE),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: bloc.dreamList?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: MARGIN_SMALL),
                                child: DreamItem(
                                    text: bloc.dreamList?[index].blogContent ??
                                        '',
                                    textAlign: TextAlign.left,
                                    onTap: () {}),
                              );
                            },
                          ),
                        ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
