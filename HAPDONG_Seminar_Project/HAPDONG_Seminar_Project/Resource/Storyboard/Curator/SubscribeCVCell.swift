//
//  SubscribeCVCell.swift
//  HAPDONG_Seminar_Project
//
//  Created by kong on 2020/12/03.
//

import UIKit

class SubscribeCVCell: UICollectionViewCell {
    
    @IBOutlet weak var subscribeListCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        subscribeListCollectionView.dataSource = self
        subscribeListCollectionView.delegate = self
        self.subscribeListCollectionView.register(SubscribeCVCell.self, forCellWithReuseIdentifier: "SubscribeCVCell")
        subscribeListCollectionView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        
    }
    
}

extension SubscribeCVCell: UICollectionViewDelegate{
    
}

extension SubscribeCVCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscribeListCVCell", for: indexPath)
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        return cell
        
    }
    
    
}

extension SubscribeCVCell: UICollectionViewDelegateFlowLayout{
    //음.....어떤 형태로 컬렉션뷰가 사용되는지 알려주는..
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 269, height: 112)
        
    }
    
    
    
    
}
