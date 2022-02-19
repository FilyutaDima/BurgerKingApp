//
//  ReviewTableViewController.swift
//  BurgerKingApp
//
//  Created by Dmitry on 17.02.22.
//

import UIKit

class ReviewTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCell()
    }
    
    var mealIndex: Int?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let mealIndex = mealIndex else { return 0 }
        return DataManager.shared.meals[mealIndex].feedbacks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let mealIndex = mealIndex else { return UITableViewCell() }
        let feedbacks = DataManager.shared.meals[mealIndex].feedbacks
        let feedback = feedbacks[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as?
                ReviewTableViewCell else { return UITableViewCell() }
        
        cell.dateReviewLabel.text = feedback.dateString
        cell.textReviewLabel.text = feedback.text
        cell.ratingReviewLabel.text = feedback.ratingBar
        
        return cell
    }
    
    private func initCell() {
        tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    deinit {
        print("\(self) - deinit")
    }
}
