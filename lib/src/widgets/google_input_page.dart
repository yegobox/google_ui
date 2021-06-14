import 'package:flutter/material.dart';

import '../../google_ui.dart';

class GoogleInputPage extends StatelessWidget {
  const GoogleInputPage({
    Key? key,
    required this.title,
    this.subtitle,
    this.appBarTitleOnEditPrefix = "Edit",
    this.appBarTitleOnAddPrefix = "Add",
    required this.isEdit,
    required this.isLoading,
    required this.isProgressLoading,
    required this.errorPage,
    required this.onSaved,
    this.actions,
    required this.child,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? appBarTitleOnEditPrefix;
  final String? appBarTitleOnAddPrefix;
  final bool isEdit;
  final bool isLoading;
  final bool isProgressLoading;
  final Widget? errorPage;
  final Future<GoogleListItem?> Function()? onSaved;
  final List<Widget>? actions;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _PageAppBar(
        title: title,
        subtitle: subtitle,
        appBarTitleOnEditPrefix: appBarTitleOnEditPrefix,
        appBarTitleOnAddPrefix: appBarTitleOnAddPrefix,
        isLoading: isLoading,
        errorPage: errorPage,
        isEdit: isEdit,
        onSaved: onSaved,
        actions: actions,
      ),
      body: _PageBody(
        title: title,
        isLoading: isLoading,
        isProgressLoading: isProgressLoading,
        errorPage: errorPage,
        child: child,
      ),
    );
  }
}

class _SaveIconButton extends StatelessWidget {
  const _SaveIconButton({
    Key? key,
    required this.onSaved,
    required this.isEdit,
  }) : super(key: key);

  final Future<GoogleListItem?> Function() onSaved;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      icon: Icon(Icons.check, color: colorScheme.primary),
      onPressed: () => _onSavePressed(context),
    );
  }

  Future _onSavePressed(BuildContext context) async {
    final result = await onSaved();
    if (result != null) {
      Navigator.of(context).pop(result.copyWith(
        state: isEdit ? GoogleListItemState.update : GoogleListItemState.insert,
      ));
    }
  }
}

class _PageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PageAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.appBarTitleOnEditPrefix,
    required this.appBarTitleOnAddPrefix,
    required this.errorPage,
    required this.isLoading,
    required this.isEdit,
    required this.onSaved,
    required this.actions,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? appBarTitleOnEditPrefix;
  final String? appBarTitleOnAddPrefix;
  final Widget? errorPage;
  final bool isLoading;
  final bool isEdit;
  final Future<GoogleListItem?> Function()? onSaved;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return GoogleConditional(
      condition: isLoading || errorPage != null,
      onTrue: const GoogleAppBar(),
      onFalse: GoogleAppBar(
        title:
            "${isEdit ? appBarTitleOnEditPrefix : appBarTitleOnAddPrefix} $title",
        subtitle: subtitle,
        actions: [
          if (onSaved != null)
            _SaveIconButton(onSaved: onSaved!, isEdit: isEdit),
          if (actions != null) ...actions!
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _PageBody extends StatelessWidget {
  const _PageBody({
    Key? key,
    required this.title,
    required this.errorPage,
    required this.isLoading,
    required this.isProgressLoading,
    this.child,
  }) : super(key: key);

  final String? title;
  final bool isLoading;
  final bool isProgressLoading;
  final Widget? errorPage;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GoogleConditional(
      condition: isLoading,
      onTrue: const Center(child: CircularProgressIndicator()),
      onFalse: GoogleConditional(
        condition: errorPage != null,
        onTrue: errorPage ?? Container(),
        onFalse: Column(
          children: [
            if (isProgressLoading) const LinearProgressIndicator(),
            Expanded(child: SingleChildScrollView(child: child)),
          ],
        ),
      ),
    );
  }
}
