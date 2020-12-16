//
//  CategoryCollectionCell.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/11/29.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    
    
    //MARK:- IBOutlet Part

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    
    //MARK:- Variable Part

    var tagData : [String] = []
    //MARK:- Constraint Part
    
    //MARK:- IBAction Part
    
    
    //MARK:- default Setting Function Part

    
    func setData(profileImage : String,
                 isSubscribed : Bool,
                 name : String,
                 job : String,
                 tagList : [String])
    {
        profileImageView.setProfileImage(with: profileImage)
        
        if isSubscribed == false
        {
            subscribeButton.isHidden = false
        }
        
        else
        {
            subscribeButton.isHidden = true

        }
        
        nameLabel.text = name
        jobLabel.text = job
        
        tagData = tagList
        
//        tagCollectionView.delegate = self
//        tagCollectionView.dataSource = self
//        tagCollectionView.reloadData()
        
    }
    
    //MARK:- Function Part
    

    
    //MARK:- @objc function Part
    
}

//MARK:- extension 부분


extension CategoryCollectionCell : UICollectionViewDelegate
{
    
}

extension CategoryCollectionCell : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CuratorTagCollectionCell", for: indexPath) as? CuratorTagCollectionCell else {return UICollectionViewCell() }

        tagCell.setLabel(tagNmae: tagData[indexPath.row])

        return tagCell
        
    }
    
    
}
extension CategoryCollectionCell : UICollectionViewDelegateFlowLayout
{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let tagLabel = UILabel()
        
        tagLabel.text = tagData[indexPath.row]
        tagLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        tagLabel.sizeToFit()
        
        let tagLabelWidth = tagLabel.frame.size.width
        
        
        return CGSize(width: tagLabelWidth + 6 ,  height: 22)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}


