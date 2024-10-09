//
//  DetailViewController.swift
//  project1
//
//  Created by yunus on 07.10.2024.
//
import UIKit

class DetailViewController: GradientViewController {
   
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    var recipeTitle: String?
    var recipeImage: UIImage?
    var ingredientsView: String?
    var descriptionRecipe: String?
    var recipeBolongeseDetailVC: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = recipeTitle
        
        //ScrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        //ContentView
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
        
        
        //ImageView
        let imageDetailVC = UIImageView(image: recipeImage)
        imageDetailVC.translatesAutoresizingMaskIntoConstraints = false
        imageDetailVC.contentMode = .scaleAspectFill
        contentView.addSubview(imageDetailVC)
        NSLayoutConstraint.activate([imageDetailVC.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                                     imageDetailVC.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                                     imageDetailVC.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                                     imageDetailVC.heightAnchor.constraint(equalToConstant: 200)])
        
        
       //Label
        let label = UILabel()
        label.text = "\(descriptionRecipe ?? "description")"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.frame = CGRect(x: 20, y: 300, width: view.frame.width - 40, height: 100)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: imageDetailVC.bottomAnchor, constant: 20),
                                     label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                                     label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)])
        
        
       
       
        let ingredientsText = UILabel()
        ingredientsText.text = "Ingridients: \n \(ingredientsView ?? "ingredients")"
        ingredientsText.numberOfLines = 0
        ingredientsText.textAlignment = .left
        //ingredientsText.frame = CGRect(x: 0, y: 420, width: view.frame.width - 40, height: 200)
        ingredientsText.font = .systemFont(ofSize: 14)
        ingredientsText.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ingredientsText)
        NSLayoutConstraint.activate([ingredientsText.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
                                     ingredientsText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                                     ingredientsText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)])
        
        
        
        

        let recipeBolongeseDetailVCText = UILabel()
        recipeBolongeseDetailVCText.text = "Recipe: \n \(recipeBolongeseDetailVC ?? "Recipe")"
        recipeBolongeseDetailVCText.numberOfLines = 0
       //recipeBolongeseDetailVCText.textAlignment = .center
       //recipeBolongeseDetailVCText.frame = CGRect(x: 0, y: 600, width: view.frame.width - 40, height: 200)
        recipeBolongeseDetailVCText.font = .systemFont(ofSize: 14)
        recipeBolongeseDetailVCText.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(recipeBolongeseDetailVCText)
        NSLayoutConstraint.activate([recipeBolongeseDetailVCText.topAnchor.constraint(equalTo: ingredientsText.bottomAnchor, constant: 20),
                                     recipeBolongeseDetailVCText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                                     recipeBolongeseDetailVCText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                                     recipeBolongeseDetailVCText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)])
        
        

        
        
        
        
        
  
    }

}

