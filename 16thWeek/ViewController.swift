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
        // Do any additional setup after loading the view.
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
        tableView.backgroundColor = .red
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
    }
    
    private func addButton() {
        view.addSubview(addNoteButton)
        addNoteButton.bottomToSuperview().constant = -20
        addNoteButton.horizontalToSuperview()
        addNoteButton.addTarget(self, action: #selector(tappedSaveButton), for: .touchUpInside)
    }
    
    @objc
    func tappedSaveButton() {
        print("aloo")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        cell.textLabel?.text = "dd"
        return cell
    }
}
