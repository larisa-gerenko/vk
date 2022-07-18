//
//  FriendsGroupController.swift
//  vk
//
//  Created by Larisa on 18.07.2022.
//

import UIKit

class FriendsGroupController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    var friendsArray = [Friend]()
    let reuseIdentifier = "reuseIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        createFriendsArray()
        tableView.reloadData()
       
    }

    func createFriendsArray() {
        let friend1 = Friend(name: "friend1", avatar: "1", photos: ["1","2"])
        friendsArray.append(friend1)

        let friend2 = Friend(name: "friend2", avatar: "2", photos: ["1","2"])
        friendsArray.append(friend2)

        let friend3 = Friend(name: "friend3", avatar: "3", photos: ["1","2"])
        friendsArray.append(friend3)

        let friend4 = Friend(name: "friend4", avatar: "4", photos: ["1","2"])
        friendsArray.append(friend4)

        let friend5 = Friend(name: "friend5", avatar: "5", photos: ["1","2"])
        friendsArray.append(friend5)
    }

}

extension FriendsGroupController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(friendsArray[indexPath.row].name)")
    }

}

extension FriendsGroupController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}

        cell.configure(friend: friendsArray[indexPath.row])

        return cell

    }

}
