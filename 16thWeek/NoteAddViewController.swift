//
//  NoteAddViewController.swift
//  16thWeek
//
//  Created by Mustafa Berkay Kaya on 30.01.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

protocol saveButtonTappedDelegate: NSObjectProtocol {
    func didTapButton(title: String, note: String, isEditMode: Bool)
}

class NoteAddViewController: UIViewController {
    
    private let mainStackView = UIStackViewBuilder().axis(.vertical).spacing(20).build()
    private let titleTextField = UITextFieldBuilder()
        .borderWidth(0.5)
        .placeholder("Please enter your title.")
        .build()
    private let noteTextView = UITextViewBuilder().borderWidth(1).isEditable(true).isSelectable(true).build()
    private let saveButton = UIButtonBuilder().title("Save").build()
    
    weak var saveNoteDelegate: saveButtonTappedDelegate?
    var titleText = ""
    var noteText = ""
    var isediting = false

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        addSubViews()
        
        titleTextField.text = titleText
        noteTextView.text = noteText
    }
}

extension NoteAddViewController {
    
    private func addSubViews() {
        addStackView()
        addNoteTitle()
        addNote()
        addButton()
    }
    
    private func addStackView() {
        view.addSubview(mainStackView)
        mainStackView.topToSuperview().constant = 200
        mainStackView.trailingToSuperview().constant = -30
        mainStackView.leadingToSuperview().constant = 30
    }
    
    private func addNoteTitle() {
        mainStackView.addArrangedSubview(titleTextField)
    }
    
    private func addNote() {
        mainStackView.addArrangedSubview(noteTextView)
        noteTextView.height(80)
    }
    
    private func addButton() {
        mainStackView.addArrangedSubview(saveButton)
        saveButton.addTarget(self, action: #selector(tappedSaveButton), for: .touchUpInside)
    }
    
    @objc
    func tappedSaveButton() {
        
        if titleTextField.text!.isEmpty || noteTextView.text!.isEmpty {
            let alert = UIAlertController(title: "Error",
                                          message: "Please fill in the required sections",
                                          preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
           present(alert, animated: true, completion: nil)
        } else {
            if isEditing == false {
                saveNoteDelegate?.didTapButton(title: titleTextField.text!, note: noteTextView.text!, isEditMode: false)
                navigationController?.popViewController(animated: true)
            } else {
                saveNoteDelegate?.didTapButton(title: titleTextField.text!, note: noteTextView.text, isEditMode: true)
                navigationController?.popViewController(animated: true)

            }
        }
        
    }
    
}
