import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/bloc/bloc/search_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/bloc/search_event.dart';
import 'package:rick_and_morty/feature/presentation/bloc/bloc/search_state.dart';
import 'package:rick_and_morty/feature/presentation/widgets/search_result.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate() : super(searchFieldLabel: 'Search for characters...');
  final _suggestions = [
    'Rick',
    'Morty',
    'Summer',
    'Beth',
    'Jerry',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(
        Icons.arrow_back_outlined,
      ),
      tooltip: 'Back',
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print('Inside custom search delegate search query is $query ');
    BlocProvider.of<PersonSearchBloc>(context, listen: false)
        .add(SearchPersons(query));
    return BlocBuilder<PersonSearchBloc, PersonSearchState>(
      builder: (context, state) {
        if (state is PersonSearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PersonSearchLoaded) {
          final person = state.persons;
          if (person.isEmpty) {
            return _showErrortext('No characters with that name found');
          }
          return ListView.builder(
            itemCount: person.isNotEmpty ? person.length : 0,
            itemBuilder: (context, int index) {
              PersonEntity result = person[index];
              return SearchResult(personResult: result);
            },
          );
        } else if (state is PersonSearchError) {
          _showErrortext(state.message);
        } else {
          return const Center(
            child: Icon(Icons.now_wallpaper),
          );
        }
        return const Text('error');
      },
    );
  }

  Widget _showErrortext(String errorText) {
    return Container(
      color: Colors.black,
      child: Center(
          child: Text(
        errorText,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return Container();
    }
    return ListView.separated(
      itemBuilder: (context, index) {
        return Text(
          _suggestions[index],
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: _suggestions.length,
    );
  }
}
