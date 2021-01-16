//
//  GroupViewController.swift
//  weather
//
//  Created by пользовтель on 16.12.2020.
//

import UIKit

class userGroup {
    let name: String
    let desc: String
    let icon: UIImage
    init (name: String, desc: String, icon: UIImage) {
        self.name = name
        self.desc = desc
        self.icon = icon
    }
}
let group1 = userGroup (name: "Cars", desc: "all about cars and accesories", icon: UIImage (named: "friend1")!)
let group2 = userGroup (name: "Sport", desc: "Fitness, sport and other sport activities", icon: UIImage (named: "friend1")!)
let massOfGroups = [group1, group2]
class GroupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var groupTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupTable.delegate = self
        groupTable.dataSource = self
        groupTable.register(UINib(nibName: "cellConfig", bundle: nil), forCellReuseIdentifier: "cell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massOfGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ReusableCell
        let index = indexPath.row
        let name = massOfGroups[index].name
        let desc = massOfGroups[index].desc
        let image = massOfGroups[index].icon
        cell.setData(name: name, surname: desc)
        cell.setAvatar(image)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }

}
