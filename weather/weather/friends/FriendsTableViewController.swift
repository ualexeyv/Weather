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
    Friends (name: "Василий", surname:  "Березуцкий", avatar: UIImage(named: "friend2")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!]),
    Friends (name: "Роман", surname:  "Широков", avatar: UIImage(named: "friend2")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!]),
    Friends (name: "Григорий", surname:  "Джикия", avatar: UIImage(named: "friend2")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!])]

class FriendsTableViewController: UIViewController {
    
    

    @IBOutlet weak var FriendsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FriendsTableView.delegate = self
        FriendsTableView.dataSource = self
        FriendsTableView.register(UINib(nibName: "cellConfig", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    let key:[String] = []
    
    
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto" {
            guard let dest = segue.destination as? PhotoViewController else { return }
            if let index = FriendsTableView.indexPathForSelectedRow {
                let friend = structOfFriend[index.row]
                dest.photoArray.append(contentsOf: friend.photos)
            }
        }
    } */
}
extension FriendsTableViewController: UITableViewDataSource, UITableViewDelegate {
  //  func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
 //   }
    
 //   func numberOfSections(in tableView: UITableView) -> Int {
        
 //   }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return structOfFriend.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ReusableCell
        let index = indexPath.row
        let name = structOfFriend[index].name
        let surname = structOfFriend[index].surname
        let userAvatar = structOfFriend[index].avatar
        cell.setData(name: name, surname: surname, friendAvatar: userAvatar)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "PhotoVC") as! PhotoViewController
        let friend = structOfFriend [indexPath.row]
        for i in friend.photos {
            VC.photoArray.append (i)
            print (friend.photos.count)
        }
        show(VC, sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
}
