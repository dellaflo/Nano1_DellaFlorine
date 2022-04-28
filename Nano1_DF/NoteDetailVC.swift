//
//  ViewController.swift
//  Nano1_DF
//
//  Created by Della Florine on 28/04/22.
//

import UIKit
import CoreData

class NoteDetailVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var randomButton: UIButton!
    
    var selectedNote: Note? = nil
    
    var randomFact = "Things that makes me happy"
    
    let placeholderColor = UIColor.systemGray2
    
    let arrayExample = ["The best thing that   happened today",
                    "Someone who help me",
                    "My favorite hobby",
                    "Someone that makes me smile",
                    "Gift that I received",
                    "Animal that I love",
                    "Person that I love",
                    "My relationship with others",
                    "Act of kindness that I received/did",
                    "My accomplishment",
                    "Something I find comfort in",
                    "Opportunities that I get",
                    "Life lesson I learned",
                    "Good memory",
                    "My guilty pleasure",
                    "My friends and family",
                    "The future event that I’m excited about",
                    "My favorite place"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (selectedNote != nil) {
            titleTextField.text =  selectedNote?.title
            contentTextView.text = selectedNote?.content
            randomButton.isHidden = true
        } else {
            textViewSetting()
        }
        backColor()
        noPaddingTV()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        if(selectedNote == nil){
            let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
            let newNote = Note(entity: entity!, insertInto: context)
            newNote.id = noteList.count as NSNumber
            newNote.title = titleTextField.text
            newNote.content = contentTextView.text
            
            do {
                try context.save()
                noteList.append(newNote)
                navigationController?.popViewController(animated: true)
            }
            catch {
                print("Context save error")
            }
        } else {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let note = result as! Note
                    if(note == selectedNote) {
                        note.title = titleTextField.text
                        note.content = contentTextView.text
                        try context.save()
                    }
                }
            } catch {
                print("Fetch Failed")
            }
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
        @IBAction func deleteNoteAction(_ sender: Any) {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let note = result as! Note
                    if(note == selectedNote) {
                        note.deletedDate = Date()
                        try context.save()

                    }
                }
            } catch {
                print("Fetch Failed")
            }
            navigationController?.popToRootViewController(animated: true)
        }
    
    @IBAction func randomButtonTap(_ sender: Any) {
        if contentTextView.textColor == placeholderColor{
            randomFact = "\(String(describing: arrayExample.randomElement()!))"
        contentTextView.text = "Example: \(randomFact)"
        } else {
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if contentTextView.text == "Example: \(randomFact)"{
            textView.text = ""
            textView.textColor = .black
            randomButton.isHidden = true
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if contentTextView.text == "" {
            textView.text = "Example: \(randomFact)"
            textView.textColor = placeholderColor
            randomButton.isHidden = false
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            textView.resignFirstResponder()
        }
        return true
    }
    
    func backColor(){
        if view.backgroundColor == UIColor(named: "GreenColor"){
            navigationController?.navigationBar.tintColor = .white
        } else{
        navigationController?.navigationBar.tintColor = UIColor(named: "OrangeColor")
        }
    }
    
    func textViewSetting() {
        
        contentTextView.text = "Example: \(randomFact)"
        contentTextView.textColor = placeholderColor
        contentTextView.returnKeyType = .done
        contentTextView.delegate = self
    }
    
    func noPaddingTV(){
        contentTextView.textContainer.lineFragmentPadding = CGFloat(0.0)
        contentTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        contentTextView.contentInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
    }
}

