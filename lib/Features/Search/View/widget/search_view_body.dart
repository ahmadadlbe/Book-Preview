import 'package:booklyapp/Features/Search/View/widget/custom_list_search.dart';
import 'package:booklyapp/Features/Search/View/widget/custom_text_form_search.dart';
import 'package:booklyapp/Features/Search/View_model/cubit/search_cubit.dart';
import 'package:booklyapp/Features/Search/View_model/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextFormSearch(textcontroller: textcontroller),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchStateSucsses) {
                return CustomListSearch(
                  state: state,
                );
              } else if (state is SearchStateFailure) {
                return Center(
                  child: Text(state.errorMesage),
                );
              } else if (state is SearchStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("Please Enter Woed to Search"),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
