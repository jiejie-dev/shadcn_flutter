## 0.1.0

> Note: This release has breaking changes.

 - **REFACTOR**: Replace FocusScope with Focus.
 - **REFACTOR**: adhere to component theme guidelines.
 - **REFACTOR**: Remove unused expanding logic and adjust collapsing behavior.
 - **REFACTOR**: Remove actual size reporting and pane size caching.
 - **REFACTOR**: Remove unnecessary IntrinsicHeight and IntrinsicWidth in ResizablePanel.
 - **REFACTOR**: Move `flex` to optional named parameter.
 - **REFACTOR**: Remove unused parameters in ResizableContainerData.
 - **REFACTOR**: rename internal state classes for clarity and improve animation controller handling.
 - **REFACTOR**: rename ColorPickingLayer to EyeDropperLayer for consistency.
 - **REFACTOR**: make darkTheme parameter nullable in ShadcnApp.
 - **REFACTOR**: update createState methods to return State<T> for consistency.
 - **REFACTOR**: split accordion theme into accordion theme and accordion item theme.
 - **REFACTOR**: improve formatting and readability in field signature generation.
 - **REFACTOR**: Sort components alphabetically and docs pages alphabetically in sections.
 - **REFACTOR**: Remove unnecessary focus node management.
 - **REFACTOR**: Remove MenuPopup component.
 - **REFACTOR**: Rename `flexSpace` to `flexCount` and update logic.
 - **REFACTOR**: Use existing key in PopoverController.show().
 - **REFACTOR**: Add focus node to MenuButton.
 - **REFACTOR**: Extract popoverController from state to data class.
 - **REFACTOR**: Move MenuButton popover to Button widget.
 - **REFACTOR**: Remove debugging print statements.
 - **REFACTOR**: Improve scroll arrow behavior in select popup.
 - **REFACTOR**: Add headers and footers to SelectGroup.
 - **REFACTOR**: Use MouseRegion to handle hover states for NavigationMenu and NavigationItem.
 - **REFACTOR**: Add logging to _AttachedSelectValue.
 - **REFACTOR**: Use PopoverPortal for MenuGroup.
 - **REFACTOR**: Replace Container with SizedBox for better layout control.
 - **REFACTOR**: Use Button instead of GhostButton in SelectItemButton.
 - **REFACTOR**: adhere to component theme guidelines.
 - **REFACTOR**: Rename ComboBox to Select.
 - **REFACTOR**: Rename Combobox to Select.
 - **REFACTOR**: Introduce _SelectData and improve search logic.
 - **REFACTOR**: Use AnimatedBuilder for search filter.
 - **REFACTOR**: Replace `selectedIndex` with `value` in `Select` component.
 - **REFACTOR**: Rename ComboBox to Select and update imports.
 - **REFACTOR**: improve visibility checks for private members in documentation generation.
 - **REFACTOR**: Change `openMenu` to `openSubMenu` and add `border` property to `Menubar`.
 - **REFACTOR**: Remove focusScopeNode and simplify menu logic.
 - **REFACTOR**: Use PopoverController for menu submenus.
 - **REFACTOR**: Remove redundant data builder in MenuButton and Menubar.
 - **FIX**: Ensure right-side collapsed panes are not expanded.
 - **FIX**: Correct resizing logic for panes with flex.
 - **FIX**: clear suggestions using assignment instead of clear method and improve chip submission handling.
 - **FIX**: update ChipEditingController to use plainText for suggestions and improve chip handling.
 - **FIX**: typo in ChipInput.
 - **FIX**: Use attached pane size for initial size if available.
 - **FIX**: Auto-focus first command item in Command palette.
 - **FIX**: Sortable onDragEnd not triggered when the drag failed.
 - **FIX**: remove fallback values for backgroundColor and borderColor in CardImage.
 - **FIX**: Enable resizable debug mode.
 - **FIX**: update Flutter version to 3.35.1 and remove continue-on-error flags in deployment workflow.
 - **FIX**: Calculate flex based on view size instead of min size.
 - **FIX**: Assert `T == dynamic` for FormRow.
 - **FIX**: update form data inheritance and improve form controller retrieval methods.
 - **FIX**: Remove type assertion and unused code in Select.
 - **FIX**: Adjust pane size based on flex when container flexes.
 - **FIX**: Flex size calculation in ResizablePane.
 - **FIX**: Add score caching for `Select` component.
 - **FIX**: Improve flex space calculation for resizable panels.
 - **FIX**: Use spared flex space directly instead of tracking changes.
 - **FIX**: update controller attachment to use cached value directly.
 - **FIX**: restrict RefreshTrigger to start direction.
 - **FIX**: Conflicting RadioGroup Imports.
 - **FIX**: Use theme color for CircularProgressIndicator.
 - **FIX**: make constructor const & use Object.hash.
 - **FIX**: make constructor const & use Object.hash.
 - **FIX**: Allow Select to accept String type.
 - **FIX**: Calculate flex space correctly for attached panes.
 - **FIX**: #181 Input OTP do not honour onSubmitted.
 - **FIX**: correct darkZync to darkZinc typo in README and docs.
 - **FIX**: Handle flex space changes in ResizablePane.
 - **FIX**: initialize animations with default values in init state.
 - **FIX**: resolve errors introduced by upstream sync.
 - **FIX**: Resizable pane resizing issue with attached panes.
 - **FIX**: add divider height to accordion theme.
 - **FIX**(color-picker): remove unnecessary whitespace in ColorPicker state.
 - **FIX**: apply theme updates to animation.
 - **FIX**: Select component search results order and add cursor to SelectItemButton.
 - **FIX**: Use double for flex property and calculations.
 - **FIX**: add divider height to accordion theme.
 - **FIX**: Add margin to resizable test page and update viewSize calculation.
 - **FIX**: Adjust flex space distribution when resizing panes.
 - **FIX**(scaffold): set height constraints to correctly measure header and footer size.
 - **FIX**: Add scroll to top/bottom indicators in SelectPopup.
 - **FIX**: Use normal mode for components page.
 - **FIX**: Correctly calculate initial size of panes.
 - **FIX**: Add scroll controller dispose and init state logic.
 - **FIX**: Use unique keys for ResizablePane.
 - **FIX**: ResizablePane assert.
 - **FIX**: Optimize menu data management and popover alignment.
 - **FIX**: Avoid leaking controller when detaching PopoverPortal.
 - **FIX**: Return 0 size when panel is collapsed in `_borrowSize`.
 - **FIX**: Prevent overflow when borrowing from multiple panes.
 - **FIX**: Add controller state management and expand logic in resizable.
 - **FIX**: Clamp resizable pane size to min/max values.
 - **FIX**: Resizable panel size updates.
 - **FIX**: Close submenus when navigating to different popover.
 - **FIX**: Prevent exceeding min/max size on resize.
 - **FIX**: Pass regionGroupId to PopoverRoute and TapRegion.
 - **FIX**: Prevent resize overflow when dragging resizable pane.
 - **FIX**: Resizable panel calculation for initial collapsed state.
 - **FIX**: Apply proposed sizes before setting pane collapsed state.
 - **FIX**: Update pane size when flex changes.
 - **FIX**: Update ResizablePane with new controller and flex value.
 - **FIX**: Menu button padding and trailing icon in menubar.
 - **FIX**: Remove unnecessary ConstrainedBox in ResizablePane.
 - **FIX**: Improve resizing logic for collapsible panes.
 - **FIX**: Remove debug code and update variable names.
 - **FIX**: Resetting proposed size in loaning and borrowing logic.
 - **FIX**: Adjust menu positioning.
 - **FIX**: Improve resizable panel collapse logic and debugging.
 - **FIX**: Improve ResizablePanel logic and fix minor issues.
 - **FIX**: Expand collapsed pane when enough space is available.
 - **FIX**: Handle expanding panels on both sides.
 - **FIX**: Improve logic for collapsing and expanding panes.
 - **FIX**: remove dot shorthands.
 - **FIX**: replace context.theme with Theme.of(context).
 - **FIX**: Add focus scope to Menubar.
 - **FIX**: Clamp resizable pane size within min and max limits.
 - **FIX**: initialize titleBarHeight and resizeThickness to null in WindowWidget constructor.
 - **FEAT**(components): add menubar component.
 - **FEAT**: use custom painter for divider.
 - **FEAT**: add menu divider component and example in menubar.
 - **FEAT**(menu): Add PopoverController support to MenuGroup.
 - **FEAT**(button): add margin to Button.
 - **FEAT**(menu): Add popover background and border.
 - **FEAT**: add onHover and onFocus to Button.
 - **FEAT**(menu): Add support for submenus.
 - **FEAT**(menu): add menubar and menu group.
 - **FEAT**: add menu button variance.
 - **FEAT**(example): add menubar example.
 - **FEAT**(menu): add menubar and menu button components.
 - **FEAT**: Add menu component.
 - **FEAT**: add menu popup component.
 - **FEAT**(icon): add emojis support.
 - **FEAT**(menu): adjust menubar offset and sub menu arrow position.
 - **FEAT**: add Resizable component.
 - **FEAT**: Add minSize to ResizablePane and ResizablePanel.
 - **FEAT**(resizable): Add nested example.
 - **FEAT**: add vertical resizable panel example.
 - **FEAT**: Add ResizablePaneController and collapsible example.
 - **FEAT**(popover): add region group and tap outside handler.
 - **FEAT**: add expand/collapse methods to ResizablePanelController.
 - **FEAT**: add group id to menu.
 - **FEAT**: Add `maxSize` and `tryExpandSize` for controlled resizable panes.
 - **FEAT**: add root group and sub group.
 - **FEAT**(menu): close all popovers when a menu is opened.
 - **FEAT**: add ContextedCallback type and close others.
 - **FEAT**: Add MenuItem abstract class and hasLeading property.
 - **FEAT**: add trySetSize to ResizablePaneController.
 - **FEAT**(menu): add shortcut activator display.
 - **FEAT**(resizable): add expand/collapse methods to controller.
 - **FEAT**: add support for collapsing and expanding sibling panels.
 - **FEAT**(resizable): add edge case handling for expansion/collapse.
 - **FEAT**(resizable): Add collapse/expand functionality.
 - **FEAT**(menu): Add menu shortcut display and checkbox.
 - **FEAT**(menu): add MenuRadio and MenuRadioGroup components for radio buttons in menus.
 - **FEAT**: add popover offset to menu item.
 - **FEAT**(example): Add Select widget example.
 - **FEAT**(components): add ContextMenu component.
 - **FEAT**: Add Dropdown Menu Component.
 - **FEAT**(shadcn_flutter): 增强组件悬停和点击反馈.
 - **FEAT**(shadcn_flutter): update to 0.0.12.
 - **FEAT**: add hover effect to select popup scrollbar.
 - **FEAT**(select): add scroll to top indicator for select popup.
 - **FEAT**: Add computeIndexingScore to SelectGroup.
 - **FEAT**: Add Navigation Menu.
 - **FEAT**: implement accordion theme.
 - **FEAT**: add score caching for select values.
 - **FEAT**(shadcn_flutter): 为 TabPane 添加悬停高亮反馈.
 - **FEAT**: implement accordion theme.
 - **FEAT**(component-themes): setup theme class.
 - **FEAT**: implement RadioCardThemeData.
 - **FEAT**: Add `onChanged` callback to `Select`.
 - **FEAT**(combobox): add showUnrelatedValues prop to combobox.
 - **FEAT**: Implement PhoneInputTheme.
 - **FEAT**: Add SelectItemButton and support for disableTransition in Button.
 - **FEAT**: added showTopSnapBar to WindowNavigator widget for optional top snap bar functionality.
 - **FEAT**: add themes for carousel date picker select navigation bar and refresh trigger.
 - **FEAT**: add support for custom indexing logic in Select.
 - **FEAT**(theme): add tree and window themes.
 - **FEAT**(select): Add `computeIndexingScore` and `Data` widget.
 - **FEAT**: enhance menu functionality and improve focus management.
 - **FEAT**: add Switcher component and example to enhance navigation options.
 - **FEAT**: add SwitcherExample2 component with login and registration forms.
 - **FEAT**: enhance FormController to manage detached values and improve state retrieval.
 - **FEAT**: enhance SwitcherExample2 with form controllers and improve state management.
 - **FEAT**: add alignment parameter to showDropdown function for customizable positioning.
 - **FEAT**: add option to configure unchecked background color in Checkbox widget.
 - **FEAT**: add step to prepare dependencies for LLMs documentation generation.
 - **FEAT**(color): add core color utilities and ColorDerivative abstraction for HSV/HSL transforms.
 - **FEAT**(color-picker): add HSL/HSV/Alpha slider widgets and painters.
 - **FEAT**(color-picker): introduce new ColorPicker using sliders; remove legacy color_picker.dart.
 - **FEAT**(color-input): add ColorInput widget, controller, and theming; integrate with ColorPicker.
 - **FEAT**: support custom ResizablePaneController.
 - **FEAT**: add submenu support to menu button.
 - **FEAT**(core): export color, color picker, eye dropper, history, and sliders in public API.
 - **FEAT**(button): add ToggleController, ControlledToggle, and Toggle widget with ghost/secondary styles.
 - **FEAT**: Add DensityWrap widget for adaptive spacing.
 - **FEAT**(util): add size param to sized.
 - **FEAT**: add support for flexible container sizing.
 - **FEAT**: add pull request template and CI workflow for automated checks.
 - **FEAT**: add flex support to ResizablePane.
 - **FEAT**: add pull request template with comprehensive guidelines.
 - **FEAT**(tabs): add expand.
 - **FEAT**(go_router_app_example): create a new page with to explain GoRouter example.
 - **FEAT**: Add new ColorInput, FormField, and extensive component tests and documentation examples.
 - **FEAT**: add internationalization infrastructure.
 - **FEAT**: enhance theme system.
 - **FEAT**: refactor resizable pane state to use data inheritance and controller.
 - **FEAT**: add experimental Chat component.
 - **FEAT**: Add support for `ResizablePane.flex`.
 - **FEAT**(layout): add faded scrollable viewport.
 - **FEAT**: Add debug option for resizable pane.
 - **FEAT**(theme): add density system and apply spacing.
 - **FEAT**(resizable): add pan handlers to divider.
 - **FEAT**: Allow panes to report actual size.
 - **FEAT**(display): add divider child alignment.
 - **FEAT**: Add flex support for ResizablePane.
 - **FEAT**(resizable): Add resizable property to resizable panel.
 - **FEAT**(resizable): add flex support for ResizablePanel.
 - **FEAT**(example): Add ResizablePanel test page.
 - **FEAT**(layout): add paint-order flex and stack.
 - **FEAT**(form): add spinner bounds and stepper buttons.
 - **FEAT**(eye-dropper): add screen color picker and recent color history grid.
 - **DOCS**: update documentation examples.
 - **DOCS**: update test documentation.
 - **DOCS**(chat): add second chat example.
 - **DOCS**: improve API documentation.
 - **DOCS**(changelog): document breaking changes for color picker refactor, param renames, and new HEX/i18n support.
 - **DOCS**(color): update docs and examples to new ColorPicker/ColorInput and HEX support.
 - **DOCS**: Update screenshot for ComboBox and add new ones for Context Menu, Dropdown Menu, Menubar, Resizable, and Select.
 - **DOCS**: update CHANGELOG for v0.0.48.
 - **BREAKING** **FEAT**(theme): refresh palettes and remove sidebar tokens.

## [0.0.52]

### Fixed

- [#400] Fixed DatePicker resetting its view back to the current month after selecting a date in another month.

## [0.0.51]

### Fixed

- Fixed ControlledComponent assertion error when no initial value is provided
  despite having a nullable type parameter
- Fixed NavigationGroup causing negative size errors when the children list is
  empty
- Fixed NavigationSidebar not working correctly after recent breaking changes

### Changed

- NavigationWidget is now a builder-only widget that requires a builder function
  to be provided.

## [0.0.50]

### Added

- Add min/max limits to increment/decrement input buttons and disable at bounds

### Fixed

- Fixed clip behavior in Dialog overlay widget
- Removed haptic on iOS

### Breaking Changes

- [BREAKING] Navigation selection model changed from index-based (`int`) to
  key-based (`Key?`) across `NavigationBar`, `NavigationRail`, and
  `NavigationSidebar` (commits 53d2d8c3, 8d3104a9, 9ef28a81)
  - `index` parameter removed; use `selectedKey` instead
  - `onSelected` callback signature changed from `ValueChanged<int>?` to
    `ValueChanged<Key?>?`
  - `NavigationItem.index` parameter removed; use the widget's `key` for
    selection identity
- [BREAKING] `NavigationBarItem` abstract class removed; children parameters now
  accept `List<Widget>` instead of `List<NavigationBarItem>`
- [BREAKING] `NavigationContainerMixin` (and its `wrapChildren` method) removed
- [BREAKING] `NavigationChildControlData` and `NavigationGroupControlData`
  classes removed
- [BREAKING] `NavigationBar.constraints` parameter removed; use `expandedSize`
  and `collapsedSize` instead
- [BREAKING] Several `NavigationBar` parameters changed from nullable with theme
  fallback to non-nullable with explicit defaults:
  - `alignment` (`NavigationBarAlignment?` → `NavigationBarAlignment`, default:
    `start`)
  - `labelType` (`NavigationLabelType?` → `NavigationLabelType`, default: `all`)
  - `labelPosition` (`NavigationLabelPosition?` → `NavigationLabelPosition`,
    default: `bottom`)
  - `labelSize` (`NavigationLabelSize?` → `NavigationLabelSize`, default:
    `small`)
  - `expanded` (`bool?` → `bool`, default: `false`)
- [BREAKING] `NavigationBar.expands` parameter removed
- [BREAKING] `NavigationGap`, `NavigationDivider`, `NavigationLabel`, and
  `NavigationWidget` no longer implement `NavigationBarItem`

Migration guide:

1. Replace `index` / `onSelected` with `selectedKey` / key-based callback.

```dart
// before
NavigationBar(
  index: selectedIndex,
  onSelected: (index) => setState(() => selectedIndex = index),
  children: [
    NavigationItem(label: Text('Home'), child: Icon(Icons.home)),
    NavigationItem(label: Text('Search'), child: Icon(Icons.search)),
  ],
)

// after
NavigationBar(
  selectedKey: selectedKey,
  onSelected: (key) => setState(() => selectedKey = key),
  children: [
    NavigationItem(key: ValueKey('home'), label: Text('Home'), child: Icon(Icons.home)),
    NavigationItem(key: ValueKey('search'), label: Text('Search'), child: Icon(Icons.search)),
  ],
)
```

2. Remove any `NavigationBarItem` type annotations; use `Widget` instead.
3. Remove any usage of `NavigationContainerMixin`, `NavigationChildControlData`,
   or `NavigationGroupControlData`.
4. Replace `NavigationBar(constraints: ...)` with `expandedSize` /
   `collapsedSize`.

## [0.0.49]

- Fixed clip behavior in paint order patched layout widgets (Flex, Row, Column,
  Stack)
- Added TextFlipper widget (part of Number Ticker component)

## [0.0.48]

### Added

- Added Chat component
- New `ColorScheme.of` method to access color scheme from theme data
- [#346] Added param to skip focus traversal in Input features
- [PREVIEW] Added `ShadcnPreview` and `ShadcnMultiPreview` annotation to preview
  widgets during development
- Add density system and density-aware padding helpers (`Density`,
  `EdgeInsetsDensity`)
- Add paint-order support for `Flex`, `Row`, `Column`, and `Stack` with
  `PaintOrder` and `Positioned.paintOrder`
- Add `InputStepperButtonFeature` and support for
  `InputFeaturePosition.above`/`below`
- Add `Divider.childAlignment` to align divider content
- Add `Widget.sized(size:)` convenience overload
- Add `FadedScrollableViewport` helper for scroll fade masks
- [#371] Create a new page to explain GoRouter integration (by @xdidx)

### Breaking Changes

- Remove sidebar-specific color tokens from `ColorScheme`
- [BREAKING] `RepeatMode` has been renamed to `LoopingMode`
- [BREAKING] `ShadcnLocalizationsDelegate.delegate` has been renamed to
  `ShadcnLocalizations.delegate`

Migration guide:

1. Remove usages of `ColorScheme.sidebar`, `sidebarForeground`,
   `sidebarPrimary`, `sidebarPrimaryForeground`, `sidebarAccent`,
   `sidebarAccentForeground`, `sidebarBorder`, and `sidebarRing`.
2. Replace them with existing tokens (for example, `background`, `card`, or
   `accent`) or create a custom theme extension if you still need
   sidebar-specific colors.

```dart
// before
final colors = Theme.of(context).colorScheme;
final bg = colors.sidebar;

// after
final colors = Theme.of(context).colorScheme;
final bg = colors.background; // or a custom ThemeExtension
```

### Changed

- Integrate density-aware spacing and padding into core layout widgets and form
  controls
- Extend density-aware spacing defaults across navigation, menus, overlays, and
  display components
- Align remaining layout and form spacing with density defaults
- Revamp the theme docs page with a kitchen-sink preview and right-side options
  panel

### Fixed

- Complete `ColorSchemeRecolorExtension` palette getters

- [#380] Fixed issue with DatePicker when using PromptMode.popover
- [#379] Fixed issue with intrinsic row height in Table component
- [#378] Fixed issue with RepeatMode declaration in flutter master channel
- [#373] Scaffold: Set height constraints to correctly measure header size (by
  @xdidx)
- [#394] Fixes ButtonStyle.withPadding by removing shadowed variable (by
  @craiglabenz)

## 0.0.47

- Bug fixes
  - Brought back color picker history panel
  - Fixed color input button without label not showing
  - Color picker popover now invokes onChanged after popover closed
  - Color picker eye dropper now closes popover when eye dropping and then
    reopened back when done

## 0.0.46

- Breaking changes
  - Color picker refactor and file layout
    - Most color picker code moved from a single
      `lib/src/components/form/color_picker.dart` into multiple focused files
      under `lib/src/components/form/color/solid/`.
    - If you were deep-importing internals, update your imports to the new
      paths. Importing via the main barrel
      (`package:shadcn_flutter/shadcn_flutter.dart`) continues to work but the
      old internal path is removed.
  - API renames (ColorPicker / ColorInput)
    - `allowPickFromScreen` ➜ `enableEyeDropper`
    - `onPickFromScreen` ➜ `onEyeDropperRequested`
    - Add the new callback only when you need to override the built-in prompt
      behavior (popover closes, then eye-dropper starts).
  - Internal widgets/classes
    - `HSVColorPickerArea` / `HSLColorPickerArea` replaced by exported
      `HSVColorSlider` / `HSLColorSlider`.
    - Checkerboard painter consolidated as `AlphaPainter` (replaces ad-hoc
      checkboard usage in the old file).
    - Old helper composites like `ColorPickerSet`, `MiniColorPickerSet`, and
      popup/dialog variants were removed in favor of `ColorInput` +
      `ColorPicker` with prompt modes.

- Color system and utilities
  - Reorganized existing color utilities under the new color module; no
    functional changes to `ColorDerivative` or `colorToHex`. Added gradient
    types (linear, radial, sweep) for future composition.

- Color Picker
  - Replaced legacy ColorPicker implementation with a new slider-based picker
    using dedicated HSV/HSL painters and alpha checkerboard. Supports live
    editing via `onChanging`/`onChanged` and consistent display using an
    effective in-progress value.
  - Added modes for RGB, HSV, HSL, and HEX; optional alpha controls;
    horizontal/vertical orientation; spacing and slider size theming via
    `ColorPickerTheme`.

- Color Input
  - New `ColorInput` widget with `ColorInputController` and theming. Integrates
    popover/dialog prompting, optional HEX label display, orientation, and
    EyeDropper integration. `ControlledColorInput` variant for form integration.

- Eye Dropper and History
  - Added screen color picker (`pickColorFromScreen` and `ColorPickingLayer`)
    with magnified preview and label; added `RecentColorsScope` and
    `ColorHistoryGrid` to persist and pick previously sampled colors.

- API exports
  - Public exports updated to include color utilities, ColorPicker, ColorInput,
    EyeDropper, History, and slider widgets.

- i18n and formatting
  - Added `colorPickerTabHEX` localization key and `TextInputFormatters.hex`
    (supports optional hash prefix) for safe HEX input. If you provide a custom
    localization, add this new key.

## 0.0.45

- Breaking changes
  - Removed NumberInput (previously deprecated) and its export. Migrate to
    TextField with InputSpinnerFeature or to FormattedInput depending on your
    use case.

- Inputs
  - TextField: migrated to a stateful base (TextInputStatefulWidget) with richer
    editing model and actions. Leading/trailing properties were removed; use
    InputLeadingFeature/InputTrailingFeature or other InputFeature adornments
    instead. Added groupId, Action.overridable-based intents
    (append/replace/set), AutoCompleteIntent support, better selection defaults,
    defaultContextMenuBuilder, minimum height sizing, and platform fallbacks.
    Clip behavior inside the Editable is now none to avoid content clipping.
  - Input features: all features accept skipFocusTraversal to prevent them from
    being part of focus order when desired.
  - ChipInput (BREAKING): reworked ChipInput with better UX. No longer handles
    suggestion selection internally; use AutoCompleteFeature for suggestions
    instead. Added onChipsChanged callback for external chip state management.
  - OverflowMarquee: curve is now applied correctly to the scroll animation.

- Components
  - Checkbox: add backgroundColor for unchecked state (thanks @fabionuno).
  - Resizable: new optionalDivider that hides dividers until hover/drag; added
    intrinsic size/dry layout computation for better measure/layout behavior.
  - Command: autofocus the first item in the command palette for faster keyboard
    UX (@cbenhagen).
  - Calendar: use min-size rows to fix alignment issues (@andyhorn).
  - Window: normalize WindowWidget constructor defaults for titleBarHeight and
    resizeThickness to avoid incorrect implicit values.

- Theming and platform
  - ThemeData constructors are now const and ShadcnApp provides sensible
    non-null defaults for theme/darkTheme. Added scroll/context-menu fallbacks
    for unknown platforms to avoid runtime issues (e.g., TargetPlatform.ohos).

## 0.0.44

- Fix: Sortable onDragEnd not triggered when the drag failed

## 0.0.43

- Exported FocusOutline

## 0.0.42

- Updated dependencies

## 0.0.41

- Added AnimatedValueBuilder documentation
- Added NumberTicker documentation
- Added RepeatedAnimationBuilder documentation
- Added TimelineAnimation documentation
- Added Button documentation
- Added Accordion documentation
- Added Collapsible documentation
- Added Avatar documentation
- Added AvatarGroup documentation
- Added CodeSnippet documentation
- Added Table documentation
- Added Tracker documentation
- Added Alert documentation
- Added AlertDialog documentation
- Added CircularProgress documentation
- Added Progress documentation
- Added LinearProgress documentation
- Added Skeleton documentation
- Added Toast documentation
- Added AutoComplete documentation
- Added Checkbox documentation
- Added ChipInput documentation
- Added ColorPicker documentation
- Added ControlledCheckbox documentation
- Added ControlledChipInput documentation
- Added ControlledDatePicker documentation
- Added ControlledMultiSelect documentation
- Added ControlledRadioGroup documentation
- Added ControlledSelect documentation
- Added ControlledSlider documentation
- Added ControlledStarRating documentation
- Added ControlledSwitch documentation
- Added ControlledTimePicker documentation
- Added ControlledToggle documentation
- Added DatePicker documentation
- Added DateInput documentation
- Added DurationInput documentation
- Added Form documentation
- Added FormattedInput documentation
- Added InputOTP documentation
- Added ItemPicker documentation
- Added MultiSelect documentation
- Added MultiSelectChip documentation
- Added NumberInput documentation
- Added PhoneInput documentation
- Added RadioCard documentation
- Added RadioGroup documentation
- Added Select documentation
- Added Slider documentation
- Added StarRating documentation
- Added Switch documentation
- Added TextArea documentation
- Added TextInput documentation
- Added TimePicker documentation
- Added TimeInput documentation
- Added Toggle documentation
- Added AppBar documentation
- Added Card documentation
- Added CardImage documentation
- Added Carousel documentation
- Added Divider documentation
- Added Resizable documentation
- Added Scaffold documentation
- Added Sortable documentation
- Added SortableDragHandle documentation
- Added Steps documentation
- Added Stepper documentation
- Added Timeline documentation
- Added Breadcrumb documentation
- Added DotIndicator documentation
- Added Menubar documentation
- Added NavigationBar documentation
- Added NavigationMenu documentation
- Added NavigationRail documentation
- Added NavigationSidebar documentation
- Added Pagination documentation
- Added Switcher documentation
- Added TabList documentation
- Added TabPane documentation
- Added Tabs documentation
- Added Tree documentation
- Added Dialog documentation
- Added Drawer documentation
- Added HoverCard documentation
- Added Popover documentation
- Added Sheet documentation
- Added Swiper documentation
- Added Tooltip documentation
- Added Window documentation
- Added Badge documentation
- Added ButtonGroup documentation
- Added Calendar documentation
- Added CardButton documentation
- Added Chip documentation
- Added Command documentation
- Added ComponentController documentation
- Added ContextMenu documentation
- Added ControlledComponent documentation
- Added DropdownMenu documentation
- Added IgnoreForm documentation
- Added KeyboardDisplay documentation
- Added OverflowMarquee documentation
- Added RefreshTrigger documentation
- Added StatedWidget documentation
- Added SubFocus documentation

## 0.0.40

- Added Semantics to CodeSnippet
- Clickable no longer handles Semantics
- Bumped flutter version requirement to 3.35.1

## 0.0.39

- Added SubFocus component
- Fixed ButtonStyleOverride being discarded after Button dependency update
- Fixed ButtonGroup modifiying immutable list
- Added alignment parameter to showDropdown
- Added Switcher component
- Upgraded to 3.35.1
- FormController no longer discard detached FormValue for restoration purposes
- Added SubFocus component
- Enhanced keyboard shortcut accessibility Select, MultiSelect, Command,
  Menubar, Dropdown, etc using SubFocus component
- Fixed directionality on Drawer and Sheet
- Fixed auto focus issue with components inside dialog
- Implemented New York v4 style based on original shadcn/ui design spec
- Old New York color schemes has been renamed to LegacyColorSchemes
- Added private constructor to LegacyColorSchemes and ColorSchemes
- Implemented bunch of ComponentTheme for a lot of components

## 0.0.38

- Added component tiles for various UI elements (major documentation
  improvement)
- Fixed missing callback invocation (#277)
- Fixed formatted input form key type (#292)
- Updated RefreshTrigger to support reverse scrolling behavior (#270)
- Fixed controller attachment to use cached value directly
- Refactored internal state classes for clarity and improved animation
  controller handling
- Updated dependencies and refactored InputHintFeature for improved context
  handling
- Updated funding link

## 0.0.37

- Fixed web preloader issues
- Fix PhoneInput initialValue not being passed
- Added showTopSnapBar to WindowNavigator
- Fix item picker issue with popover
- Refactor IterableExtension to use ValueGetter instead of Supplier for
  buildSeparator method
- Fixed issue with ResizablePane state management
- Added a way to get form values individually with type-safe casting
- Upgraded to Flutter 3.32.0

## 0.0.36

- Added native (adaptive) context menu builder for TextField
- Added material context menu builder for TextField
- Added cupertino context menu builder for TextField
- Added parameter to skip input feature focus traversal
- Fixed issue with validities casting in form widget

## 0.0.35

- Fix InputSpinner gesture
- Added RadioCardThemeData (by @mcquenji)
- Added PhoneInputTheme (by @mcquenji)
- Fixed CalendarGridData
- Added generic parameter type to `FormFieldHandle#reportNewFormValue` to handle
  typed-null value
- Fixed LengthValidator issue with the validator ignores null value
- Added title parameter to ItemPicker
- Fixed async error issue with FormErrorBuilder
- Fixed issue with FormEntry cached value not accepting null for the initial
  value
- Removed FormValidationMode.waiting
- ValidationResult is now attached to a FormKey
- WaitingResult now stores proper validation mode value
- Added errors getter on form controller
- SubmitButton now uses FormErrorBuilder instead of handling its own state

## 0.0.34

- Excluded web loaders directory from package release
- Disabled AutoComplete shortcuts and actions while suggestion popover is not
  open

## 0.0.33

- Added showValuePredicate parameter to Select, MultiSelect, ControlledSelect,
  and ControlledMultiSelect
- Fixed AutoComplete suggestion item button
- Added AcceptSuggestionIntent and NavigateSuggestionIntent to AutoComplete
- Added resizeToAvoidBottomInset to Scaffold

## 0.0.32

- Fixed StarRating component
- Added InputFeatureVisibility
- Fixed Password Toggle Input Feature

## 0.0.31

- Added ItemPicker component
- Fixed TimePicker text field vertical align
- Fixed incorrect popover signature
- Added repaint boundary to Scaffold and NavigationBar
- Improved Text extension

## 0.0.30

- Fixed Sheet autoOpen issue
- Fixed incorrect MultiSelectKey FormKey type
- Fixed Focus issue on closing dialog
- Fixed Focus issue on closing popover
- Default locale now accepts all language as a fallback
- Fix scaffold MediaQuery padding
- Added DateInput component
- Added TimeInput component
- Added DurationInput component
- Improved sonner/toast component hover animation
- Added PrimaryButtonTheme
- Added SecondaryButtonTheme
- Added OutlineButtonTheme
- Added GhostButtonTheme
- Added DestructiveButtonTheme
- Added LinkButtonTheme
- Added MutedButtonTheme
- Added CardButtonTheme
- Added TextButtonTheme
- Added MenuButtonTheme
- Added MenubarButtonTheme
- Added FixedButtonTheme
- FormattedInput now properly transfer focus when done editing one of the part

## 0.0.29

- Properly bundled Geist and Geist Mono fonts
- Properly bundled Radix and Bootstrap Icons
- Added Lucide Icons
- Added style to SelectItemButton
- Added MultiSelectChip component
- MultiSelect now uses MultiSelectChip as the itemBuilder
- Added more extension methods to AbstractButtonStyle
- Added Swiper component
- TextEditingController no longer implements ComponentController
- NavigationLabeled now uses directional padding
- Fixed StarRatings on mobile devices
- Fixed SheetOverlayHandler safe area issue

## 0.0.28

- Added no virtualization mode on Select and MultiSelect Popup
- Added intrinsic PopupConstraint
- Fixed autoClosePopup on Select and MultiSelect

## 0.0.27

- Fix ControlledComponent initial state issue

## 0.0.26

- Added ControlledComponent and ComponentController
- Added DateInput component
- Added FormattedInput component
- Fixed Calendar component
- Added ControlledCheckbox component
- Added ControlledChips component
- Added ControlledChipInput component
- Added ControlledDatePicker component
- Added ControlledRadioGroup component
- Added ControlledSelect component
- Added ControlledSlider component
- Added ControlledStarRating component
- Added ControlledSwitch component
- Added ControlledTimePicker component
- Added ControlledToggle component
- Select and MultiSelect rework
- Added IgnoreForm component
- Remove non-alphanumeric filter on Avatar getInitials
- TextField no longer wraps material TextField
- Removed deprecated withOpacity usage
- Added WidgetStateProvider component
- Fix ContextMenu state issue
- Fix select hover scroll color

## 0.0.25

- Tabs, TabList, and TabPane are now based on the new TabContainer
- Fixed InputOTP onSubmit issue
- Added onDropFailed on Sortable
- Bump flutter dependency version to 3.29.0
- Added TabPane component
- Added Expanded option on NavigationBar, NavigationRail, and Sidebar
- Fixed missing child in FormErrorBuilder
- Fixed Toast component state
- Fixed Progress component assertion
- Refactored NavigationMenu children component
- Refactored Navigation children components
- Internal form rework
- Fixed carousel controller disposal
- Added SortableDragHandle
- Improved Sortable animation

## 0.0.24

- Remove pixel_snap
- Fixed flutter dependency version constraint
- Added Sortable drop animation
- Added SortableDragHandle component
- Added Tab Pane component
- Fixed flutter dependency version constraint

## 0.0.23

- Support for 3.27.0
- Added Sortable component
- Added Table component
- Fixed resizing issues with Resizable component
- Changed default popupWidthConstraint to anchorFixSize
- Fixed text field leading and trailing issue
- Alpha sat and val now follow the wheel value on color picker

## 0.0.22

- Added Collapsible Theme
- Added CardButton component
- Added leading and trailing to form title
- Added Progress Theme
- Added Tracker Theme
- Added separate overlay handler for mobile and desktop devices
- Separated data widgets to another package
- Fix dispose on RecentColorsScope notifier
- Added ThemeMode
- Fixed Form Validation microtask delay issue
- Form Validators now return a FutureOr

## 0.0.21

- Fixed issue with Form Validation Mode lifecycle
- Fixed text extension for SelectableText
- Replace switch focus border with FocusOutline
- Added tracker theme
- Added countries parameter to PhoneInput
- Added clipBehavior param to TextField
- Fix RecentColorsScope state disposal
- Scroll Interception is no longer enabled by default
- Added ShadcnLayer widget to wrap shadcn flutter components without ShadcnApp
  widget

## 0.0.20

- Replaced photoUrl to image provider in Avatar component
- Added ButtonGroup component
- Added StatedWidget component
- Added AutoComplete component
- Reworked the web preloader
- Added Number Input component
- Added Refresh Trigger component
- Fixed the issue with static button text style
- Fixed scaffold hitbox order issue
- Exposed textInputAction property for Text Input component
- Reworked the Color Picker component
- Added screen color picker
- Added toast layer to scaffold

## 0.0.19

- Fixed test issue

## 0.0.18

- Added Number Ticker component
- Added Linear Progress component
- Added Chip Input component
- Updated Color Picker component
- Added Multi Select component
- Added Phone Input component
- Added Radio Card component
- Added Star Rating component
- Added Time Picker component
- Added App Bar component
- Added Card Image component
- Added Scaffold component
- Added Stepper component
- Added Timeline component
- Added Dot Indicator component
- Added Navigation Bar component
- Added Navigation Rail component
- Added Navigation Sidebar component
- Added Tree component
- Added Avatar Group component
- Added Tracker component
- Added Keyboard Display component
- Added Overflow Marquee component
- Fixed animation implementation issue
- Improved popover system
- Added scaling option
- Added surfaceOpacity option
- Added surfaceBlur option
- Improved drawer
- Fixed button visual issue in light mode
- Fixed input issue on mobile
- Added option to use native input context menu
- Added mobile context menu
- Fixed radix icons visual glitch
- Added checkbox animation
- Added year and month selection to date picker
- Added tooltip trigger for mobile
- Fixed carousel implementation to match design spec
- Added data messenger to fix data binding issue
- Added more style to chip component
- Improved radio component visual design
- Added more params to input component
- Improved select performance
- Upgraded cross_file dependency

## 0.0.17

- Fixed chained text widget
- Added toast component
- Added colors constants
- Added HSL color picker
- Fixed color shades generation issue
- Improved radio group widget

## 0.0.16

- Fixed bug with data not being bound to popover context
- Fixed popover transformation matrix

## 0.0.15

- Added support for Material/Cupertino widgets

## 0.0.14

- Overhauled popover system
- Removed Popover, PopoverLayoutDelegate, PopoverExtension, and PopoverPortal
- Added NavigationMenu component
- Capture and re-wrap data widget in popover

## 0.0.13

- Fixed platform interface initialization

## 0.0.12

- Added Resizable component
- Added Menubar component
- Refactored ComboBox to Select
- Added Context Menu component
- Added Dropdown Menu component

## 0.0.11

- Fixed missing icons directory

## 0.0.10

- Fixed icon visual glitch

## 0.0.9

- Fixed duplicate widget entries

## 0.0.8

- Updated installation guide

## 0.0.7

- Fix broken links in README.md

## 0.0.6

- Updated README.md

## 0.0.5

- Fix platform support for windows, android, macos, linux, and ios
- Added drawer and sheet

## 0.0.4

- Split into 3 packages: shadcn_flutter, shadcn_flutter_web, and
  shadcn_flutter_platform_interface

## 0.0.3

- Added wasm support
- Overhauled the button component and the badge component

## 0.0.2

- Added missing components
- Improved documentation pages

## 0.0.1

- Initial release
