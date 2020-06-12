/*
* Copyright (c) 2020 De Staat der Nederlanden, Ministerie van Volksgezondheid, Welzijn en Sport.
*  Licensed under the EUROPEAN UNION PUBLIC LICENCE v. 1.2
*
*  SPDX-License-Identifier: EUPL-1.2
*/

import UIKit

/// @mockable
protocol MainRouting: Routing {
    func attachStatus()
    func attachMoreInformation()

    func updateStatus(with viewModel: StatusViewModel)

    func routeToAboutApp()
    func detachAboutApp(shouldHideViewController: Bool)
    
    func routeToReceivedNotification()
    func routeToInfected()
    func routeToRequestTest()
    func routeToShareApp()
    func routeToSettings()
}

final class MainViewController: ViewController, MainViewControllable, StatusListener, MoreInformationListener {
    
    // MARK: - MainViewControllable
    
    weak var router: MainRouting?
    
    func embed(stackedViewController: ViewControllable) {
        addChild(stackedViewController.uiviewController)
        
        let view: UIView = stackedViewController.uiviewController.view
        
        mainView.stackView.addArrangedSubview(view)
        view.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true

        stackedViewController.uiviewController.didMove(toParent: self)
    }
    
    func present(viewController: ViewControllable, animated: Bool) {
        let navigationController = NavigationController(rootViewController: viewController.uiviewController)
        
        if let presentationDelegate = viewController.uiviewController as? UIAdaptivePresentationControllerDelegate {
            navigationController.presentationController?.delegate = presentationDelegate
        }
        
        present(navigationController, animated: animated, completion: nil)
    }
    
    func dismiss(viewController: ViewControllable, animated: Bool) {
        guard let presentedViewController = presentedViewController else {
            return
        }
        
        var viewControllerToDismiss: UIViewController?
        
        if let navigationController = presentedViewController as? NavigationController,
            navigationController.visibleViewController === viewController.uiviewController {
            viewControllerToDismiss = navigationController
        } else if presentedViewController === viewController.uiviewController {
            viewControllerToDismiss = presentedViewController
        }
        
        if let viewController = viewControllerToDismiss {
            viewController.dismiss(animated: animated, completion: nil)
        }
    }
    
    // MARK: - MoreInformationListener
    
    func moreInformationRequestsAbout() {
        router?.routeToAboutApp()
    }
    
    func moreInformationRequestsReceivedNotification() {
        router?.routeToReceivedNotification()
    }
    
    func moreInformationRequestsInfected() {
        router?.routeToInfected()
    }
    
    func moreInformationRequestsRequestTest() {
        router?.routeToRequestTest()
    }
    
    func moreInformationRequestsShareApp() {
        router?.routeToShareApp()
    }
    
    func moreInformationRequestsSettings() {
        router?.routeToSettings()
    }
    
    // MARK: - AboutListener
    
    func aboutRequestsDismissal(shouldHideViewController: Bool) {
        router?.detachAboutApp(shouldHideViewController: shouldHideViewController)
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        router?.attachStatus()
        router?.attachMoreInformation()

        router?.updateStatus(with: .active)
    }

    // MARK: - StatusListener
    func handleButtonAction(_ action: StatusViewButtonModel.Action) {
        // TODO: handle
        print("handle \(action)")
    }
    
    // MARK: - Private
    
    private lazy var mainView: MainView = MainView()
}

private final class MainView: View {
    fileprivate let scrollView = UIScrollView()
    fileprivate let stackView = UIStackView()
    
    override func build() {
        super.build()

        addSubview(scrollView)
        scrollView.addSubview(stackView)

        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.alwaysBounceVertical = true
        
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.distribution = .fill
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            // scrollView
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // stackView
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
