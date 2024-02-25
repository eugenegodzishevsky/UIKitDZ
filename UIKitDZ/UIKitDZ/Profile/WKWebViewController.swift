// WKWebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// встроенный браузер
class WKWebViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let link = "https://www.google.com/"
    }

    // MARK: - Private Properties

    private let webView = WKWebView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        loadRequest()
    }

    // MARK: - Private Methods

    private func addViews() {
        view.addSubview(webView)

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
