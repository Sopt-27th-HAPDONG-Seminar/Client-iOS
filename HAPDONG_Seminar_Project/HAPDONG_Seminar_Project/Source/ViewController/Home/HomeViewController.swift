//
//  HomeViewController.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/11/15.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK:- IBOutlet Part
    /// Label, ColelctionView, TextField, ImageView 등 @IBOutlet 변수들을 선언합니다.  // 변수명 lowerCamelCase 사용
    /// ex)  @IBOutlet weak var qnaTextBoxBackgroundImage: UIImageView!
    
    @IBOutlet weak var homeTableView: UITableView!
    //    @IBOutlet weak var curatorCollectionView: UICollectionView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK:- Variable Part
    /// 뷰컨에 필요한 변수들을 선언합니다  // 변수명 lowerCamelCase 사용
    /// ex)  var imageViewList : [UIImageView] = []
    
    let curatorImage: [String] = ["btnWm54","btnWm54","btnWm54","btnWm54","btnWm54","btnWm54","btnWm54","btnWm54"]
    
    
    
    
    
    //MARK:- Constraint Part
    /// 스토리보드에 있는 layout 에 대한 @IBOutlet 을 선언합니다. (Height, Leading, Trailing 등등..)  // 변수명 lowerCamelCase 사용
    /// ex) @IBOutlet weak var lastImageBottomConstraint: NSLayoutConstraint!
    
    
    
    //MARK:- Life Cycle Part
    /// 앱의 Life Cycle 부분을 선언합니다
    /// ex) override func viewWillAppear() { }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        //        homeTableView.separatorStyle = .none
        
        //        curatorCollectionView.dataSource = self
        //        curatorCollectionView.delegate = self
        
        
        
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
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }
    
    
}

//MARK:- extension 부분
/// UICollectionViewDelegate 부분 처럼 외부 프로토콜을 채택하는 경우나, 외부 클래스 확장 할 때,  extension을 작성하는 부분입니다
/// ex) extension ViewController : UICollectionViewDelegate { }


//extension HomeViewController : UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}
//
//extension HomeViewController : UICollectionViewDelegateFlowLayout{
//
//}


extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: TableCollectionViewCell.identifier ) as? TableCollectionViewCell else {
                return UITableViewCell()
            }
            tableViewCell.selectionStyle = .none
            tableViewCell.awakeFromNib()
            return tableViewCell
            
        } else {
            guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: ContentsCell.identifier ) as? ContentsCell else {
                return UITableViewCell()
            }
            tableViewCell.awakeFromNib()
            tableViewCell.selectionStyle = .none
            return tableViewCell
            
            
        }
        
        
        
        
        
    }
    
    
}

extension HomeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        
        {
            return TableCollectionViewCell().frame.height + 32
        }
        
        else
        
        {
            
            return ContentsCell().frame.height
        }
        
    }
}
