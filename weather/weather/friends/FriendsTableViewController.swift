//
//  FriendsTableViewController.swift
//  weather
//
//  Created by пользовтель on 12.12.2020.
//

import UIKit
struct Friends {
    var name: String
    var surname: String
    var avatar: UIImage
    var photos = [UIImage] ()
   
}
var structOfFriend : [Friends] = [
    Friends(name: "Максим", surname: "Иванов", avatar: UIImage(named: "friend2")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!]),
    Friends (name: "Андрей", surname: "Самойлов", avatar: UIImage(named: "friend2")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!]),
    Friends (name: "Антон", surname:  "Заболотный", avatar: UIImage(named: "friend2")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!]),
    Friends (name: "Алексей", surname:  "Миранчук", avatar: UIImage(named: "miranchuk")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!]),
    Friends (name: "Диньяр", surname:  "Билялетдинов", avatar: UIImage(named: "friend2")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!]),
    Friends (name: "Кирилл", surname:  "Набабакин", avatar: UIImage(named: "friend2")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!]),
    Friends (name: "Василий", surname:  "Березуцкий", avatar: UIImage(named: "berez2")!, photos: [UIImage(named: "berez1")!, UIImage(named: "berez2")!, UIImage(named: "berez3")!]),
    Friends (name: "Роман", surname:  "Широков", avatar: UIImage(named: "friend2")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!]),
    Friends (name: "Григорий", surname:  "Джикия", avatar: UIImage(named: "friend2")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!])]

class FriendsTableViewController: UIViewController {
    
    

    @IBOutlet weak var FriendsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FriendsTableView.delegate = self
        FriendsTableView.dataSource = self
        FriendsTableView.register(UINib(nibName: "cellConfig", bundle: nil), forCellReuseIdentifier: "cell")
        for i in structOfFriend {
            let firstLetter = String(i.name.first!)
            if sections[firstLetter] != nil {
                sections[firstLetter]!.append(i)
            } else {
                sections[firstLetter] = [i]
            }
            keys = Array(sections.keys).sorted(by: <)
        }
    }
    
    var keys:[String] = []
    var sections:[String: [Friends]] = [:]
  
}
extension FriendsTableViewController: UITableViewDataSource, UITableViewDelegate {
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        keys
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let count = sections[key]!.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ReusableCell
        let key = keys[indexPath.section]
        let contact = sections[key]![indexPath.row]
       
        let name = contact.name
        let surname = contact.surname
        let userAvatar = contact.avatar
        cell.setData(name: name, surname: surname)
        cell.setAvatar(userAvatar)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "PhotoVC") as! PhotoViewController
        let key = keys[indexPath.section]
        let friend = sections[key]![indexPath.row]
        VC.photoArray = friend.photos
        show(VC, sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
}
