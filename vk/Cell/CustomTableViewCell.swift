//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Larisa on 11.07.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    //MARK: - configure for cell

    func configure(name: String?, description: String?, image: UIImage?) {
        fotoImageView.image = image
        nameLabel.text = name
        descriptionLabel.text = description
    }

    //MARK: - configure for groups

    func configure(group: Group) {
        if let avatarPath = group.avatarImagePath{
            fotoImageView.image = UIImage(named: avatarPath)
        }
        nameLabel.text = group.name
        descriptionLabel.text = group.description
    }

    //MARK: - configure for friends

    func configure(friend: Friend) {
        if let avatarPath = friend.avatar{
            fotoImageView.image = UIImage(named: avatarPath)
        }
        nameLabel.text = friend.name
    }

    //MARK: - cell reuse
    override func prepareForReuse() { // когда переиспользуется ячейка вызывается метод prepareForReuse
        super.prepareForReuse()  // при переопределении необходимо вызвать супер метод

        fotoImageView.image = nil // обнуляем все для переиспользования
        nameLabel.text = nil
        descriptionLabel.text = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
}
