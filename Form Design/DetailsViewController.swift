//
//  DetailsViewController.swift
//  Form Design
//
//  Created by Mohit Andhare on 30/08/21.
//

import UIKit

class DetailsViewController: UIViewController {

//    MARK: Outlets
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var mobileLbl: UILabel!
    
    @IBOutlet weak var codeLbl: UILabel!
    
    @IBOutlet weak var dobLbl: UILabel!
    
    @IBOutlet weak var gen: UILabel!
    
    @IBOutlet weak var IphoneYesNo: UILabel!
    
    @IBOutlet weak var capitalLbl: UILabel!
    
//    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    @IBOutlet weak var descriptionLbl: UITextView!
    
    @IBOutlet weak var detailImage: UIImageView!
    
    
    //    MARK: Variables
    var strName: String! = nil
    var strMobile: String! = nil
    var strCode: String! = nil
    var strDob: String! = nil
    var strGender : String! = nil
    var strIphone: String! = nil
    var strCapital: String! = nil
    var strdescription: String! = nil
    
    var strImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImage.layer.cornerRadius = detailImage.frame.size.width/2
        
        detailImage.clipsToBounds = true
        
        
        nameLbl.text = strName
        mobileLbl.text = strMobile
        dobLbl.text = strDob
        gen.text = strGender
        IphoneYesNo.text = strIphone
        capitalLbl.text = strCapital
        descriptionLbl.text = strdescription
        detailImage.image = strImage
        codeLbl.text = strCode
        
    }
    

}
