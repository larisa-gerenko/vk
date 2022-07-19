//
//  GalleryViewController.swift
//  vk
//
//  Created by Larisa on 18.07.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let reuseIdentifier = "reuseIdentifier"
    var photoArray = [String]()
    var modalView: UIView? // backview for full image

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self

        modalView = UIView(frame: .zero)
        modalView?.backgroundColor = #colorLiteral(red: 0.9092841744, green: 0.9122994542, blue: 1, alpha: 1)

        self.view.addSubview(modalView!)

        //MARK: - tap on photo

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnPhoto))
        modalView?.addGestureRecognizer(tapRecognizer)
       
    }

    //MARK: - close full screen photo

    @objc func tapOnPhoto() {
        print("Tap on photo")
        modalView?.subviews.forEach({ $0.removeFromSuperview() })
        modalView?.frame = .zero
    }

}

extension GalleryViewController: UICollectionViewDelegate {

    //MARK: - open full screen photo

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let modalView = self.modalView else {return}
        modalView.frame = self.view.frame

        let imageView = UIImageView(frame: view.frame)
        imageView.image = UIImage(named: photoArray[indexPath.item])
        imageView.contentMode = .scaleAspectFit // чтобы не растягивало фотографию

        modalView.addSubview(imageView)
    }

}

//MARK: - photo gallery size

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 10, height: collectionView.bounds.width / 2 - 10)
    }

}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? GalleryCollectionViewCell else {return UICollectionViewCell()}

        cell.configure(image: UIImage(named: photoArray[indexPath.item]))
        return cell
    }

}
