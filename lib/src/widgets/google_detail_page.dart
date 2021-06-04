import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../models/index.dart';
import 'index.dart';

class GoogleDetailPage extends HookWidget {
  const GoogleDetailPage({
    Key? key,
    required this.title,
    this.subtitle,
    required this.inputPage,
    required this.errorPage,
    required this.isProgressLoading,
    required this.isLoading,
    this.googlePopupItems,
    required this.onDeleted,
    required this.onRefresh,
    this.popupEditLabel = "Edit",
    this.popupDeleteLabel = "Delete",
    this.deleteDialogTitlePrefix = "Delete",
    this.deleteDialogSubtitleSufix = "will be permanently deleted",
    this.deleteDialogConfirmLabel = "DELETE",
    this.deleteDialogCancelLabel = "CANCEL",
    required this.child,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final Widget? inputPage;
  final Widget? errorPage;
  final bool isProgressLoading;
  final bool isLoading;
  final List<GooglePopupItem>? googlePopupItems;
  final Future<GoogleListItem?> Function()? onDeleted;
  final Future Function() onRefresh;
  final String popupEditLabel;
  final String popupDeleteLabel;
  final String deleteDialogTitlePrefix;
  final String deleteDialogSubtitleSufix;
  final String deleteDialogConfirmLabel;
  final String deleteDialogCancelLabel;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final result = useState<GoogleListItem?>(null);

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(result.value);
        return false;
      },
      child: Scaffold(
        appBar: _PageAppBar(
          isLoading: isLoading,
          errorPage: errorPage,
          title: title,
          subtitle: subtitle,
          inputPage: inputPage,
          googlePopupItems: googlePopupItems,
          onDeleted: onDeleted,
          onRefresh: onRefresh,
          result: result,
          popupEditLabel: popupEditLabel,
          popupDeleteLabel: popupDeleteLabel,
          deleteDialogTitlePrefix: deleteDialogTitlePrefix,
          deleteDialogSubtitleSufix: deleteDialogSubtitleSufix,
          deleteDialogConfirmLabel: deleteDialogConfirmLabel,
          deleteDialogCancelLabel: deleteDialogCancelLabel,
        ),
        body: _PageBody(
          title: title,
          errorPage: errorPage,
          isProgressLoading: isProgressLoading,
          isLoading: isLoading,
          onRefresh: onRefresh,
          child: child,
        ),
      ),
    );
  }
}

class _PageAppBar extends HookWidget implements PreferredSizeWidget {
  const _PageAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.inputPage,
    required this.errorPage,
    required this.isLoading,
    required this.googlePopupItems,
    required this.onDeleted,
    required this.onRefresh,
    required this.result,
    required this.popupEditLabel,
    required this.popupDeleteLabel,
    required this.deleteDialogTitlePrefix,
    required this.deleteDialogSubtitleSufix,
    required this.deleteDialogConfirmLabel,
    required this.deleteDialogCancelLabel,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final Widget? inputPage;
  final Widget? errorPage;
  final bool isLoading;
  final List<GooglePopupItem>? googlePopupItems;
  final Future<GoogleListItem?> Function()? onDeleted;
  final Future Function() onRefresh;
  final ValueNotifier<GoogleListItem?> result;
  final String popupEditLabel;
  final String popupDeleteLabel;
  final String deleteDialogTitlePrefix;
  final String deleteDialogSubtitleSufix;
  final String deleteDialogConfirmLabel;
  final String deleteDialogCancelLabel;

  @override
  Widget build(BuildContext context) {
    return GoogleConditional(
      condition: isLoading || errorPage != null,
      onTrue: const GoogleAppBar(),
      onFalse: GoogleAppBar(
        title: title,
        subtitle: subtitle,
        actions: [
          if (inputPage != null ||
              googlePopupItems != null ||
              onDeleted != null)
            PopupMenuButtonWidget(
              title: title,
              inputPage: inputPage,
              googlePopupItems: googlePopupItems,
              onDeleted: onDeleted,
              onRefresh: onRefresh,
              result: result,
              popupEditLabel: popupEditLabel,
              popupDeleteLabel: popupDeleteLabel,
              deleteDialogTitlePrefix: deleteDialogTitlePrefix,
              deleteDialogSubtitleSufix: deleteDialogSubtitleSufix,
              deleteDialogConfirmLabel: deleteDialogConfirmLabel,
              deleteDialogCancelLabel: deleteDialogCancelLabel,
            )
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
    this.title,
    this.errorPage,
    required this.isProgressLoading,
    required this.isLoading,
    required this.onRefresh,
    this.child,
  }) : super(key: key);

  final String? title;
  final Widget? errorPage;
  final bool isProgressLoading;
  final bool isLoading;
  final Future Function() onRefresh;
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
            Expanded(
              child: RefreshIndicator(
                onRefresh: onRefresh,
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopupMenuButtonWidget extends HookWidget {
  const PopupMenuButtonWidget({
    Key? key,
    required this.title,
    required this.inputPage,
    required this.googlePopupItems,
    required this.onDeleted,
    required this.onRefresh,
    required this.result,
    required this.popupEditLabel,
    required this.popupDeleteLabel,
    required this.deleteDialogTitlePrefix,
    required this.deleteDialogSubtitleSufix,
    required this.deleteDialogConfirmLabel,
    required this.deleteDialogCancelLabel,
  }) : super(key: key);

  final String? title;
  final Widget? inputPage;
  final List<GooglePopupItem>? googlePopupItems;
  final Future<GoogleListItem?> Function()? onDeleted;
  final Future Function() onRefresh;
  final ValueNotifier<GoogleListItem?> result;
  final String popupEditLabel;
  final String popupDeleteLabel;
  final String deleteDialogTitlePrefix;
  final String deleteDialogSubtitleSufix;
  final String deleteDialogConfirmLabel;
  final String deleteDialogCancelLabel;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<void Function()>(
      itemBuilder: (context) {
        return [
          if (inputPage != null)
            PopupMenuItem(
              value: () => _onEditPressed(context: context),
              child: GoogleText(popupEditLabel),
            ),
          if (googlePopupItems != null)
            ...googlePopupItems!.map((e) => PopupMenuItem(
                  value: e.onPressed,
                  child: GoogleText(e.label),
                )),
          if (onDeleted != null)
            PopupMenuItem(
              value: () => _onDeletePressed(context: context),
              child: GoogleText(popupDeleteLabel),
            ),
        ];
      },
      onSelected: (value) => value(),
    );
  }

  Future _onEditPressed({required BuildContext context}) async {
    final GoogleListItem? result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => inputPage!),
    );

    if (result != null) await onRefresh();
    this.result.value = result;
  }

  void _onDeletePressed({required BuildContext context}) {
    return GoogleDialog().showConfirmation(
      context,
      title: "$deleteDialogTitlePrefix ${(title ?? "").toLowerCase()}",
      subtitle: "$title $deleteDialogSubtitleSufix",
      confirmLabel: deleteDialogConfirmLabel,
      cancelLabel: deleteDialogCancelLabel,
      onConfirm: () async {
        final navigator = Navigator.of(context);
        navigator.pop();
        if (onDeleted != null) {
          final result = await onDeleted!();
          if (result != null) {
            navigator.pop(result.copyWith(state: GoogleListItemState.delete));
          }
        }
      },
    );
  }
}
