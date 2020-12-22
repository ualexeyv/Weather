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
let firstFriend = Friends (name: "Alex", surname: "Ivanov", avatar: UIImage(named: "friend1")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!])
let secondFriend = Friends (name: "Max", surname:  "Visario", avatar: UIImage(named: "friend2")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!])
let thirdFriend = Friends (name: "Igor", surname:  "Mironov", avatar: UIImage(named: "friend2")!, photos: [UIImage(named: "friend1_1")!, UIImage(named: "friend1_2")!, UIImage(named: "friend1_3")!])
let massOfFriends = [firstFriend, secondFriend, thirdFriend]
class FriendsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var FriendsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FriendsTableView.delegate = self
        FriendsTableView.dataSource = self
        FriendsTableView.register(UINib(nibName: "cellConfig", bundle: nil), forCellReuseIdentifier: "cell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massOfFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ReusableCell
        let index = indexPath.row
        let name = massOfFriends[index].name
        let surname = massOfFriends[index].surname
        let userAvatar = massOfFriends[index].avatar
        cell.setData(name: name, surname: surname, friendAvatar: userAvatar)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto" {
            guard let dest = segue.destination as? PhotoViewController else { return }
            if let index = FriendsTableView.indexPathForSelectedRow {
                let friend = massOfFriends[index.row]
                dest.photoArray.append(contentsOf: friend.photos)
            }
        }
    }
}
