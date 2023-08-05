//
//  BaseViewController.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import UIKit

class BaseViewController: UIViewController {
    func presentError(message: String, tryAgainCallback: @escaping () -> Void) {
        let alertViewController = UIAlertController(title: "warning".localizable(), message: message, preferredStyle: .actionSheet)
        alertViewController.addAction(.init(title: "tryAgain".localizable(), style: .default, handler: {_ in
            alertViewController.dismiss(animated: true)
            tryAgainCallback()
        }))
        alertViewController.addAction(.init(title: "ok".localizable(), style: .destructive))
        present(alertViewController, animated: true)
    }
}
