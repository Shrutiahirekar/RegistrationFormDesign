//
//  ViewController.swift
//  Form Design
//
//  Created by Mohit Andhare on 30/08/21.
//


import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    
    //    MARK: Outlets
    
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var mobileText: UITextField!
    
    @IBOutlet weak var countryTxt: UITextField!
    
    @IBOutlet weak var dobText: UITextField!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var switchLbl: UILabel!
    
    @IBOutlet weak var switchBtn: UISwitch!
    
    @IBOutlet weak var mumbaiRadio: UIButton!
    
    @IBOutlet weak var delhiRadio: UIButton!
    
    @IBOutlet weak var varanasiRadio: UIButton!
    
    @IBOutlet weak var capitalText: UILabel!
    
    @IBOutlet weak var hiddenMobileLimitTextField: UITextField!
    
    @IBOutlet weak var aboutMe: UITextView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var selecedGender: UILabel!
    
    //    MARK: Variables
    
    var activeTextField: UITextField!
    
  
    
    var gender = ""
    
    //    MARK: Date Picker
    
    let datePicker = UIDatePicker()
    
    //    MARK: Country code Variables
    
    var country = ["+01","+91","+44","+33","+92","+93","+90","+89",]
    
    //    MARK: PickerView
    
    let picker = UIPickerView()
    
    //    MARK: Capital Selection
    
    var flagBtn1 = false
    var flagBtn2 = false
    var flagBtn3 = false
    
    //    MARK: View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        //    MARK: Self Delegate
        
        nameText.delegate = self
        mobileText.delegate = self
        picker.delegate = self
        picker.dataSource = self
        
        //    MARK: Image Layout
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        
        //    MARK: Picker Delegate/Datasource
        
        countryTxt.inputView = picker
        createDatePicker()
    }
    
    //    MARK: Switch Btn  Action
    
    @IBAction func switchValue(_ sender: UISwitch) {
        
        if switchBtn.isOn {
            switchLbl.text = "Yes"
        }
        else {
            switchLbl.text = "No"
        }
    }
    
    //  MARK:Segment Controller Gender
    
    @IBAction func genderValue(_ sender: UISegmentedControl) {
        
        
        if segment.selectedSegmentIndex == 0 {
            gender = "Male"
            selecedGender.text = gender
            
        }
        
        else if segment.selectedSegmentIndex == 1 {
            gender = "Female"
            selecedGender.text = gender
            
        }
        
    }
    
    //    MARK: TextField Range Control
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        if textField == nameText
        {
            let allowedCharacters = "[qwertyuiopasdfghjklzxcvbnm] [QWERTYUIOPASDFGHJKLZXCVBNM]"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typeCharacterSet = CharacterSet(charactersIn: string)
            return allowedCharacterSet.isSuperset(of: typeCharacterSet)
        }
        
        if textField == mobileText
        {
            let maxLength = 10
            let currentString: NSString = (mobileText.text ?? "") as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        return true
        
    }
        
    
    //    MARK: Mumbai Radio Button
    
    @IBAction func mumbaiBtn(_ sender: UIButton) {
        
        if (flagBtn1 == false) {
            
            mumbaiRadio.setBackgroundImage(UIImage(named: "OnBtn 1"), for: UIControl.State.normal)
            
            delhiRadio.setBackgroundImage(UIImage(named: "OffBtn 1"), for: UIControl.State.normal)
            
            varanasiRadio.setBackgroundImage(UIImage(named: "OffBtn 1"), for: UIControl.State.normal)
            
            flagBtn1 = true
            flagBtn2 = false
            flagBtn3 = false
            
            
            capitalText.text = "Mumbai"
        }
    }
    
    //    MARK: Delhi Radio Button
    
    @IBAction func delhiBtn(_ sender: UIButton) {
        
        if (flagBtn2 == false) {
            
            delhiRadio.setBackgroundImage(UIImage(named: "OnBtn 1"), for: UIControl.State.normal)
            
            mumbaiRadio.setBackgroundImage(UIImage(named: "OffBtn 1"), for: UIControl.State.normal)
            
            varanasiRadio.setBackgroundImage(UIImage(named: "OffBtn 1"), for: UIControl.State.normal)
            
            flagBtn1 = false
            flagBtn2 = true
            flagBtn3 = false
            
            capitalText.text = "Delhi"
            
        }
    }
    
    //    MARK: Varanasi Radio Button
    
    @IBAction func varanasiBtn(_ sender: UIButton) {
        
        if (flagBtn3 == false) {
            
            
            varanasiRadio.setBackgroundImage(UIImage(named: "OnBtn 1"), for: UIControl.State.normal)
            
            delhiRadio.setBackgroundImage(UIImage(named: "OffBtn 1"), for: UIControl.State.normal)
            
            mumbaiRadio.setBackgroundImage(UIImage(named: "OffBtn 1"), for: UIControl.State.normal)
            
            flagBtn1 = false
            flagBtn2 = false
            flagBtn3 = true
            
            capitalText.text = "Varanasi"
            
        }
        
    }
    
    //    MARK: Date Picker Function
    
    func createDatePicker() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBtnPressed))
        
        toolBar.setItems([doneBtn], animated: true)
        
        dobText.inputAccessoryView = toolBar
        dobText.inputView = datePicker
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
//        datePicker.minimumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
    }
    
    @objc func doneBtnPressed() {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        dobText.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    //    MARK: Submit Button / Navigation
    
    
    @IBAction func btnClicked(_ sender: UIButton) {
        
        let imgSystem = UIImage(named: "Removed")
        
        if imageView.image?.imageAsset != imgSystem?.imageAsset{
            print("Same")
            
        }
        else {
            
            let alert = UIAlertController(title: "Registration Fail!", message: "Please Select Your Image", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
            print("Not Same")
        }
       
       
        if let name = nameText.text, let mobile = mobileText.text, let segment = selecedGender.text,let aboutme = aboutMe.text, let country = countryTxt.text, let capital = capitalText.text, let DateOfBirth = dobText.text
        {
             if name.isEmpty {
                
                // create the alert
                let alert = UIAlertController(title: "Registration Fail!", message: "Please Enter Your Name", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
            
            else if DateOfBirth.isEmpty{
                let alert = UIAlertController(title: "Registration Fail!", message: "Please Select Your Date Of Birth", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
            else if country.isEmpty {
                
                let alert = UIAlertController(title: "Registration Fail!", message: "Please Select The Country Code", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
            }
            
            else if mobile.isEmpty {
                
                let alert = UIAlertController(title: "Registration Fail!", message: "Please Enter Mobile Number", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
            }
            
            if mobileText.text!.count < 10 {
//                     warningLabel.hidden = false
                
                let alert = UIAlertController(title: "Registration Fail!", message: "Please Enter Valid Mobile Number(10 Digits)", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
            
            else if segment.isEmpty{
                
                let alert = UIAlertController(title: "Registration Fail!", message: "Please Select The Gender", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
            }
           
            else if capital.isEmpty {
                
                let alert = UIAlertController(title: "Registration Fail!", message: "Please Select The Capital", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
            }
            
            else if aboutme.isEmpty {
                
                let alert = UIAlertController(title: "Registration Fail!", message: "Please fill About Me", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
            }
            
            else {
                
                
                let det : DetailsViewController = self.storyboard?.instantiateViewController(identifier: "Details") as! DetailsViewController
                
                self.navigationController?.pushViewController(det, animated: true)
                
                
                det.strName = nameText.text
                det.strCode = countryTxt.text
                det.strMobile = mobileText.text
                det.strDob = dobText.text
                det.strGender = gender
                det.strIphone = switchLbl.text
                det.strCapital = capitalText.text
                det.strdescription = aboutMe.text
                det.strImage = imageView.image
                
                
            }
            
        }
        
    }
    
    //    MARK: Delegate and Datasource Methods For Country Picker
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return country.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return country[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTxt.text = country[row]
        self.view.endEditing(false)
    }
    
    //MARK: Image Picker Button
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        let ac = UIAlertController(title: "Select Image", message: "Select Image From", preferredStyle: .actionSheet)
        let cameraBtn = UIAlertAction(title: "Camera", style: .default) {[weak self] (_) in
            self?.showImagePicker(selectedSource: .camera)
        }
        
        let libraryBtn = UIAlertAction(title: "Library", style: .default) {[weak self] (_) in
            self?.showImagePicker(selectedSource: .photoLibrary)
        }
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cameraBtn)
        ac.addAction(libraryBtn)
        ac.addAction(cancelBtn)
        self.present(ac, animated: true, completion: nil)
    }
    
    func showImagePicker(selectedSource: UIImagePickerController.SourceType) {
        
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            return
        }
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    
}
// MARK: Extension Image Picker

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

//MARK: TextField Delegate Method

extension ViewController : UITextFieldDelegate
{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    
}



extension ViewController : UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (aboutMe.text as NSString).replacingCharacters(in: range, with: text)
        return newText.count <= 10
        
    }
    
}



extension String {
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}


