# proper_multiselect_search_dropdown

A highly customizable dropdown package for Flutter with both **multi-select** and **single-select** options, featuring optional search functionality.

[![pub package](https://img.shields.io/pub/v/proper_multiselect_search_dropdown.svg)](https://pub.dev/packages/proper_multiselect_search_dropdown)
[![license](https://img.shields.io/github/license/CHARLESJESU/proper_multiselect_search_dropdown)](https://github.com/CHARLESJESU/proper_multiselect_search_dropdown/blob/main/LICENSE)

## ✨ Features

- ✅ **Multi-select & Single-select** - Two widgets for different use cases
- 🔍 **Optional search functionality** - Enable/disable with `enableSearch` parameter
- 🎯 **Real-time search** with text highlighting
- 🎨 **Highly customizable** - colors, styles, icons, layouts
- 📱 **Material Design** compliant
- ⌨️ **Keyboard-aware** - automatically adjusts when keyboard appears
- 🏷️ **Title & Subtitle support** - flexible single or dual value items
- 🔄 **Two layout modes** - inline or two-line subtitle display
- 💪 **Type-safe** and null-safe
- 🚀 **Easy to use** with sensible defaults

## 🚀 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  proper_multiselect_search_dropdown: ^1.0.3
```

Then run:

```bash
flutter pub get
```

## 📖 Usage

### Import

```dart
import 'package:proper_multiselect_search_dropdown/proper_multiselect_search_dropdown.dart';
```

---

## 🔢 Multi-Select Dropdown

### Basic Multi-Select (With Search)

```dart
ProperMultiSelectDropdown(
  items: const [
    ['CAR001', '\$ 25,000'],
    ['TRUCK002', '\$ 45,000'],
    ['BIKE003', '\$ 8,000'],
  ],
  hintText: 'Select Vehicles',
  enableSearch: true, // Search enabled (default)
  onSelectionChanged: (selectedItems) {
    print('Selected: $selectedItems');
  },
)
```

### Multi-Select WITHOUT Search

```dart
ProperMultiSelectDropdown(
  items: const [
    ['Option A'],
    ['Option B'],
    ['Option C'],
  ],
  hintText: 'Select Options',
  enableSearch: false, // Disable search
  selectedItemText: '{count} selected',
  onSelectionChanged: (selectedItems) {
    print('Selected: $selectedItems');
  },
)
```

### Customized Multi-Select

```dart
ProperMultiSelectDropdown(
  items: const [
    ['Diamond', '\$ 99/mo'],
    ['Gold', '\$ 49/mo'],
    ['Silver', '\$ 29/mo'],
  ],
  hintText: 'Choose Plans',
  enableSearch: true,
  selectedItemText: '{count} plan(s) selected',
  
  // Text Styles
  titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  subtitleTextStyle: const TextStyle(fontSize: 14, color: Colors. green),
  highlightedTitleTextStyle: TextStyle(backgroundColor: Colors.yellow[200]),
  
  // Colors
  backgroundColor: Colors.blue[50],
  borderColor: Colors. blue,
  checkboxActiveColor: Colors.orange,
  
  // Icons
  searchIcon: Icons.search_rounded,
  clearIcon: Icons. close_rounded,
  iconSize: 28,
  iconColor: Colors. blue,
  
  // Checkbox Position
  checkboxPosition: ListTileControlAffinity.trailing, // Right side
  
  // Layout
  showSubtitleBelow: true,
  titleSubtitleSeparator: ' | ',
  dropdownBorderRadius: 12,
  dropdownElevation: 8,
  maxHeight: 300,
  
  onSelectionChanged: (selectedItems) {
    print('Selected: $selectedItems');
  },
)
```

---

## 1️⃣ Single-Select Dropdown

### Basic Single-Select (With Search)

```dart
ProperSingleSelectDropdown(
  items: const [
    ['CAR001', '\$ 25,000'],
    ['TRUCK002', '\$ 45,000'],
    ['BIKE003', '\$ 8,000'],
  ],
  hintText: 'Select a Vehicle',
  enableSearch: true, // Search enabled (default)
  onSelectionChanged: (selectedItem) {
    if (selectedItem != null) {
      print('Selected: ${selectedItem[0]} - ${selectedItem[1]}');
    } else {
      print('Selection cleared');
    }
  },
)
```

### Single-Select WITHOUT Search

```dart
ProperSingleSelectDropdown(
  items: const [
    ['Small'],
    ['Medium'],
    ['Large'],
    ['Extra Large'],
  ],
  hintText: 'Select Size',
  enableSearch: false, // Disable search
  onSelectionChanged: (selectedItem) {
    print('Selected: $selectedItem');
  },
)
```

### Customized Single-Select

```dart
ProperSingleSelectDropdown(
  items: const [
    ['Premium Plan', '\$ 99/mo'],
    ['Standard Plan', '\$ 49/mo'],
    ['Basic Plan', '\$ 19/mo'],
  ],
  hintText: 'Choose your plan',
  enableSearch: true,
  autoCloseOnSelect: true, // Auto-close after selection
  showClearButton: true, // Show clear button
  
  // Text Styles
  titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  subtitleTextStyle: const TextStyle(fontSize: 14, color: Colors. green),
  
  // Layout
  showSubtitleBelow: true,
  titleSubtitleSeparator: ' - ',
  
  onSelectionChanged: (selectedItem) {
    print('Selected: $selectedItem');
  },
)
```

---

## 🎨 Customization Parameters

### Common Parameters (Both Widgets)

#### Required
| Parameter | Type | Description |
|-----------|------|-------------|
| `items` | `List<List<String>>` | List of items.  Each item is `[title]` or `[title, subtitle]` |

#### Selection & Display
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `hintText` | `String` | `'Select Item(s)'` | Hint text when no items selected |
| `enableSearch` | `bool` | `true` | Enable/disable search functionality |
| `onSelectionChanged` | `Function? ` | `null` | Callback when selection changes |

#### Title & Subtitle Styling
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `titleTextStyle` | `TextStyle?` | Default | Style for item titles |
| `subtitleTextStyle` | `TextStyle?` | Default | Style for item subtitles |
| `highlightedTitleTextStyle` | `TextStyle?` | Yellow highlight | Style for highlighted title (when search enabled) |
| `highlightedSubtitleTextStyle` | `TextStyle?` | Yellow highlight | Style for highlighted subtitle (when search enabled) |
| `showSubtitleBelow` | `bool` | `false` | Show subtitle below title (two-line) |
| `titleSubtitleSeparator` | `String` | `' - '` | Separator between title and subtitle |

#### Button Styling
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `hintTextStyle` | `TextStyle?` | Grey | Style for hint text |
| `selectedItemTextStyle` | `TextStyle?` | Black | Style for selected text |
| `backgroundColor` | `Color?` | White | Button background color |
| `borderColor` | `Color?` | Grey | Button border color |
| `dropdownBorderRadius` | `double` | `8.0` | Border radius |

#### Icons
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `searchIcon` | `IconData?` | `Icons.search` | Search icon |
| `clearIcon` | `IconData? ` | `Icons.clear` | Clear icon |
| `arrowDownIcon` | `IconData?` | `Icons.arrow_drop_down` | Dropdown arrow (closed) |
| `arrowUpIcon` | `IconData?` | `Icons.arrow_drop_up` | Dropdown arrow (open) |
| `iconSize` | `double` | `24` | Size of icons |
| `iconColor` | `Color?` | Grey | Color of icons |

#### Search Box (Only when `enableSearch: true`)
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `searchBoxDecoration` | `InputDecoration?` | Default | Custom search box decoration |
| `searchBoxTextStyle` | `TextStyle?` | Default | Search text style |
| `searchBoxBackgroundColor` | `Color?` | Light grey | Search box background |
| `searchBoxBorderRadius` | `double` | `8.0` | Search box border radius |
| `searchBoxFocusedBorderColor` | `Color?` | Blue | Border color when focused |
| `searchBoxEnabledBorderColor` | `Color?` | Grey | Border color when not focused |

#### Dropdown
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `dropdownElevation` | `double` | `4.0` | Dropdown shadow elevation |
| `maxHeight` | `double` | `250` | Maximum dropdown height |

---

### Multi-Select Specific Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `selectedItemText` | `String?` | `null` | Custom text for selection.  Use `{count}` placeholder |
| `checkboxPosition` | `ListTileControlAffinity` | `leading` | Checkbox position (left/right) |
| `checkboxActiveColor` | `Color?` | Blue | Checkbox color when selected |
| `checkboxCheckColor` | `Color? ` | White | Checkmark color |

**Example:**
```dart
selectedItemText: '{count} vehicles selected'
```

---

### Single-Select Specific Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `autoCloseOnSelect` | `bool` | `true` | Auto-close dropdown after selection |
| `showClearButton` | `bool` | `true` | Show clear button when item is selected |

---

## 📝 Item Format

Items can be provided in two formats:

**Single Value (Title Only):**
```dart
items: [
  ['Item 1'],
  ['Item 2'],
  ['Item 3'],
]
```

**Dual Value (Title + Subtitle):**
```dart
items: [
  ['Item 1', 'Subtitle 1'],
  ['Item 2', 'Subtitle 2'],
  ['Item 3', 'Subtitle 3'],
]
```

---

## 🔧 Advanced Features

### 🔍 Optional Search Functionality

Control search with the `enableSearch` parameter:

**With Search (default):**
```dart
ProperSingleSelectDropdown(
  items: [... ],
  enableSearch: true, // Shows search box, enables filtering & highlighting
)
```

**Without Search:**
```dart
ProperSingleSelectDropdown(
  items: [... ],
  enableSearch: false, // Simple scrollable list, no search box
)
```

When `enableSearch: true`:
- ✅ Search box appears
- ✅ Real-time filtering
- ✅ Text highlighting in results
- ✅ Results count display
- ✅ Auto-focus on search field

When `enableSearch: false`:
- ❌ No search box
- ❌ No filtering
- ❌ No text highlighting
- ✅ Simple dropdown list
- ✅ Better performance for small lists

### Smart Search (When Enabled)
- Searches both title and subtitle
- Highlights matching text
- Sorts results: exact matches → starts-with → contains

### Keyboard Handling
- Automatically adjusts height when keyboard appears
- Prevents overflow errors
- Maintains usability in all scenarios

### Selection Management

**Multi-Select:**
- Select multiple items with checkboxes
- Clear all selections with one tap
- Custom selection count text with `{count}` placeholder

**Single-Select:**
- Select one item at a time
- Auto-close on selection (optional)
- Clear button (optional)
- Visual checkmark for selected item

---

## 📊 Comparison Table

| Feature | Multi-Select | Single-Select |
|---------|--------------|---------------|
| Multiple selections | ✅ | ❌ |
| Checkboxes | ✅ | ❌ |
| Single selection | ❌ | ✅ |
| Selection checkmark | ❌ | ✅ |
| Auto-close on select | ❌ | ✅ (optional) |
| Search functionality | ✅ (optional) | ✅ (optional) |
| Clear button | ✅ | ✅ (optional) |
| Custom selection text | ✅ (`{count}`) | ❌ |

---

## 💡 Use Cases

### Multi-Select Dropdown
- Selecting multiple products
- Choosing multiple tags/categories
- Filtering with multiple criteria
- Multi-user selection
- Multi-option preferences

### Single-Select Dropdown
- Country/State/City selection
- Gender selection
- Payment method selection
- Language preference
- Single category selection

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**CHARLESJESU**

- GitHub: [@CHARLESJESU](https://github.com/CHARLESJESU)

---

## 🐛 Issues

If you encounter any issues, please file them on [GitHub Issues](https://github.com/CHARLESJESU/proper_multiselect_search_dropdown/issues).

---

## ⭐ Support

If you like this package, please:
- Give it a ⭐ on [GitHub](https://github.com/CHARLESJESU/proper_multiselect_search_dropdown)
- Like it 👍 on [pub.dev](https://pub.dev/packages/proper_multiselect_search_dropdown)
- Share it with your Flutter developer friends!

---

## 📋 Changelog

See [CHANGELOG.md](CHANGELOG.md) for detailed version history.

---

## 🎯 Roadmap

- [ ] Add animation options
- [ ] Support for custom widgets in list items
- [ ] Grouping support
- [ ] Select all / Deselect all for multi-select
- [ ] Async data loading support
- [ ] Pagination support for large lists

---

Made with ❤️ for the Flutter community