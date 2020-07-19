//
//  ViewController.swift
//  BottomSheet
//
//  Created by Kashyap on 18/07/20.
//  Copyright © 2020 Kashyap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leadingCOnstraint: NSLayoutConstraint!
    
    @IBAction func cancelClicked(_ sender: Any)
    {
        UIView.animate(withDuration: 0.1, animations: {
            
            self.heightConstraint.constant = 750
            self.view.layoutIfNeeded()
        }) { (status) in
            self.isBottomSheetShown = false
            
            UIView.animate(withDuration: 0.1, animations: {
                self.heightConstraint.constant = 0
                self.trailingConstraint.constant = self.view.frame.width
                self.view.layoutIfNeeded()
            }) { (status) in
                // not to be used
            }
            // completion code
        }
    }
    
    @IBOutlet weak var bottomCOnstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonMain: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.bottomView.layer.cornerRadius = 20
        self.bottomView.clipsToBounds = true
        
        self.buttonMain.layer.cornerRadius = 10
        self.buttonMain.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.trailingConstraint.constant = self.view.frame.width
    }

    private var isBottomSheetShown = false
    
    @IBAction func clickedOnButton(_ sender: Any)
    {
        if (isBottomSheetShown)
        {
            // hide the bottom sheet
            UIView.animate(withDuration: 0.1, animations: {
                
                self.heightConstraint.constant = 420
                self.view.layoutIfNeeded()
            }) { (status) in
                self.isBottomSheetShown = false
                
                UIView.animate(withDuration: 0.1, animations: {
                    self.heightConstraint.constant = 0
                    self.trailingConstraint.constant = self.view.frame.width
                    self.view.layoutIfNeeded()
                }) { (status) in
                    // not to be used
                }
                // completion code
            }
        }
        else{
            // show the bottom sheet
            
            UIView.animate(withDuration: 0.1, animations: {
                self.heightConstraint.constant = 420
                self.trailingConstraint.constant = 10
                self.view.layoutIfNeeded()
            }) { (status) in
                // completion code
                self.isBottomSheetShown = true
                
                UIView.animate(withDuration: 0.1, animations: {
                    self.heightConstraint.constant = 400
                    
                    self.view.layoutIfNeeded()
                }) { (status) in
                    
                }
            }
        }
        
    }
    
}

