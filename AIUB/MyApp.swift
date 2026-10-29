import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }
}

@main
struct MyWebAppApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var model = WebViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(model: model)
                .frame(minWidth: 900, minHeight: 600)
        }
        .commands {
            CommandGroup(replacing: .newItem) {}      

            CommandMenu("Navigate") {
                Button("Back")    { model.goBack() }
                    .keyboardShortcut("[", modifiers: .command)
                Button("Forward") { model.goForward() }
                    .keyboardShortcut("]", modifiers: .command)
                Button("Reload")  { model.reload() }
                    .keyboardShortcut("r", modifiers: .command)
            }
        }
    }
}
