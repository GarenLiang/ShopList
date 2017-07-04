//
//  AllListsViewController.swift
//  ShopList
//
//  Created by GarenLiang on 2017/7/3.
//  Copyright © 2017年 GarenLiang. All rights reserved.
//

import UIKit

class AllListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var allLists = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //table view datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Action
    
    @IBAction func addBarButtonItemPressed(_ sender: Any) {
    }

    }
