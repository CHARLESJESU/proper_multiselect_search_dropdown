import 'package:flutter/material.dart';

/// A customizable single-select dropdown widget with optional search functionality
class ProperSingleSelectDropdown extends StatefulWidget {
  /// List of items where each item is [title] or [title, subtitle]
  /// Example: [['CAR001']] or [['CAR001', '\$ 25,000']]
  final List<List<String>> items;

  /// Callback fired when selection changes
  /// Returns the selected item as List<String> or null if cleared
  final Function(List<String>?)? onSelectionChanged;

  /// Hint text shown when no item is selected
  final String hintText;

  /// Enable/disable search functionality (default: true)
  final bool enableSearch;

  /// Maximum height of the dropdown list
  final double maxHeight;

  /// Background color of the dropdown button
  final Color? backgroundColor;

  /// Border color of the dropdown
  final Color? borderColor;

  /// Custom icon for search (optional)
  final IconData? searchIcon;

  /// Custom icon for clear (optional)
  final IconData?  clearIcon;

  /// Custom icon for dropdown arrow down (optional)
  final IconData? arrowDownIcon;

  /// Custom icon for dropdown arrow up (optional)
  final IconData?  arrowUpIcon;

  /// Size of icons
  final double iconSize;

  /// Color of icons
  final Color? iconColor;

  /// Text style for selected item text
  final TextStyle? selectedItemTextStyle;

  /// Text style for hint text
  final TextStyle? hintTextStyle;

  /// Text style for list item titles
  final TextStyle? titleTextStyle;

  /// Text style for list item subtitles (when provided)
  final TextStyle? subtitleTextStyle;

  /// Text style for highlighted search text in title
  final TextStyle? highlightedTitleTextStyle;

  /// Text style for highlighted search text in subtitle
  final TextStyle? highlightedSubtitleTextStyle;

  /// Separator between title and subtitle (default: " - ")
  final String titleSubtitleSeparator;

  /// Show subtitle below title (two-line) or inline (single-line with separator)
  final bool showSubtitleBelow;

  /// Search box decoration
  final InputDecoration? searchBoxDecoration;

  /// Search box text style
  final TextStyle? searchBoxTextStyle;

  /// Search box background color
  final Color? searchBoxBackgroundColor;

  /// Search box border radius
  final double searchBoxBorderRadius;

  /// Search box focused border color
  final Color? searchBoxFocusedBorderColor;

  /// Search box enabled border color
  final Color? searchBoxEnabledBorderColor;

  /// Dropdown border radius
  final double dropdownBorderRadius;

  /// Dropdown elevation
  final double dropdownElevation;

  /// Auto-close dropdown after selection
  final bool autoCloseOnSelect;

  /// Show clear button when item is selected
  final bool showClearButton;

  const ProperSingleSelectDropdown({
    super.key,
    required this.items,
    this.onSelectionChanged,
    this.hintText = 'Select Item',
    this.enableSearch = true,
    this.maxHeight = 250,
    this.backgroundColor,
    this.borderColor,
    this.searchIcon,
    this. clearIcon,
    this.arrowDownIcon,
    this. arrowUpIcon,
    this.iconSize = 24,
    this.iconColor,
    this.selectedItemTextStyle,
    this.hintTextStyle,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.highlightedTitleTextStyle,
    this.highlightedSubtitleTextStyle,
    this.titleSubtitleSeparator = ' - ',
    this.showSubtitleBelow = false,
    this.searchBoxDecoration,
    this.searchBoxTextStyle,
    this.searchBoxBackgroundColor,
    this.searchBoxBorderRadius = 8.0,
    this.searchBoxFocusedBorderColor,
    this.searchBoxEnabledBorderColor,
    this.dropdownBorderRadius = 8.0,
    this. dropdownElevation = 4.0,
    this.autoCloseOnSelect = true,
    this.showClearButton = true,
  });

  @override
  State<ProperSingleSelectDropdown> createState() => _ProperSingleSelectDropdownState();
}

class _ProperSingleSelectDropdownState extends State<ProperSingleSelectDropdown> {
  final TextEditingController _searchController = TextEditingController();
  int? _selectedIndex;
  List<List<String>> _filteredItems = [];
  bool _isDropdownOpen = false;
  final FocusNode _searchFocusNode = FocusNode();
  final GlobalKey _dropdownButtonKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(widget.items);
    if (widget.enableSearch) {
      _searchController.addListener(() {
        setState(() {}); // Rebuild to show/hide clear icon
      });
    }
  }

  @override
  void didUpdateWidget(ProperSingleSelectDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget. items != widget.items) {
      _filteredItems = List.from(widget.items);
      // Clear selection if index is no longer valid
      if (_selectedIndex != null && _selectedIndex!  >= widget.items.length) {
        _selectedIndex = null;
      }
    }
  }

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
      if (! _isDropdownOpen) {
        if (widget.enableSearch) {
          _searchController.clear();
          _filteredItems = List.from(widget.items);
          _searchFocusNode.unfocus();
        }
      } else {
        // Focus search field when dropdown opens (only if search is enabled)
        if (widget.enableSearch) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _searchFocusNode.requestFocus();
          });
        }
      }
    });
  }

  void _filterItems(String query) {
    if (! widget.enableSearch) return;

    setState(() {
      if (query.isEmpty) {
        _filteredItems = List.from(widget.items);
      } else {
        final lowerQuery = query.toLowerCase();
        _filteredItems = widget. items.where((item) {
          if (item. isEmpty) return false;

          // Search in title
          final titleMatch = item[0].toLowerCase().contains(lowerQuery);

          // Search in subtitle if exists
          final subtitleMatch = item. length > 1 &&
              item[1].toLowerCase(). contains(lowerQuery);

          return titleMatch || subtitleMatch;
        }).toList();

        // Sort: exact matches first, then starts-with, then contains
        _filteredItems.sort((a, b) {
          final aTitle = a[0].toLowerCase();
          final bTitle = b[0].toLowerCase();
          final aExact = aTitle == lowerQuery;
          final bExact = bTitle == lowerQuery;
          final aStarts = aTitle.startsWith(lowerQuery);
          final bStarts = bTitle.startsWith(lowerQuery);

          if (aExact && ! bExact) return -1;
          if (!aExact && bExact) return 1;
          if (aStarts && !bStarts) return -1;
          if (!aStarts && bStarts) return 1;
          return a[0].compareTo(b[0]);
        });
      }
    });
  }

  void _selectItem(int index) {
    setState(() {
      _selectedIndex = index;
      _notifySelectionChanged();

      // Auto-close dropdown after selection
      if (widget.autoCloseOnSelect) {
        _isDropdownOpen = false;
        if (widget.enableSearch) {
          _searchController.clear();
          _filteredItems = List. from(widget.items);
          _searchFocusNode.unfocus();
        }
      }
    });
  }

  void _clearSelection() {
    setState(() {
      _selectedIndex = null;
      _notifySelectionChanged();
    });
  }

  void _notifySelectionChanged() {
    if (widget.onSelectionChanged != null) {
      final selectedItem = _selectedIndex != null && _selectedIndex! < widget.items.length
          ? widget.items[_selectedIndex!]
          : null;
      widget.onSelectionChanged!(selectedItem);
    }
  }

  String _getSelectedText() {
    if (_selectedIndex == null || _selectedIndex! >= widget.items.length) {
      return widget.hintText;
    }

    final item = widget.items[_selectedIndex!];
    if (item.isEmpty) return widget.hintText;

    // Show title only, or title + subtitle based on layout
    if (item.length > 1 && item[1].isNotEmpty) {
      return '${item[0]}${widget.titleSubtitleSeparator}${item[1]}';
    }
    return item[0];
  }

  Widget _buildHighlightedText(String text, String query, TextStyle baseStyle, TextStyle? highlightStyle) {
    // Only highlight if search is enabled and query is not empty
    if (!widget.enableSearch || query.isEmpty) {
      return Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: baseStyle,
      );
    }

    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();
    final spans = <TextSpan>[];
    var startIndex = 0;

    final effectiveHighlightStyle = highlightStyle ??
        baseStyle.copyWith(
          backgroundColor: Colors.yellow[200],
          fontWeight: FontWeight.bold,
        );

    while (startIndex < text.length) {
      final index = lowerText.indexOf(lowerQuery, startIndex);
      if (index == -1) {
        spans.add(TextSpan(text: text.substring(startIndex)));
        break;
      }
      if (index > startIndex) {
        spans.add(TextSpan(text: text.substring(startIndex, index)));
      }
      spans.add(TextSpan(
        text: text.substring(index, index + query.length),
        style: effectiveHighlightStyle,
      ));
      startIndex = index + query.length;
    }

    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: baseStyle,
        children: spans,
      ),
    );
  }

  Widget _buildListItemContent(List<String> item, String query) {
    if (item.isEmpty) {
      return const SizedBox.shrink();
    }

    final title = item[0];
    final hasSubtitle = item.length > 1 && item[1].isNotEmpty;

    final effectiveTitleStyle = widget.titleTextStyle ??
        const TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500);

    final effectiveSubtitleStyle = widget. subtitleTextStyle ??
        TextStyle(fontSize: 13, color: Colors.grey[600]);

    if (! hasSubtitle) {
      // Only title
      return _buildHighlightedText(
        title,
        query,
        effectiveTitleStyle,
        widget.highlightedTitleTextStyle,
      );
    }

    final subtitle = item[1];

    if (widget.showSubtitleBelow) {
      // Two-line layout (title above, subtitle below)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHighlightedText(
            title,
            query,
            effectiveTitleStyle,
            widget.highlightedTitleTextStyle,
          ),
          const SizedBox(height: 4),
          _buildHighlightedText(
            subtitle,
            query,
            effectiveSubtitleStyle,
            widget. highlightedSubtitleTextStyle,
          ),
        ],
      );
    } else {
      // Single-line layout with separator
      return RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
          // Build title with highlighting
          ..._buildHighlightedTextSpans(
          title,
          query,
          effectiveTitleStyle,
          widget.highlightedTitleTextStyle,
        ),
        // Separator
        TextSpan(
          text: widget.titleSubtitleSeparator,
          style: effectiveTitleStyle,
        ),
        // Build subtitle with highlighting
        ..._buildHighlightedTextSpans(
      subtitle,
      query,
      effectiveSubtitleStyle,
      widget. highlightedSubtitleTextStyle,
      ),
    ],
    ),
    );
  }
  }

  List<TextSpan> _buildHighlightedTextSpans(
      String text,
      String query,
      TextStyle baseStyle,
      TextStyle? highlightStyle,
      ) {
    // Only highlight if search is enabled and query is not empty
    if (!widget.enableSearch || query.isEmpty) {
      return [TextSpan(text: text, style: baseStyle)];
    }

    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();
    final spans = <TextSpan>[];
    var startIndex = 0;

    final effectiveHighlightStyle = highlightStyle ??
        baseStyle.copyWith(
          backgroundColor: Colors. yellow[200],
          fontWeight: FontWeight.bold,
        );

    while (startIndex < text.length) {
      final index = lowerText.indexOf(lowerQuery, startIndex);
      if (index == -1) {
        spans.add(TextSpan(text: text.substring(startIndex), style: baseStyle));
        break;
      }
      if (index > startIndex) {
        spans.add(TextSpan(text: text.substring(startIndex, index), style: baseStyle));
      }
      spans.add(TextSpan(
        text: text.substring(index, index + query.length),
        style: effectiveHighlightStyle,
      ));
      startIndex = index + query.length;
    }

    return spans;
  }

  // Helper method to build icon with fallback
  Widget _buildIcon(IconData? customIcon, IconData defaultIcon, {double?  size, Color? color}) {
    final effectiveSize = size ?? widget.iconSize;
    final effectiveColor = color ?? widget.iconColor ??  Colors.grey[600];

    try {
      return Icon(
        customIcon ?? defaultIcon,
        size: effectiveSize,
        color: effectiveColor,
      );
    } catch (e) {
      // Fallback to text-based icon if Material icons fail to load
      String iconText = '? ';
      if (defaultIcon == Icons.search) iconText = '🔍';
      if (defaultIcon == Icons.clear) iconText = '✕';
      if (defaultIcon == Icons.arrow_drop_down) iconText = '▼';
      if (defaultIcon == Icons.arrow_drop_up) iconText = '▲';
      if (defaultIcon == Icons.search_off) iconText = '🔍';

      return Text(
        iconText,
        style: TextStyle(
          fontSize: effectiveSize * 0.8,
          color: effectiveColor,
        ),
      );
    }
  }

  // Calculate available height considering keyboard
  double _calculateMaxHeight(BuildContext context) {
    final RenderBox?  renderBox = _dropdownButtonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return widget.maxHeight;

    final position = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size. height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final dropdownButtonHeight = renderBox.size.height;

    // Calculate available space below the dropdown button
    final availableHeight = screenHeight - position.dy - dropdownButtonHeight - keyboardHeight - 20;

    // Return the smaller of available height or max height
    return availableHeight > 0 ? (availableHeight < widget.maxHeight ? availableHeight : widget.maxHeight) : 150;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = widget.borderColor ?? Colors. grey;
    final effectiveBackgroundColor = widget.backgroundColor ??  Colors.white;
    final calculatedMaxHeight = _calculateMaxHeight(context);

    final effectiveHintStyle = widget.hintTextStyle ??
        TextStyle(fontSize: 16, color: Colors.grey[600]);

    final effectiveSelectedStyle = widget.selectedItemTextStyle ??
        const TextStyle(fontSize: 16, color: Colors. black87);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
      // Dropdown Button
      Material(
      key: _dropdownButtonKey,
      color: Colors.transparent,
      child: InkWell(
        onTap: _toggleDropdown,
        borderRadius: BorderRadius.circular(widget.dropdownBorderRadius),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: effectiveBorderColor),
            borderRadius: BorderRadius.circular(widget.dropdownBorderRadius),
            color: effectiveBackgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  _getSelectedText(),
                  style: _selectedIndex == null
                      ? effectiveHintStyle
                      : effectiveSelectedStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_selectedIndex != null && widget.showClearButton)
                    GestureDetector(
                      onTap: () {
                        _clearSelection();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: _buildIcon(
                          widget. clearIcon,
                          Icons. clear,
                          size: 20,
                        ),
                      ),
                    ),
                  _buildIcon(
                    _isDropdownOpen ? widget.arrowUpIcon : widget.arrowDownIcon,
                    _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),

    // Dropdown Content
    if (_isDropdownOpen) ...[
    const SizedBox(height: 8),
    Material(
    elevation: widget.dropdownElevation,
    borderRadius: BorderRadius.circular(widget.dropdownBorderRadius),
    child: Container(
    decoration: BoxDecoration(
    border: Border.all(color: Colors.grey. shade300),
    borderRadius: BorderRadius.circular(widget.dropdownBorderRadius),
    color: Colors.white,
    ),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    // Search Field (only if search is enabled)
    if (widget.enableSearch)
    Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
    controller: _searchController,
    focusNode: _searchFocusNode,
    onChanged: _filterItems,
    style: widget.searchBoxTextStyle,
    decoration: widget.searchBoxDecoration ??
    InputDecoration(
    filled: true,
    fillColor: widget.searchBoxBackgroundColor ??  Colors.grey[50],
    isDense: true,
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(widget.searchBoxBorderRadius),
    borderSide: BorderSide(
    color: widget.searchBoxEnabledBorderColor ?? Colors. grey. shade300),
    ),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(widget.searchBoxBorderRadius),
    borderSide: BorderSide(
    color: widget.searchBoxEnabledBorderColor ?? Colors. grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(widget.searchBoxBorderRadius),
    borderSide: BorderSide(
    color: widget.searchBoxFocusedBorderColor ?? Colors.blue, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 12,
    ),
    hintText: 'Search.. .',
    hintStyle: TextStyle(color: Colors.grey[500]),
    prefixIcon: _buildIcon(
    widget. searchIcon,
    Icons. search,
    size: 22,
    ),
    suffixIcon: _searchController.text.isNotEmpty
    ? IconButton(
    icon: _buildIcon(
    widget.clearIcon,
    Icons. clear,
    size: 20,
    ),
    onPressed: () {
    _searchController.clear();
    _filterItems('');
    },
    padding: EdgeInsets.zero,
    constraints: const BoxConstraints(),
    )
        : null,
    ),
    ),
    ),

    // Results count (only if search is enabled)
    if (widget.enableSearch)
    Padding(
    padding: const EdgeInsets. symmetric(horizontal: 12, vertical: 4),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    '${_filteredItems.length} item(s) available',
    style: TextStyle(
    fontSize: 12,
    color: Colors. grey[600],
    fontStyle: FontStyle.italic,
    ),
    ),
    ],
    ),
    ),

    if (widget.enableSearch) const Divider(height: 1, thickness: 1),

    // Item List
    if (_filteredItems.isEmpty)
    Padding(
    padding: const EdgeInsets.all(32.0),
    child: Column(
    children: [
    _buildIcon(
    null,
    Icons.search_off,
    size: 48,
    color: Colors.grey[400],
    ),
    const SizedBox(height: 8),
    Text(
    widget.enableSearch ?  'No items found' : 'No items available',
    style: TextStyle(
    color: Colors.grey[600],
    fontSize: 14,
    ),
    ),
    ],
    ),
    )
    else
    ConstrainedBox(
    constraints: BoxConstraints(
    maxHeight: calculatedMaxHeight,
    minHeight: 100,
    ),
    child: ListView.builder(
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    physics: const AlwaysScrollableScrollPhysics(),
    itemCount: _filteredItems.length,
    itemBuilder: (context, index) {
    final item = _filteredItems[index];
    final originalIndex = widget.items.indexOf(item);
    final isSelected = _selectedIndex == originalIndex;

    return ListTile(
    dense: ! widget.showSubtitleBelow,
    title: _buildListItemContent(
    item,
    widget.enableSearch ? _searchController.text : ''
    ),
    selected: isSelected,
    selectedTileColor: Colors.blue.withOpacity(0.1),
    trailing: isSelected
    ? Icon(Icons.check, color: Colors.blue, size: 24)
        : null,
    onTap: () {
    _selectItem(originalIndex);
    },
    );
    },
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    ],
    );
    }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }
}