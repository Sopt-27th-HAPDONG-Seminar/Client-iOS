//
//  SubscribeCuratorCollectionCell.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/11/29.
//

import UIKit

class SubscribeCuratorCollectionCell: UICollectionViewCell {
    
    
    //MARK:- IBOutlet Part
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var newBadgeImageView: UIImageView!
    
    @IBOutlet weak var curatorTagCollectionView: UICollectionView!
    
    

    //MARK:- Variable Part
    
    var tagList : [String] = ["플랫폼 비즈니스","스타트업 트렌드","커머스"
    ]
    // 서버 붙이면 비우고 데이터를 Viewcontroller 쪽에서 넘겨줘야 함

    //MARK:- Constraint Part
    
    //MARK:- IBAction Part
    

    
    //MARK:- default Setting Function Part
    func setTagCollection()
    {
        curatorTagCollectionView.delegate = self
        curatorTagCollectionView.dataSource = self
    }
    func setCuratorData(userName : String, jobName : String, isNew : Bool, image : String,tagNameList: [String])
    {

        self.userNameLabel.text = userName
        self.jobLabel.text = jobName

        if isNew == true
        {
            self.newBadgeImageView.isHidden = false
        }
        else
        {
            self.newBadgeImageView.isHidden = true
        }

        self.profileImageView.setProfileImage(with: image)

        
        
        
        self.tagList = tagNameList
// 요건 서버 붙이고 넣을 정보
        
    }
    

    //MARK:- Function Part
    

    
    //MARK:- @objc function Part
   

 
    
    
    
    
}

//MARK:- extension 부분

extension SubscribeCuratorCollectionCell : UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CuratorTagCollectionCell", for: indexPath) as? CuratorTagCollectionCell else {return UICollectionViewCell() }
        
        tagCell.setLabel(tagNmae: tagList[indexPath.row])
        
        return tagCell
        
    }
    
    
}

extension SubscribeCuratorCollectionCell : UICollectionViewDelegateFlowLayout
{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let tagLabel = UILabel()
        
        tagLabel.text = tagList[indexPath.row]
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


