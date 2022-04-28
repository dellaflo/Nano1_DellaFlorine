//
//  QuotesViewController.swift
//  Nano1_DF
//
//  Created by Della Florine on 28/04/22.
//

import UIKit

class QuotesViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    
    //: Quotes Array
    
    let arrayQuotes: [Quotes] = [
        Quotes(quote: "In ordinary life, we hardly realize that we receive a great deal more than we give, and that it is only with gratitude that life becomes rich.", person: "Dietrich Bonhoeffer"),
        Quotes(quote: "Gratitude is a powerful catalyst for happiness. It’s the spark that lights a fire of joy in your soul.", person: "Amy Collette"),
        Quotes(quote: "When it comes to life the critical thing is whether you take things for granted or take them with gratitude.", person: "G.K. Chesterton"),
        Quotes(quote: "The greatest glory in living lies not in never falling, but in rising every time we fall.", person: "Nelson Mandela"),
        Quotes(quote: "The future belongs to those who believe in the beauty of their dreams. ", person: "Eleanor Roosevelt"),
        Quotes(quote: "It is during our darkest moments that we must focus to see the light. ", person: "Aristotle"),
        Quotes(quote: "Whoever is happy will make others happy too.", person: "Anne Frank"),
        Quotes(quote: "You will face many defeats in life, but never let yourself be defeated.", person: "Maya Angelou"),
        Quotes(quote: "Keep smiling, because life is a beautiful thing and there's so much to smile about.", person: "Marilyn Monroe")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let randomNumberDefault = Int.random(in: 0..<arrayQuotes.count)
        quoteLabel.text = "\(arrayQuotes[randomNumberDefault].quote)"
        personLabel.text = "-\(arrayQuotes[randomNumberDefault].person)"
        
        backColor()

    }
    
    @IBAction func shuffleButtonTap(_ sender: Any) {
        let randomNumber = Int.random(in: 0..<arrayQuotes.count)
        quoteLabel.text = "\(arrayQuotes[randomNumber].quote)"
        personLabel.text = "-\(arrayQuotes[randomNumber].person)"
    }
    
    func backColor(){
        if view.backgroundColor == UIColor(named: "GreenColor"){
            navigationController?.navigationBar.tintColor = .white
        } else{
        navigationController?.navigationBar.tintColor = UIColor(named: "OrangeColor")
        }
    }
}
// MARK: -  Quotes Struct

struct Quotes {
    var quote: String
    var person: String
    
    init(quote: String, person: String){
        self.quote = quote
        self .person = person
    }
}

