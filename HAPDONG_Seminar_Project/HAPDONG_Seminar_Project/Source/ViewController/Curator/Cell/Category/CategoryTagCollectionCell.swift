//
//  CategoryTagCollectionCell.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/11/30.
//

import UIKit

class CategoryTagCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var tagLabel: UILabel!
    
    func setLabel(tagNmae : String)
    {
        self.tagLabel.text = tagNmae
    }
    
}
