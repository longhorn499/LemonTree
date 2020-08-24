//
//  ViewController.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/21/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

import UIKit
import CommonMark

class ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let url = Bundle.main.url(forResource: "test", withExtension: "md")!
            let data = try Data(contentsOf: url)
            let string = String(data: data, encoding: .utf8) ?? "missing"
            let document = try Document(string)
            let lemonView: UIView = try LemonTree.generateView(for: document, styling: LemonTreeStyling())
            lemonView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(lemonView)
            NSLayoutConstraint.activate([
                lemonView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                lemonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                lemonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                lemonView.topAnchor.constraint(equalTo: contentView.topAnchor)
            ])
        } catch {
            print("Error loading test markdown: \(error)")
        }
    }
}
