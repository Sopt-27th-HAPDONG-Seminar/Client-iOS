//
//  HomeNewsHeaderCell.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/11/15.
//

import UIKit

class HomeNewsHeaderCell: UITableViewCell {

    //MARK:- IBOutlet Part
    
    @IBOutlet weak var commentSearchView: UIView!
    @IBOutlet weak var peopleListCollectionView: UICollectionView!
    

    //MARK:- Variable Part
    
    var thumbNailList : [String] = []

    //MARK:- Constraint Part
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.peopleListCollectionView.delegate = self
        self.peopleListCollectionView.dataSource = self
        
        self.commentSearchView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    //MARK:- IBAction Part
    

    
    //MARK:- default Setting Function Part
    

    //MARK:- Function Part
    
    func setThumbnailList()
    {
        self.peopleListCollectionView.reloadData()
    }
    

    
    //MARK:- @objc function Part
   

 

}

//MARK:- extension 부분
extension HomeNewsHeaderCell : UICollectionViewDelegate
{
    
    
}

extension HomeNewsHeaderCell : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thumbNailList.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let peopleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "peopleListCollectionCell", for: indexPath) as? HomePeopleListCollectionCell else { return UICollectionViewCell() }
        
        if indexPath.row == 0
        {
            peopleCell.setImageData(imageName: "btnAllSelect")
        }
        else
        {
            peopleCell.setImageDataFromURL(url: thumbNailList[indexPath.row - 1])
        }
        
        return peopleCell

    }
    
    
    
}

extension HomeNewsHeaderCell : UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 54, height: 54)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 23
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 23, bottom: 0, right: 0)
    }
    
    
}
