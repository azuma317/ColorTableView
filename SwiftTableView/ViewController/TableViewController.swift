//
//  TableViewController.swift
//  SwiftTableView
//
//  Created by Azuma on 2018/04/27.
//  Copyright © 2018年 Azuma. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var colors: Results<RealmColor>?
    var color: RealmColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let colors = realm.objects(RealmColor.self)
        self.colors = colors
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestColors()
    }
    
    private func requestColors() {
        APIClient.requestColor { [weak weakSelf = self](result) in
            switch result {
            case .success(let resultColor):
                RealmColor.addColor(colorJSONs: resultColor)
                weakSelf?.tableView.reloadData()
            case .failure(let error):
                let alert = UIAlertController(title: error.localizedDescription,
                                              message: (error as NSError).localizedFailureReason,
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK!", style: .default))
                weakSelf?.present(alert, animated: true)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        if let colors = colors {
            let color = colors[indexPath.item]
            cell.configre(color: color)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        color = colors?[indexPath.item]
        performSegue(withIdentifier: "ColorSegue", sender: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ColorSegue" {
            let vc = segue.destination as? ViewController
            vc?.color = color!
        }
    }

}
