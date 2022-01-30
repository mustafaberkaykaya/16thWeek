//
//  ViewController.swift
//  16thWeek
//
//  Created by Mustafa Berkay Kaya on 29.01.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

class ViewController: UIViewController {
    
    private let tableView = UITableViewBuilder().build()
    private let addNoteButton = UIButtonBuilder().title("Add Note").build()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        addSubViews()
    }
}

extension ViewController {
    
    private func addSubViews() {
        addTableView()
        addButton()
        
    }
        
    private func addTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.topToSuperview(usingSafeArea: true).constant = 20
        tableView.trailingToSuperview()
        tableView.leadingToSuperview()
        tableView.bottomToSuperview().constant = -60
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    private func addButton() {
        view.addSubview(addNoteButton)
        addNoteButton.bottomToSuperview().constant = -20
        addNoteButton.horizontalToSuperview()
        addNoteButton.addTarget(self, action: #selector(tappedSaveButton), for: .touchUpInside)
    }
    
    @objc
    func tappedSaveButton() {
        let nextVC = NoteAddViewController()
        nextVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath)
        cell.textLabel?.text = "dd"
        return cell
    }
}
