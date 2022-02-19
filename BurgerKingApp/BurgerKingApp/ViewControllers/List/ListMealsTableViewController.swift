//
//  ListMealsTableViewController.swift
//  BurgerKingApp
//
//  Created by Dmitry on 18.02.22.
//

import UIKit

class ListMealsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initCell()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as?
                ListMealsTableViewCell else { return UITableViewCell() }

        let meal = DataManager.shared.meals[indexPath.row]
        cell.titleLabel.text = meal.name
        cell.subtitleLabel.text = meal.ratingBar
        cell.photoImageView.image = meal.image
        
        return cell
    }
    
    private func initCell() {
        tableView.register(UINib(nibName: "ListMealsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.goToMealViewController, sender: self)
    }
    
    deinit {
        print("\(self) - deinit")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? MealDetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            
            destVC.mealIndex = indexPath.row
            destVC.completionHandler = {
                self.tableView.reloadData()
            }
        }
    }
}
