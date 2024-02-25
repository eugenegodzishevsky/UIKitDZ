// WKWebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// встроенный браузер
class WKWebViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let link =
            "https://habr.com/ru/companies/simbirsoft/articles/646687/" // "https://www.spacex.com/vehicles/starship/"
    }

    // MARK: - Private Properties

    private let webView = WKWebView()
    // private let toolBar = UIToolbar()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        loadRequest()
//        setupBarButtonItem()
//        setupConstraintsToolBar()
//        loadRequest()
    }

    // MARK: - Private Methods

    private func addViews() {
        view.addSubview(webView)

        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func loadRequest() {
        guard let url = URL(string: Constants.link) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
}

// MARK: - WKNavigationDelegate

extension WKWebViewController: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        decisionHandler(.allow)
    }
}
