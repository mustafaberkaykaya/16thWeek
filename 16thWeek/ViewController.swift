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
    
    private var models = [Note]()
    
    private let tableView = UITableViewBuilder().build()
    private let addNoteButton = UIButtonBuilder().title("Add Note").build()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        addSubViews()
        configureModels()
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
    
    private func configureModels() {
        let titles = ["ataturk", "tayyıp", "web3", "kripto"]
        for title in titles {
            models.append(Note(title: title))
        }
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
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
       // cell.textLabel?.text = models[indexPath.row].title
        cell.configure(with: CustomTableViewCellViewModel(with: models[indexPath.row]))
        return cell
    }
}
