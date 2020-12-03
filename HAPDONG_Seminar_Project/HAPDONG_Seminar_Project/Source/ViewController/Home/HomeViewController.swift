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
    
    
    @IBOutlet weak var mainHomeTableView: UITableView!
    

    //MARK:- Variable Part
    /// 뷰컨에 필요한 변수들을 선언합니다  // 변수명 lowerCamelCase 사용
    /// ex)  var imageViewList : [UIImageView] = []
    
    var newsContentDataSource = ExpandingTableViewCellContent()

    //MARK:- Constraint Part
    /// 스토리보드에 있는 layout 에 대한 @IBOutlet 을 선언합니다. (Height, Leading, Trailing 등등..)  // 변수명 lowerCamelCase 사용
    /// ex) @IBOutlet weak var lastImageBottomConstraint: NSLayoutConstraint!
    
    

    //MARK:- Life Cycle Part
    /// 앱의 Life Cycle 부분을 선언합니다
    /// ex) override func viewWillAppear() { }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetting()

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
    
    
    func tableViewSetting()
    {
        mainHomeTableView.delegate = self
        mainHomeTableView.dataSource = self
        mainHomeTableView.separatorStyle = .none

    }
    

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


extension HomeViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 142
        }
        else
        {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row > 0
        {
            let content = newsContentDataSource
            
            content.ExpandedList[indexPath.row] = !content.ExpandedList[indexPath.row]
            
            self.mainHomeTableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
 
    }
    
    
}

extension HomeViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 // 테이블 뷰의 가장 첫번째 셀은 무조건 검색 및 사진 목록 들어가야합니다
        {
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "newsHeaderCell", for: indexPath) as? HomeNewsHeaderCell else {return UITableViewCell()}
            
            headerCell.selectionStyle = .none
            return headerCell
        }
        else
        {
            guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "newsMainCell", for: indexPath) as? HomeNewsMainCell else {return UITableViewCell()}

            newsCell.setData(isClicked:  newsContentDataSource.ExpandedList[indexPath.row])
        
            newsCell.selectionStyle = .none
            return newsCell
        }
    }
    
    
}

