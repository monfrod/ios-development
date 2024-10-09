//
//  ViewController.swift
//  project1
//
//  Created by yunus on 07.10.2024.
//

import UIKit

class ViewController: GradientViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    let recipes = ["Bolognese pasta"]
    let images = [UIImage(named: "1")]
    let id = "cell"
    let ingredients  = ["""
                               1. Spaghetti - 300 g
                                2. Minced meat (mixture of pork and beef) - 300 g
                                3. Tomatoes - 2 pcs.
                                4. Tomato paste - 2 tbsp.
                                5. Carrot - 1 pc.
                                6. Onion - 1 pc.
                                7. Fresh herbs (basil, parsley)
                                8. Olive oil - 3 tbsp.
                                9. Salt, pepper and seasonings
                               """]
    let descript = ["Bolognese is another type of pasta sauce that is loved by many. It is popular, first of all, due to its lightness and simplicity of preparation."]
    let recipeBolongese = ["""
Grate the carrots, cut the onion into small cubes, and fry together until translucent.
Add the minced meat to the pan, mix and simmer the resulting mass for another 15-20 minutes.
Next, add chopped tomatoes, chopped herbs, tomato paste, salt and spices to taste. Pour in half a cup of boiled water and simmer the meat sauce over low heat for 20-25 minutes.
While the sauce is cooking, boil the spaghetti in salted water. Cook for 7-8 minutes and fold into a colander.
We put the finished pasta on plates and add the bolognese sauce on top.
"""]
    var favoriteRecipesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
        
        
    }
    
    //MARK: Create TableVew
    func createTableView() {
       title = "All Recipes"
        
       tableView.dataSource = self
       tableView.delegate = self
       tableView.frame = view.bounds
       tableView.backgroundView = gradientView

       tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
       view.addSubview(tableView)
   }
    
    //MARK: TableView DataSourse methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell.backgroundColor = .clear
        cell.contentView.subviews.forEach { subview in
            if subview is UIButton {
                subview.removeFromSuperview()
            }
        }
      
        cell.textLabel?.text = recipes[indexPath.row]
        cell.imageView?.image = images[indexPath.row]

        //create a button
        let favoriteButton = UIButton(type: .system)
        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        favoriteButton.tintColor = .gray
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped(sender:)), for: .touchUpInside)
        favoriteButton.tag = indexPath.row
        favoriteButton.frame = CGRect(x: tableView.frame.width - 50, y: 20, width: 30, height: 30)
        
        if favoriteRecipesArray.contains(recipes[indexPath.row]) {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            favoriteButton.tintColor = .systemYellow
        }
        cell.contentView.addSubview(favoriteButton)
        cell.contentView.bringSubviewToFront(favoriteButton)
        return cell
    }
    
    //favoritebutton target
    @objc func favoriteButtonTapped(sender: UIButton) {
        let recipe = recipes[sender.tag]
        
        if favoriteRecipesArray.contains(recipe) {
            favoriteRecipesArray.removeAll{$0 == recipe}
            sender.setImage(UIImage(systemName: "star"), for: .normal)
        } else {
            favoriteRecipesArray.append(recipe)
            sender.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    
    //MARK: TableView Delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.recipeTitle = recipes[indexPath.row]
        detailVC.recipeImage = images[indexPath.row]
        detailVC.ingredientsView = ingredients[indexPath.row]
        detailVC.descriptionRecipe = descript[indexPath.row]
        detailVC.recipeBolongeseDetailVC = recipeBolongese[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)

        if let navigationController = navigationController {
            navigationController.pushViewController(detailVC, animated: true)
        } else {
            print("Nill")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
}

