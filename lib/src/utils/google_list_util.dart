import '../models/index.dart';

class GoogleListUtil {
  GoogleListUtil({
    required this.googleListItem,
    required this.googleListItems,
  });

  final GoogleListItem googleListItem;
  final List<GoogleListItem> googleListItems;

  List<GoogleListItem> _insertItem() {
    return [googleListItem, ...googleListItems];
  }

  List<GoogleListItem> _updateItem() {
    final index = googleListItems.indexWhere((e) => e.id == googleListItem.id);
    googleListItems[index] = googleListItem;
    return googleListItems;
  }

  List<GoogleListItem> _removeItem() {
    final index = googleListItems.indexWhere((e) => e.id == googleListItem.id);
    googleListItems.removeAt(index);
    return googleListItems;
  }

  List<GoogleListItem>? generateNewList() {
    switch (googleListItem.state) {
      case GoogleListItemState.insert:
        return _insertItem();

      case GoogleListItemState.update:
        return _updateItem();

      case GoogleListItemState.delete:
        return _removeItem();

      default:
        return null;
    }
  }
}
