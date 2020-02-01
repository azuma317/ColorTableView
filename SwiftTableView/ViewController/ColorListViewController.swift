//
//  ColorListViewController.swift
//  SwiftTableView
//
//  Created by AzumaSato on 2020/01/29.
//  Copyright © 2020 Azuma. All rights reserved.
//

import UIKit

class ColorListViewController: UITableViewController {

    var colors: [Color] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        tableView.reloadData()
    }

    func configure() {
        tableView.register(UINib(nibName: "ColorTableViewCell", bundle: nil), forCellReuseIdentifier: "ColorTableViewCell")

        ColorStore.requestColor { (result) in
            switch result {
            case .success(let colors):
                self.colors = colors
            case .failure(let error):
                // エラー処理
                print(error)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell", for: indexPath) as! ColorTableViewCell
        cell.configure(colors[indexPath.item])
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let colorDetailViewController = storyboard.instantiateViewController(withIdentifier: "DetailView") as? ColorDetailViewController else { return }
        colorDetailViewController.color = colors[indexPath.item]
        self.navigationController?.pushViewController(colorDetailViewController, animated: true)
    }

}
