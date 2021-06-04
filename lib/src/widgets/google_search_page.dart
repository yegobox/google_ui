import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../google_ui.dart';

class GoogleSearchPage extends StatelessWidget {
  const GoogleSearchPage({
    Key? key,
    required this.title,
    this.searchHintPrefix = "Search",
    required this.isLoading,
    required this.googleListItems,
    required this.errorPage,
    required this.keyboardType,
    required this.onFieldSubmitted,
    required this.onClearPressed,
  }) : super(key: key);

  final String? title;
  final String searchHintPrefix;
  final bool isLoading;
  final List<GoogleListItem> googleListItems;
  final Widget? errorPage;
  final TextInputType? keyboardType;
  final Future Function(String)? onFieldSubmitted;
  final void Function()? onClearPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _PageAppBar(
        title: title,
        searchHintPrefix: searchHintPrefix,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        onClearPressed: onClearPressed,
      ),
      body: _PageBody(
        title: title,
        isLoading: isLoading,
        googleListItems: googleListItems,
        errorPage: errorPage,
      ),
    );
  }
}

class _PageAppBar extends HookWidget implements PreferredSizeWidget {
  const _PageAppBar({
    Key? key,
    required this.title,
    required this.searchHintPrefix,
    required this.keyboardType,
    required this.onFieldSubmitted,
    required this.onClearPressed,
  }) : super(key: key);

  final String? title;
  final String searchHintPrefix;
  final TextInputType? keyboardType;
  final Future Function(String)? onFieldSubmitted;
  final void Function()? onClearPressed;

  @override
  Widget build(BuildContext context) {
    final searchFieldController = useState(TextEditingController());

    return GoogleAppBar(
      customTitle: TextFormField(
        controller: searchFieldController.value,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: "$searchHintPrefix $title...",
        ),
        onFieldSubmitted: onFieldSubmitted,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            searchFieldController.value.clear();
            if (onClearPressed != null) onClearPressed!();
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _PageBody extends StatelessWidget {
  const _PageBody({
    Key? key,
    this.title,
    required this.isLoading,
    required this.googleListItems,
    required this.errorPage,
  }) : super(key: key);

  final String? title;
  final bool isLoading;
  final List<GoogleListItem> googleListItems;
  final Widget? errorPage;

  @override
  Widget build(BuildContext context) {
    return GoogleConditional(
      condition: isLoading,
      onTrue: const Center(child: CircularProgressIndicator()),
      onFalse: GoogleConditional(
        condition: errorPage != null,
        onTrue: errorPage ?? Container(),
        onFalse: _ListView(googleListItems: googleListItems),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    Key? key,
    required this.googleListItems,
  }) : super(key: key);

  final List<GoogleListItem> googleListItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: googleListItems.length,
      itemBuilder: (context, index) {
        final googleListItem = googleListItems[index];
        return ListTile(
          leading: googleListItem.icon,
          title: GoogleText(googleListItem.title),
          subtitle: GoogleConditional.isTrue(
            condition: googleListItem.subtitle != null,
            onTrue: GoogleText(googleListItem.subtitle ?? ""),
          ),
          onTap: () => _onListTilePressed(context, googleListItem.page!),
        );
      },
    );
  }

  Future _onListTilePressed(BuildContext context, Widget detailPage) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => detailPage),
    );

    Navigator.of(context).pop(result);
  }
}
