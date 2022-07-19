//
//  GalleryCollectionViewCell.swift
//  vk
//
//  Created by Larisa on 18.07.2022.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!

    func configure(image: UIImage?) {
        photoImageView.image = image
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
