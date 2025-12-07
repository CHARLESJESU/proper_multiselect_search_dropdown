# proper_multiselect_search_dropdown


A highly customizable multi-select dropdown widget with search functionality for Flutter.

## ✨ Features

- ✅ **Multi-select functionality** with checkboxes
- 🔍 **Real-time search** with text highlighting
- 🎨 **Highly customizable** - colors, styles, icons, layouts
- 📱 **Material Design** compliant
- ⌨️ **Keyboard-aware** - automatically adjusts when keyboard appears
- 🎯 **Title & Subtitle support** - flexible single or dual value items
- 🔄 **Two layout modes** - inline or two-line subtitle display
- 💪 **Type-safe** and null-safe
- 🚀 **Easy to use** with sensible defaults


## 🚀 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  proper_multiselect_search_dropdown: ^1.0.1
```

Then run:

```bash
flutter pub get proper_multiselect_search_dropdown
```

## 📖 Usage

### Basic Example (Title Only)

```dart
import 'package:proper_multiselect_search_dropdown/propermultiselectsearchdropdown/multiselect.dart';

ProperMultiSelectDropdown(
  items: const [
    ['CAR001'],
    ['TRUCK002'],
    ['BIKE003'],
  ],
  hintText: 'Select Vehicles',
  onSelectionChanged: (selectedItems) {
    print('Selected: $selectedItems');
  },
)
```

### With Title & Subtitle (Inline)

```dart
ProperMultiSelectDropdown(
  items: const [
    ['CAR001', '\$ 25,000'],
    ['TRUCK002', '\$ 45,000'],
    ['BIKE003', '\$ 8,000'],
  ],
  hintText: 'Select Vehicles',
  titleSubtitleSeparator: ' - ',
  onSelectionChanged: (selectedItems) {
    print('Selected: $selectedItems');
  },
)
```

### With Title & Subtitle (Two Lines)

```dart
ProperMultiSelectDropdown(
  items: const [
    ['MacBook Pro', '\$ 2,499'],
    ['iPhone 15', '\$ 999'],
    ['iPad Air', '\$ 599'],
  ],
  hintText: 'Select Products',
  showSubtitleBelow: true,
  titleTextStyle: const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ),
  subtitleTextStyle: const TextStyle(
    fontSize: 13,
    color: Colors.grey,
  ),
  onSelectionChanged: (selectedItems) {
    print('Selected: $selectedItems');
  },
)
```

### Fully Customized

```dart
ProperMultiSelectDropdown(
  items: const [
    ['Diamond', '\$ 99/mo'],
    ['Gold', '\$ 49/mo'],
    ['Silver', '\$ 29/mo'],
  ],
  hintText: 'Choose Plan',
  selectedItemText: '{count} plan(s) selected',
  
  // Text Styles
  titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  subtitleTextStyle: const TextStyle(fontSize: 14, color: Colors.green),
  highlightedTitleTextStyle: TextStyle(backgroundColor: Colors.yellow[200]),
  
  // Colors
  backgroundColor: Colors.blue[50],
  borderColor: Colors.blue,
  checkboxActiveColor: Colors.orange,
  
  // Icons
  searchIcon: Icons.search_rounded,
  clearIcon: Icons.close_rounded,
  iconSize: 28,
  iconColor: Colors.blue,
  
  // Checkbox Position
  checkboxPosition: ListTileControlAffinity.trailing, // Right side
  
  // Search Box
  searchBoxBackgroundColor: Colors.grey[100],
  searchBoxBorderRadius: 12,
  searchBoxFocusedBorderColor: Colors. orange,
  
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

## 🎨 Customization Parameters

### Required Parameters
| Parameter | Type | Description |
|-----------|------|-------------|
| `items` | `List<List<String>>` | List of items.  Each item is `[title]` or `[title, subtitle]` |

### Optional Parameters

#### Selection & Display
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `hintText` | `String` | `'Select Items'` | Hint text when no items selected |
| `selectedItemText` | `String? ` | `null` | Custom text for selection.  Use `{count}` placeholder |
| `onSelectionChanged` | `Function? ` | `null` | Callback when selection changes |

#### Title & Subtitle Styling
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `titleTextStyle` | `TextStyle? ` | Default style | Style for item titles |
| `subtitleTextStyle` | `TextStyle?` | Default style | Style for item subtitles |
| `highlightedTitleTextStyle` | `TextStyle?` | Yellow highlight | Style for highlighted title text |
| `highlightedSubtitleTextStyle` | `TextStyle?` | Yellow highlight | Style for highlighted subtitle text |
| `showSubtitleBelow` | `bool` | `false` | Show subtitle below title (two-line) |
| `titleSubtitleSeparator` | `String` | `' - '` | Separator between title and subtitle |

#### Button Styling
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `hintTextStyle` | `TextStyle?` | Grey | Style for hint text |
| `selectedItemTextStyle` | `TextStyle? ` | Black | Style for selected count text |
| `backgroundColor` | `Color?` | White | Button background color |
| `borderColor` | `Color?` | Grey | Button border color |
| `dropdownBorderRadius` | `double` | `8.0` | Border radius |

#### Icons
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `searchIcon` | `IconData?` | `Icons.search` | Search icon |
| `clearIcon` | `IconData?` | `Icons.clear` | Clear icon |
| `arrowDownIcon` | `IconData?` | `Icons.arrow_drop_down` | Dropdown arrow (closed) |
| `arrowUpIcon` | `IconData?` | `Icons.arrow_drop_up` | Dropdown arrow (open) |
| `iconSize` | `double` | `24` | Size of icons |
| `iconColor` | `Color?` | Grey | Color of icons |

#### Checkbox
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `checkboxPosition` | `ListTileControlAffinity` | `leading` | Checkbox position (left/right) |
| `checkboxActiveColor` | `Color? ` | Blue | Checkbox color when selected |
| `checkboxCheckColor` | `Color?` | White | Checkmark color |

#### Search Box
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

## 🔧 Advanced Features

### Smart Search
- Searches both title and subtitle
- Highlights matching text
- Sorts results: exact matches → starts-with → contains

### Keyboard Handling
- Automatically adjusts height when keyboard appears
- Prevents overflow errors
- Maintains usability in all scenarios

### Selection Management
- Clear all selections with one tap
- Visual feedback for selected items
- Count display with customizable text

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**CHARLESJESU**

- GitHub: [@CHARLESJESU](https://github.com/CHARLESJESU)

## 🐛 Issues

If you encounter any issues, please file them on [GitHub Issues](https://github.com/CHARLESJESU/proper_multiselect_search_dropdown/issues).

## ⭐ Support

If you like this package, please give it a ⭐ on [GitHub](https://github.com/CHARLESJESU/proper_multiselect_search_dropdown.git) and 👍 on [pub.dev](https://pub.dev/packages/proper_multiselect_search_dropdown)! 