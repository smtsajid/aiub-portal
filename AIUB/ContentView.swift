import SwiftUI

struct ContentView: View {
    @ObservedObject var model: WebViewModel
    let homeURL = URL(string: "https://portal.aiub.edu/")!   

    var body: some View {
        ZStack(alignment: .top) {
            WebView(url: homeURL, model: model)

            if model.isLoading {
                ProgressView()
                    .progressViewStyle(.linear)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigation) {
                Button { model.goBack() } label: { Image(systemName: "chevron.left") }
                    .disabled(!model.canGoBack)
                Button { model.goForward() } label: { Image(systemName: "chevron.right") }
                    .disabled(!model.canGoForward)
            }
            ToolbarItemGroup(placement: .primaryAction) {
                Button { model.goHome(homeURL) } label: { Image(systemName: "house") }
                Button { model.reload() } label: { Image(systemName: "arrow.clockwise") }
            }
        }
        .navigationTitle(model.title.isEmpty ? "MyWebApp" : model.title)
    }
}
