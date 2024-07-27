Here's a `README.md` file for Swift package `NRCustomTabBar`. This file provides an overview of the package, its components, and how to use them.

---

# Custom Tab Bars for SwiftUI - NRCustomTabBar


# Preview
## AnimatedTabBar
![](https://github.com/niravramani72/NRCustomTabBar/blob/main/Sources/Resources/AnimatedTabBar.gif)
## CustomTabBar
![](https://github.com/niravramani72/NRCustomTabBar/blob/main/Sources/Resources/CustomTabBar.jpg)
## FloatingTabBar
![](https://github.com/niravramani72/NRCustomTabBar/blob/main/Sources/Resources/FloatingTabBar.jpg)
## GradientTabBar
![](https://github.com/niravramani72/NRCustomTabBar/blob/main/Sources/Resources/GradientTabBar.jpg)
## RoundTabBar
![](https://github.com/niravramani72/NRCustomTabBar/blob/main/Sources/Resources/RoundTabBar.jpg)
## SegmentedControlTabBar
![](https://github.com/niravramani72/NRCustomTabBar/blob/main/Sources/Resources/SegmentedControlTabBar.png)

## Requirements
iOS 14.0+
Xcode 14.0+
Swift 5.0+

## Installation

### Using Swift Package Manager

1. Open your Xcode project.
2. Navigate to `File` > `Add Packages...`.
3. Enter the URL of the `NRCustomTabBar` package repository (or choose "Add Local Package" if you're using a local package).
4. Select the package and add it to your project.

### Manual Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/niravramani72/NRCustomTabBar.git
   ```
2. Drag the `NRCustomTabBar` folder into your Xcode project.

## Usage

### Import the Package

Import the `NRCustomTabBar` package in your SwiftUI view file:

```swift
import SwiftUI
import NRCustomTabBar
```


## Example

Here is a complete example of using the dynamic TabBar in a SwiftUI view:

```swift
import SwiftUI
import NRCustomTabBar

struct ContentView: View {
    //Selected tab will be stored in this
    @State private var selectedTab: UUID = UUID()
    
    // Define your dynamic tabs here
    private var tabItems: [TabItem] = [
        TabItem(title: "Home", imageName: "house.fill", view: AnyView(HomeView())),
        TabItem(title: "Search", imageName: "magnifyingglass", view: AnyView(SearchView())),
        TabItem(title: "Profile", imageName: "person.fill", view: AnyView(ProfileView()))
    ]
    
    init() {
        // Set the initial selected tab to the first tab (Home)
        _selectedTab = State(initialValue: tabItems.first!.id)
    }

    var body: some View {
        VStack {
            ZStack {
                // Display the selected tab's view
                ForEach(tabItems) { item in
                    if item.id == selectedTab {
                        item.view
                            .transition(.opacity) // Optional transition
                            .animation(.easeInOut) // Optional animation
                    }
                }
                //Uncomment TabBar code to see how it will look, uncomment only one at a time
                //FloatingTabBar
                /*FloatingTabBar(selectedTab: $selectedTab,
                             tabItems: tabItems,
                             selectedForegroundColor: .blue,
                             foregroundColor: .gray,
                             font: .caption)
                    .edgesIgnoringSafeArea(.bottom)*/
                
                //AnimatedTabBar
                AnimatedTabBar(selectedTab: $selectedTab,
                               tabItems: tabItems,
                               selectedForegroundColor: .blue,
                               foregroundColor: .gray,
                               font: .caption)
                      .edgesIgnoringSafeArea(.bottom)
            }
            Spacer(minLength: 0)
            //CustomTabBar
            /*CustomTabBar(selectedTab: $selectedTab,
                         tabItems: tabItems,
                         selectedForegroundColor: .green,
                         foregroundColor: .gray,
                         font: .caption)
                .edgesIgnoringSafeArea(.bottom)*/
            
            //RoundTabBar
            /*RoundTabBar(selectedTab: $selectedTab,
                         tabItems: tabItems,
                         selectedForegroundColor: .red,
                         foregroundColor: .gray,
                         font: .caption)
                .edgesIgnoringSafeArea(.bottom)*/
            
            //GradientTabBar
            /*GradientTabBar(selectedTab: $selectedTab,
                         tabItems: tabItems,
                         selectedForegroundColor: .white,
                         foregroundColor: .gray,
                         font: .caption,
                           gradientColors: [.blue, .purple])
                .edgesIgnoringSafeArea(.bottom)*/
            
            //SegmentedControlTabBar
            /*SegmentedControlTabBar(selectedTab: $selectedTab,
                                   tabItems: tabItems,
                                   selectedForegroundColor: .white,
                                   foregroundColor: .blue,
                                   font: .caption)
                          .edgesIgnoringSafeArea(.bottom)*/
          
            
        }
        .onAppear {
            if let id = tabItems.first?.id {
                selectedTab = id
            }
        }
    }
}
```

## Contributing

Feel free to open issues or submit pull requests if you have suggestions or improvements. Contributions are welcome!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
