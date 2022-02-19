//
//  LeavingReviewViewController.swift
//  BurgerKingApp
//
//  Created by Dmitry on 18.02.22.
//

import UIKit

class LeavingReviewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var completionHandler: ((Feedback) -> ())?
    
    @IBOutlet private final weak var textReviewView: UITextView!
    @IBOutlet weak var ratingReviewSegmentedControll: UISegmentedControl!
    
    @IBAction private final func leaveReviewButton(_ sender: Any) {
        
        guard let completionHandler = completionHandler else { return }

        let feedback = Feedback(text: textReviewView.text, mark: ratingReviewSegmentedControll.selectedSegmentIndex + 1)
        
        textReviewView.text = ""
        
        completionHandler(feedback)
    }
    
    deinit {
        print("\(self) - deinit")
    }
}
