//
//  CuratorTagCollectionCell.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/11/29.
//

import UIKit

class CuratorTagCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var tagLabel: UILabel!
    
    func setLabel(tagNmae : String)
    {
        self.tagLabel.text = tagNmae
    }
    
}
