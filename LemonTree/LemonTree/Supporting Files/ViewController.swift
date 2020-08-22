//
//  ViewController.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/21/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // wrap in scrollView
    @IBOutlet weak var contentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tree = LemonTree()
        let document = try! tree.test()
        let lemonViewFactory = LemonTreeViewFactory(document)
        let lemonView = lemonViewFactory.generate()
        lemonView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lemonView)
        NSLayoutConstraint.activate([
            lemonView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lemonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lemonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            lemonView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
}
