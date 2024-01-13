import 'package:booklyapp/Features/Search/View_model/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFormSearch extends StatelessWidget {
  const CustomTextFormSearch({
    super.key,
    required this.textcontroller,
  });

  final TextEditingController textcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        BlocProvider.of<SearchCubit>(context).fetchSearchBooks(value);
      },
      controller: textcontroller,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                BlocProvider.of<SearchCubit>(context)
                    .fetchSearchBooks(textcontroller.text);
              },
              icon: const Icon(Icons.search)),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
          label: const Text("Enter The Book Neam")),
    );
  }
}
