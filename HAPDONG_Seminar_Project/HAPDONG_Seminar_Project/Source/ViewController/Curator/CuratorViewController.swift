//
//  CuratorViewController.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/11/15.
//

import UIKit

class CuratorViewController: UIViewController {
    
    //MARK:- IBOutlet Part
    /// Label, ColelctionView, TextField, ImageView 등 @IBOutlet 변수들을 선언합니다.  // 변수명 lowerCamelCase 사용
    /// ex)  @IBOutlet weak var qnaTextBoxBackgroundImage: UIImageView!
    
    @IBOutlet weak var curatorCollectionView: UICollectionView!
 
    
    
    //MARK:- Variable Part
    /// 뷰컨에 필요한 변수들을 선언합니다  // 변수명 lowerCamelCase 사용
    /// ex)  var imageViewList : [UIImageView] = []
    
    
    //MARK:- Constraint Part
    /// 스토리보드에 있는 layout 에 대한 @IBOutlet 을 선언합니다. (Height, Leading, Trailing 등등..)  // 변수명 lowerCamelCase 사용
    /// ex) @IBOutlet weak var lastImageBottomConstraint: NSLayoutConstraint!
    
    let linespacing: CGFloat = 32
    
    //MARK:- Life Cycle Part
    /// 앱의 Life Cycle 부분을 선언합니다
    /// ex) override func viewWillAppear() { }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        curatorCollectionView.delegate = self
        curatorCollectionView.dataSource = self
        
        
    }
    //MARK:- IBAction Part
    /// 버튼과 같은 동작을 선언하는 @IBAction 을 선언합니다 , IBAction 함수 명은 동사 형태로!!  // 함수명 lowerCamelCase 사용
    /// ex) @IBOutlet @IBAction func answerSelectedButtonClicked(_ sender: Any) { }
    
    
    //MARK:- default Setting Function Part
    /// 기본적인 세팅을 위한 함수 부분입니다 // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }
    
    
    //MARK:- Function Part
    /// 로직을 구현 하는 함수 부분입니다. // 함수명 lowerCamelCase 사용
    /// ex) func getIndexPath() -> Int {
    ///
    ///    }
    
    
    //MARK:- extension 부분
    /// UICollectionViewDelegate 부분 처럼 외부 프로토콜을 채택하는 경우나, 외부 클래스 확장 할 때,  extension을 작성하는 부분입니다
    /// ex) extension ViewController : UICollectionViewDelegate { }
    
}

extension CuratorViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenHeight =
            UIScreen.main.bounds.height
        
        let cellWidth = (collectionView.frame.width  - linespacing)
        
        //스위치로.. 바꿔
        if indexPath.section == 0 {
            
            let cellHeight = screenHeight / 7
            
            
            return CGSize(width: cellWidth, height: cellHeight)
        }
        
        if indexPath.section == 1 {
            
            let cellHeight = screenHeight / 4
            
            
            return CGSize(width: cellWidth, height: cellHeight)
        }
        
        if indexPath.section == 2 {
            
            let cellHeight = screenHeight / 4
            
            
            return CGSize(width: collectionView.frame.width, height: cellHeight)
        }
        
        else {
            
            let cellHeight = screenHeight / 4
            
            
            return CGSize(width: collectionView.frame.width, height: cellHeight)
        }
        
    }
    
}

extension CuratorViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1    // 32개의 아이템을 보여준다.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "curatorCell", for: indexPath)
            return cell
            
        }
        
        else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscribeCVCell", for: indexPath)
            return cell
            
        }
        
        else if indexPath.section == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath)
            
            return cell
        }
        
        else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryListCell", for: indexPath)
            
            return cell
        }
    }
}


