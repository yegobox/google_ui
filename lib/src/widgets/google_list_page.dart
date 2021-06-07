import 'package:flutter/material.dart';

import '../../google_ui.dart';
import '../models/google_list_item.dart';
import '../utils/google_list_util.dart';

class GoogleListPage extends StatelessWidget {
  const GoogleListPage({
    Key? key,
    required this.title,
    this.subtitle,
    required this.isLoading,
    required this.googleListItems,
    required this.searchPage,
    required this.inputPage,
    required this.errorPage,
    required this.onRefresh,
    required this.onChanged,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final bool isLoading;
  final List<GoogleListItem> googleListItems;
  final Widget? searchPage;
  final Widget? inputPage;
  final Widget? errorPage;
  final Future<void> Function() onRefresh;
  final void Function(List<GoogleListItem>)? onChanged;

  @override
  Widget build(BuildContext context) {
    void onChangedGenerateNewList(GoogleListItem googleListItem) {
      if (onChanged != null) {
        onChanged!(GoogleListUtil(
          googleListItem: googleListItem,
          googleListItems: googleListItems,
        ).generateNewList()!);
      }
    }

    return Scaffold(
      appBar: _PageAppBar(
        title: title,
        subtitle: subtitle,
        isLoading: isLoading,
        searchPage: searchPage,
        errorPage: errorPage,
        onChanged: onChangedGenerateNewList,
      ),
      body: _PageBody(
        title: title,
        isLoading: isLoading,
        googleListItems: googleListItems,
        inputPage: inputPage,
        errorPage: errorPage,
        onRefresh: onRefresh,
        onChanged: onChangedGenerateNewList,
      ),
      floatingActionButton: GoogleConditional.isTrue(
        condition: !isLoading && errorPage == null && inputPage != null,
        onTrue: _PageFAB(
          inputPage: inputPage ?? Container(),
          onChanged: onChangedGenerateNewList,
        ),
      ),
    );
  }
}

class _PageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PageAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isLoading,
    required this.searchPage,
    required this.errorPage,
    required this.onChanged,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final bool isLoading;
  final Widget? searchPage;
  final Widget? errorPage;
  final void Function(GoogleListItem) onChanged;

  @override
  Widget build(BuildContext context) {
    return GoogleConditional(
      condition: isLoading || errorPage != null,
      onTrue: const GoogleAppBar(),
      onFalse: GoogleAppBar(
        title: title,
        subtitle: subtitle,
        actions: [
          if (searchPage != null)
            _SearchIconButton(
              searchPage: searchPage!,
              onChanged: onChanged,
            )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchIconButton extends StatelessWidget {
  const _SearchIconButton({
    Key? key,
    required this.searchPage,
    required this.onChanged,
  }) : super(key: key);

  final Widget searchPage;
  final void Function(GoogleListItem) onChanged;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () => _onSearchPressed(context),
    );
  }

  Future _onSearchPressed(BuildContext context) async {
    final GoogleListItem? result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => searchPage),
    );

    if (result != null) onChanged(result);
  }
}

class _PageBody extends StatelessWidget {
  const _PageBody({
    Key? key,
    required this.title,
    required this.isLoading,
    required this.googleListItems,
    required this.inputPage,
    required this.errorPage,
    required this.onRefresh,
    required this.onChanged,
  }) : super(key: key);

  final String? title;
  final bool isLoading;
  final List<GoogleListItem> googleListItems;
  final Widget? inputPage;
  final Widget? errorPage;
  final Future<void> Function() onRefresh;
  final void Function(GoogleListItem) onChanged;

  @override
  Widget build(BuildContext context) {
    return GoogleConditional(
      condition: isLoading,
      onTrue: const Center(child: CircularProgressIndicator()),
      onFalse: GoogleConditional(
        condition: errorPage != null,
        onTrue: errorPage ?? Container(),
        onFalse: RefreshIndicator(
          onRefresh: onRefresh,
          child: _ListView(
            googleListItems: googleListItems,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    Key? key,
    required this.googleListItems,
    required this.onChanged,
  }) : super(key: key);

  final List<GoogleListItem> googleListItems;
  final void Function(GoogleListItem) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: googleListItems.length,
      itemBuilder: (context, index) {
        final googleListItem = googleListItems[index];
        return _ListItem(
          index: index,
          googleListItem: googleListItem,
          onChanged: onChanged,
        );
      },
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.index,
    required this.googleListItem,
    required this.onChanged,
  }) : super(key: key);

  final int index;
  final GoogleListItem googleListItem;
  final void Function(GoogleListItem) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: googleListItem.icon,
      title: GoogleText(googleListItem.title),
      subtitle: GoogleConditional.isTrue(
        condition: googleListItem.subtitle != null,
        onTrue: GoogleText(
          googleListItem.subtitle ?? "",
          variant: GoogleTextVariant.bodyText2,
        ),
      ),
      onTap: () => _onListTilePressed(context),
    );
  }

  Future _onListTilePressed(BuildContext context) async {
    final GoogleListItem? result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => googleListItem.page!),
    );

    if (result != null) onChanged(result);
  }
}

class _PageFAB extends StatelessWidget {
  const _PageFAB({
    Key? key,
    required this.inputPage,
    required this.onChanged,
  }) : super(key: key);

  final Widget inputPage;
  final void Function(GoogleListItem) onChanged;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _onFABPressed(context),
      child: const Icon(Icons.add),
    );
  }

  Future _onFABPressed(BuildContext context) async {
    final GoogleListItem? result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => inputPage),
    );

    if (result != null) onChanged(result);
  }
}
