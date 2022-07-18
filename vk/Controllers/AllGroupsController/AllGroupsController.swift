//
//  AllGroupsController.swift
//  vk
//
//  Created by Larisa on 12.07.2022.
//

import UIKit

class AllGroupsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    let reuseIdentifier = "reuseIdentifier"
    var groupsArray = [Group]()
    var sourcegroupsArray = [Group]()

   
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        createGroupsArray()
        groupsArray = sourcegroupsArray
        tableView.reloadData()
        
    }

    //MARK: - fill groups

    func createGroupsArray() {
        let group1 = Group(avatarImagePath: "1", name: "Julia", description: "description")
        sourcegroupsArray.append(group1)

        let group2 = Group(avatarImagePath: "2", name: "Julia2", description: "description")
        sourcegroupsArray.append(group2)

        let group3 = Group(avatarImagePath: "3", name: "Anna", description: "description")
        sourcegroupsArray.append(group3)

        let group4 = Group(avatarImagePath: "4", name: "Anna2", description: "description")
        sourcegroupsArray.append(group4)

        let group5 = Group(avatarImagePath: "5", name: "Julia3", description: "description")
        sourcegroupsArray.append(group5)
    }

}


//MARK: - extensions for tableView

extension AllGroupsController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    //MARK: - checking for repetitions

    func isContain(group: Group) -> Bool {
        return Storage.shared.myGroups.contains { groupItem in
            groupItem.name == group.name
        }
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(groupsArray[indexPath.row].name)")

     //   NotificationCenter.default.post(name: allGroupsRowPressed, object: groupsArray[indexPath.row])

        //MARK: - add groups
        
        if !isContain(group: groupsArray[indexPath.row]){
            Storage.shared.myGroups.append(groupsArray[indexPath.row])
        }

    }

}

extension AllGroupsController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}

        cell.configure(group: groupsArray[indexPath.row])
        return cell

    }

}

//MARK: - extensions for searchBar

extension AllGroupsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){ // метод вызывается, когда что-то меняется в строке поиска
        if searchText.isEmpty {
            groupsArray = sourcegroupsArray
        }else {
            groupsArray = sourcegroupsArray.filter({ groupItem in
                groupItem.name.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}
