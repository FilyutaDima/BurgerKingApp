//
//  MealDetailViewController.swift
//  BurgerKingApp
//
//  Created by Dmitry on 17.02.22.
//

import UIKit

class MealDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    var completionHandler: (() -> ())?
    var mealIndex: Int?

    @IBOutlet private final weak var photoImageView: UIImageView!
    @IBOutlet private final weak var titleLabel: UILabel!
    @IBOutlet private final weak var ratingLabel: UILabel!
    @IBOutlet private final weak var priceLabel: UILabel!
    @IBOutlet private final weak var viewReviewsButton: UIButton!
    @IBOutlet private final weak var leaveReviewButton: UIButton!
    
    @IBAction func viewReviewsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: Constants.goToReviewTVC, sender: self)
    }
    
    @IBAction func leaveReviewButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: Constants.goToLeavingReviewVC, sender: self)
    }
    
    private func initViews() {
        
        guard let mealIndex = mealIndex else { return }
        let meal = DataManager.shared.meals[mealIndex]
        
        photoImageView.image = meal.image
        titleLabel.text = meal.name
        ratingLabel.text = meal.ratingBar
        priceLabel.text = "\(meal.price) BYN"
        
//        var titleButton = ""
//        let countFeedbacks = meal.feedbacks.count
//        if countFeedbacks == 0 || (5...9).contains(countFeedbacks % 10) {
//            titleButton = "Посмотреть \(countFeedbacks) отзывов"
//        } else if countFeedbacks == 1 {
//            titleButton = "Посмотреть \(countFeedbacks) отзыв"
//        } else if (2...4).contains(countFeedbacks) {
//            titleButton = "Посмотреть \(countFeedbacks) отзыва"
//        }
//
//        viewReviewsButton.titleLabel?.text = titleButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destVC = segue.destination as? ReviewTableViewController {
            destVC.mealIndex = mealIndex
            
        } else if let destVC = segue.destination as? LeavingReviewViewController {
            destVC.completionHandler = { feedback in
                
                guard let mealIndex = self.mealIndex,
                      let completionHandler = self.completionHandler else { return }
                
                DataManager.shared.meals[mealIndex].feedbacks.append(feedback)
                completionHandler()
            }
        }
    }
    
    deinit {
        print("\(self) - deinit")
    }
}
