///
/// @Generated by Mockolo
///



import Foundation
import UIKit
@testable import EN


class MainViewControllableMock: MainViewControllable {
    init() { }
    init(uiviewController: UIViewController = UIViewController()) {
        self.uiviewController = uiviewController
    }


    var uiviewControllerSetCallCount = 0
    var uiviewController: UIViewController = UIViewController() { didSet { uiviewControllerSetCallCount += 1 } }
}

class OnboardingViewControllableMock: OnboardingViewControllable {
    init() { }
    init(uiviewController: UIViewController = UIViewController()) {
        self.uiviewController = uiviewController
    }


    var uiviewControllerSetCallCount = 0
    var uiviewController: UIViewController = UIViewController() { didSet { uiviewControllerSetCallCount += 1 } }
}

class AppEntryPointMock: AppEntryPoint {
    init() { }
    init(uiviewController: UIViewController = UIViewController()) {
        self.uiviewController = uiviewController
    }


    var uiviewControllerSetCallCount = 0
    var uiviewController: UIViewController = UIViewController() { didSet { uiviewControllerSetCallCount += 1 } }

    var startCallCount = 0
    var startHandler: (() -> ())?
    func start()  {
        startCallCount += 1
        if let startHandler = startHandler {
            startHandler()
        }
        
    }
}

class RootViewControllableMock: RootViewControllable {
    init() { }
    init(uiviewController: UIViewController = UIViewController(), router: RootRouting? = nil) {
        self.uiviewController = uiviewController
        self.router = router
    }


    var didCompleteOnboardingCallCount = 0
    var didCompleteOnboardingHandler: (() -> ())?
    func didCompleteOnboarding()  {
        didCompleteOnboardingCallCount += 1
        if let didCompleteOnboardingHandler = didCompleteOnboardingHandler {
            didCompleteOnboardingHandler()
        }
        
    }

    var uiviewControllerSetCallCount = 0
    var uiviewController: UIViewController = UIViewController() { didSet { uiviewControllerSetCallCount += 1 } }

    var routerSetCallCount = 0
    var router: RootRouting? = nil { didSet { routerSetCallCount += 1 } }

    var presentCallCount = 0
    var presentHandler: ((ViewControllable, Bool, (() -> ())?) -> ())?
    func present(viewController: ViewControllable, animated: Bool, completion: (() -> ())?)  {
        presentCallCount += 1
        if let presentHandler = presentHandler {
            presentHandler(viewController, animated, completion)
        }
        
    }

    var dismissCallCount = 0
    var dismissHandler: ((ViewControllable, Bool, (() -> ())?) -> ())?
    func dismiss(viewController: ViewControllable, animated: Bool, completion: (() -> ())?)  {
        dismissCallCount += 1
        if let dismissHandler = dismissHandler {
            dismissHandler(viewController, animated, completion)
        }
        
    }
}

class ViewControllableMock: ViewControllable {
    init() { }
    init(uiviewController: UIViewController = UIViewController()) {
        self.uiviewController = uiviewController
    }


    var uiviewControllerSetCallCount = 0
    var uiviewController: UIViewController = UIViewController() { didSet { uiviewControllerSetCallCount += 1 } }
}

class OnboardingListenerMock: OnboardingListener {
    init() { }


    var didCompleteOnboardingCallCount = 0
    var didCompleteOnboardingHandler: (() -> ())?
    func didCompleteOnboarding()  {
        didCompleteOnboardingCallCount += 1
        if let didCompleteOnboardingHandler = didCompleteOnboardingHandler {
            didCompleteOnboardingHandler()
        }
        
    }
}

class OnboardingStepBuildableMock: OnboardingStepBuildable {
    init() { }


    var buildCallCount = 0
    var buildHandler: (() -> (ViewControllable))?
    func build() -> ViewControllable {
        buildCallCount += 1
        if let buildHandler = buildHandler {
            return buildHandler()
        }
        return ViewControllableMock()
    }

    var buildInitialIndexCallCount = 0
    var buildInitialIndexHandler: ((Int) -> (ViewControllable))?
    func build(initialIndex: Int) -> ViewControllable {
        buildInitialIndexCallCount += 1
        if let buildInitialIndexHandler = buildInitialIndexHandler {
            return buildInitialIndexHandler(initialIndex)
        }
        return ViewControllableMock()
    }
}

class RoutingMock: Routing {
    init() { }
    init(viewControllable: ViewControllable = ViewControllableMock()) {
        self.viewControllable = viewControllable
    }


    var viewControllableSetCallCount = 0
    var viewControllable: ViewControllable = ViewControllableMock() { didSet { viewControllableSetCallCount += 1 } }
}

class MainBuildableMock: MainBuildable {
    init() { }


    var buildCallCount = 0
    var buildHandler: (() -> (ViewControllable))?
    func build() -> ViewControllable {
        buildCallCount += 1
        if let buildHandler = buildHandler {
            return buildHandler()
        }
        return ViewControllableMock()
    }
}

class OnboardingBuildableMock: OnboardingBuildable {
    init() { }


    var buildCallCount = 0
    var buildHandler: ((OnboardingListener) -> (ViewControllable))?
    func build(withListener listener: OnboardingListener) -> ViewControllable {
        buildCallCount += 1
        if let buildHandler = buildHandler {
            return buildHandler(listener)
        }
        return ViewControllableMock()
    }
}

class RootBuildableMock: RootBuildable {
    init() { }


    var buildCallCount = 0
    var buildHandler: (() -> (AppEntryPoint))?
    func build() -> AppEntryPoint {
        buildCallCount += 1
        if let buildHandler = buildHandler {
            return buildHandler()
        }
        return AppEntryPointMock()
    }
}

