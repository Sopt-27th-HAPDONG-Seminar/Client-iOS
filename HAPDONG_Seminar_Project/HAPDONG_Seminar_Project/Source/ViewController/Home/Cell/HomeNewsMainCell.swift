//
//  HomeNewsMainCell.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/11/15.
//

import UIKit

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
    

    //MARK:- Function Part
    

    
    //MARK:- @objc function Part

}
