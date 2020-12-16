//
//  HomePeopleListCollectionCell.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/11/15.
//

import UIKit

class HomePeopleListCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var peopleImageView: UIImageView!
    
    
    func setImageData(imageName : String)
    {
        peopleImageView.image = UIImage(named: imageName)
    }
    
    func setImageDataFromURL(url : String)
    {
        peopleImageView.setProfileImage(with: url)
    }
}
