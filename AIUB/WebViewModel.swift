import SwiftUI
import WebKit
public import Combine

final class WebViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var canGoBack = false
    @Published var canGoForward = false
    @Published var title = ""

    weak var webView: WKWebView?

    func goBack()    { webView?.goBack() }
    func goForward() { webView?.goForward() }
    func reload()    { webView?.reload() }
    func goHome(_ url: URL) { webView?.load(URLRequest(url: url)) }
}
