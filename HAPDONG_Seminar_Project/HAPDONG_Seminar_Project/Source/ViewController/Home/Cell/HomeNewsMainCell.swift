//
//  HomeNewsMainCell.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/11/15.
//

import UIKit

class ExpandingTableViewCellContent {

    var ExpandedList: [Bool] = []


    init() {

        for _ in 0...12
        {
            ExpandedList.append(false)
        }
    }

}

class HomeNewsMainCell: UITableViewCell {

    
    //MARK:- IBOutlet Part
    
    @IBOutlet weak var newsHeaderDescriptionTextLabel: UILabel!
    // 사람들이 많이 공유한 컨텐츠에요! 달리는 라벨
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    // 사용자 프로필 이미지가 들어가는 이미지뷰
    
    @IBOutlet weak var userNameTextLabel: UILabel!
    // 유저 프로필 사진 뷰
    
    @IBOutlet weak var companyNameTextLabel: UILabel!
    //회사 이름 텍스트 라벨
    
    @IBOutlet weak var timeTextLabel: UILabel!
    // 시간 표기하는 라벨
    
    @IBOutlet weak var titleTextView: UITextView!
    // 제목 표기하는 텍스트뷰
    
    @IBOutlet weak var mainContentView: UITextView!
    // 메인 내용 표기하는 뷰
    
    @IBOutlet weak var newsImageView: UIImageView!
    //뉴스 대표 이미지 들어가는 이미지뷰
    
    @IBOutlet weak var newsTitleTextView: UITextView!
    // 뉴스 제목 타이틀 들어가는 텍스트뷰
    
    @IBOutlet weak var pressNameTextLabel: UILabel!
    //언론사 이름 들어가는 텍스트 뷰
    
    @IBOutlet weak var saveCountLabel: UILabel!
    // 저장하기 수 담기는 라벨
    
    
    //MARK:- Variable Part

    //MARK:- Constraint Part
    
    
    @IBOutlet weak var mainContentTextViewHeightConstraint: NSLayoutConstraint!
    
    
    //MARK:- Life Cycle Part
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTextView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }
    
    
    //MARK:- IBAction Part
    

    
    //MARK:- default Setting Function Part
    
    
    func setTextView()
    {
        titleTextView.contentInset = .zero
        mainContentView.contentInset = .zero
        mainContentView.textContainerInset = .zero
        mainContentView.sizeToFit()
        
        newsTitleTextView.setLineHeight(lineHeight: 1.2)
        newsTitleTextView.contentInset.left = -5
    }
    
    func setClickedData(isClicked : Bool)
    {
        if isClicked == true
        {
            self.mainContentTextViewHeightConstraint.constant = 200
        }
        else
        {
            self.mainContentTextViewHeightConstraint.constant = 100
        }
    }
    
    func setData(title : String, description : String, articleImageURL : String, articleTitle : String,
                 articleSource : String, saveCount : Int, creator : CuratorDataModel)
    {
        self.titleTextView.text = title
        self.mainContentView.text = description
        self.newsImageView.setImage(with: articleImageURL)
        self.newsTitleTextView.text = articleTitle
        self.pressNameTextLabel.text = articleSource
        self.saveCountLabel.text = String(saveCount)
        self.userNameTextLabel.text = creator.name
        self.userProfileImageView.setProfileImage(with: creator.profileURL)
        self.companyNameTextLabel.text = creator.company + " " + creator.role
        
    }
    
    
    

    //MARK:- Function Part
    

    
    //MARK:- @objc function Part

}
