//
//  PostViewController.swift
//  DemoDatabase
//
//  Created by Jack on 7/2/2562 BE.
//  Copyright © 2562 Jack. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PostViewController: UIViewController {

    var ref:DatabaseReference?
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()
    }

    @IBAction func addPost(_ sender: Any) {
        // add to firebase
        if let newPost =  ref?.child("Posts").childByAutoId() {
            let id = newPost.key!
            ref?.child("Posts").child(id).child("title").setValue(titleText.text!)
            ref?.child("Posts").child(id).child("desc").setValue(descText.text!)
        } else {
            print("error")
        }
        
        // bring the page back to first
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPost(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
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
