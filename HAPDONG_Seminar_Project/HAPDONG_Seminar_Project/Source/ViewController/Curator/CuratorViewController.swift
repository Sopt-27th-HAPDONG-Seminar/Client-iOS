//
//  CuratorViewController.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/11/15.
//

import UIKit

class CuratorViewController: UIViewController {

    //MARK:- IBOutlet Part

    @IBOutlet weak var subscribeCuratorCollectionView: UICollectionView!
    
    @IBOutlet weak var categoryTotalButton: UIButton!
    @IBOutlet weak var categoryNewButton: UIButton!
    @IBOutlet weak var categoryRecommendButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    
    //MARK:- Variable Part

    var subscribeCuratorList : [SubsribeCuratorDataModel] = []
    var categoryList : [CateogoryDataModel] = []
    
    
    //MARK:- Constraint Part
    /// 스토리보드에 있는 layout 에 대한 @IBOutlet 을 선언합니다. (Height, Leading, Trailing 등등..)  // 변수명 lowerCamelCase 사용
    /// ex) @IBOutlet weak var lastImageBottomConstraint: NSLayoutConstraint!
    
    
    //MARK:- Life Cycle Part
    /// 앱의 Life Cycle 부분을 선언합니다
    /// ex) override func viewWillAppear() { }
    override func viewDidLoad() {
        super.viewDidLoad()
        settingCollectionView()

    }
    //MARK:- IBAction Part

    @IBAction func subscribeCuratorTotalShowButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func categoryTotalButtonClicked(_ sender: Any) {
    }
    
    
    @IBAction func categoryNewButtonClicked(_ sender: Any) {
    }
    
    @IBAction func categoryRecommendButtonClicked(_ sender: Any) {
    }
    
    //MARK:- default Setting Function Part
    
    func settingCollectionView()
    {
        self.subscribeCuratorCollectionView.delegate = self
        self.subscribeCuratorCollectionView.dataSource = self
//        self.subscribeCuratorCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "SubscribeCuratorCollectionCell")
        
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
//        self.categoryCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionCell")
        
    }
    
    
    //MARK:- Function Part
 
    


}


extension CuratorViewController : UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == subscribeCuratorCollectionView
        {
            return 3
        }
        
        else
        {
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        if collectionView == subscribeCuratorCollectionView
        {

            guard let curatorCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscribeCuratorCollectionCell", for: indexPath) as? SubscribeCuratorCollectionCell else {return UICollectionViewCell() }
            
            curatorCell.setTagCollection()
            

            return curatorCell
        }
        else
        {
            guard let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as? CategoryCollectionCell else {return UICollectionViewCell() }
            
            return categoryCell
            

        }
    }
    
    
}



extension CuratorViewController : UICollectionViewDelegateFlowLayout
{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == subscribeCuratorCollectionView
        {
            
            let width = UIScreen.main.bounds.width * (269/375)
            return CGSize(width: width, height: 112)
        }
        else
        {
            let width = UIScreen.main.bounds.width * (164/375)
            return CGSize(width: width, height: 190)
        }
        
        

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == subscribeCuratorCollectionView
        {
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 50)
        }
        else
        {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == subscribeCuratorCollectionView
        {
            
            return 16

        }
        else
        {
            return 15
        }
     
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == subscribeCuratorCollectionView
        {
            
            return 0
        }
        else
        {
            return 11
        }
     
    }
}


