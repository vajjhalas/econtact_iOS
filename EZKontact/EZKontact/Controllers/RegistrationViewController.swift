//
//  RegistrationViewController.swift
//  EZKontact
//
//  Created by Supriya on 13/12/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit
import Eureka


class RegistrationViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        form
            +++ Section(header: "", footer: "")
//            <<< LabelRow(){
//                $0.title = "Name"
//            }
//            <<< TextRow(){ row in
//                row.placeholder = "Enter text here"
//            }
//            <<< PhoneRow(){
//                $0.title = "Phone Row"
//                $0.placeholder = "And numbers here"
//            }
//            <<< LabelRow(){
//                $0.title = "Name"
//            }
            <<< TextRow(){ row in
                row.title = "Email"
                row.placeholder = "Enter text here"
            }
            <<< PhoneRow(){
                $0.title = "Mobile"
                $0.placeholder = "And numbers here"
            }
            <<< TextRow(){ row in
                row.title = "First Name"
                row.placeholder = "Enter text here"
            }
            <<< TextRow(){ row in
                row.title = "Last Name"
                row.placeholder = "Enter text here"
            }
            <<< TextRow(){ row in
                row.title = "Designation"
                row.placeholder = "Enter text here"
            }
            <<< TextRow(){ row in
                row.title = "Organisation"
                row.placeholder = "Enter text here"
            }
            <<< ButtonRow("Tags") {
                $0.title = $0.tag
            
                //row.presentationMode = .segueName(segueName: "AccesoryViewControllerSegue", onDismiss: nil)
            }
            <<< TextAreaRow("notes") {
                $0.placeholder = "Notes"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 50)
            }


        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
