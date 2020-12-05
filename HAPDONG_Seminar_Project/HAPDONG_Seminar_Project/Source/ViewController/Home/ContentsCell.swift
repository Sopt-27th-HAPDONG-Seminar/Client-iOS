//
//  ContentsCell.swift
//  HAPDONG_Seminar_Project
//
//  Created by 박세란 on 2020/12/04.
//

import Foundation
import UIKit

class ContentsCell: UITableViewCell {

    //MARK:- IBOutlet Part
    /// Label, ColelctionView, TextField, ImageView 등 @IBOutlet 변수들을 선언합니다.  // 변수명 lowerCamelCase 사용
    /// ex)  @IBOutlet weak var qnaTextBoxBackgroundImage: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var writerImage: UIImageView!
    @IBOutlet weak var writerNameLabel: UILabel!
    @IBOutlet weak var writerJobLabel: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    @IBOutlet weak var contentsTitleLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsPublisherLabel: UILabel!
    @IBOutlet weak var savedNumLabel: UILabel!
    
    

    
    
    
    //MARK:- Variable Part
    /// 뷰컨에 필요한 변수들을 선언합니다  // 변수명 lowerCamelCase 사용
    /// ex)  var imageViewList : [UIImageView] = []
    static let identifier = "ContentsCell"
    

    //MARK:- Constraint Part
    /// 스토리보드에 있는 layout 에 대한 @IBOutlet 을 선언합니다. (Height, Leading, Trailing 등등..)  // 변수명 lowerCamelCase 사용
    /// ex) @IBOutlet weak var lastImageBottomConstraint: NSLayoutConstraint!
    
    

    //MARK:- Life Cycle Part
    /// 앱의 Life Cycle 부분을 선언합니다
    /// ex) override func viewWillAppear() { }
    override func awakeFromNib() {
        super.awakeFromNib()
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
    
    // label
    
    func setCommentLabel(Text: String){
        commentLabel.text = Text
    }
    func setWriterNameLabel(Text: String){
        writerNameLabel.text = Text
    }
    func setWriterJobLabel(Text: String){
        writerJobLabel.text = Text
    }
    func setPostTimeLabel(Text: String){
        postTimeLabel.text = Text
    }
    func setContentsTitleLabel(Text: String){
        contentsTitleLabel.text = Text
    }
    func setContentsLabel(Text: String){
        contentsLabel.text = Text
    }
    func setNewsTitleLabel(Text: String){
        newsTitleLabel.text = Text
    }
    func setNewsPublisherLabel(Text: String){
        newsPublisherLabel.text = Text
    }
    func setSavedNumLabel(Text: String){
        savedNumLabel.text = Text
    }
    
    // UIImage
    func setWriterImage(imageName: String){
        writerImage.image = UIImage(named: imageName)
    }
    func setNewsImage(imageName: String){
        newsImage.image = UIImage(named: imageName)
    }

    //MARK:- Function Part
    /// 로직을 구현 하는 함수 부분입니다. // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }
    
    

 

    //MARK:- extension 부분
    /// UICollectionViewDelegate 부분 처럼 외부 프로토콜을 채택하는 경우나, 외부 클래스 확장 할 때,  extension을 작성하는 부분입니다
    /// ex) extension ViewController : UICollectionViewDelegate { }
    
}
