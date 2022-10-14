//
//  ConfigViewController.swift
//  SeguraeApp
//
//  Created by Daniel on 12/08/22.
//

import UIKit

class ConfigViewController: UIViewController {
    
    // MARK: - METRICS
    
    // MARK: - PROPERTIES
    @IBOutlet weak var photoProfileImage: UIImageView!
    @IBOutlet weak var nameProfileLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var generalList: [GeneralModel] = []
    
    // MARK: - UI
    
    // MARK: - INITIALIZER
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProfile()
        configureTableView()
        setGeneralData()
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    // MARK: - PRIVATE METHODS
    
    private func configureProfile() {
        photoProfileImage.image = UIImage(named: "profile")
        photoProfileImage.layer.borderColor = UIColor.green.cgColor
        photoProfileImage.layer.borderWidth = 1
        photoProfileImage.layer.cornerRadius = photoProfileImage.frame.height / 2
        
        nameProfileLabel.textAlignment = .center
        nameProfileLabel.textColor = UIColor.white
        nameProfileLabel.text = "Vinicius Bin"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileTableViewCell.nib(), forCellReuseIdentifier: ProfileTableViewCell.cellIdentifier)
        tableView.register(SecurityTableViewCell.nib(), forCellReuseIdentifier: SecurityTableViewCell.identifier)
        tableView.register(OthersOptionsTableViewCell.nib(), forCellReuseIdentifier: OthersOptionsTableViewCell.identifier)
        tableView.register(ExitTableViewCell.nib(), forCellReuseIdentifier: ExitTableViewCell.identifier)
    }
    
    // MARK: - SETUP VIEW
    
    func setGeneralData() {
        generalList.append(GeneralModel(type: "Nome", icon: UIImage(systemName: "person.circle") ?? UIImage(), data: "Vinicíus Bin"))
        generalList.append(GeneralModel(type: "Data de nascimento", icon: UIImage(systemName: "calendar") ?? UIImage(), data: "dd/mm/aa"))
        generalList.append(GeneralModel(type: "Senha", icon: UIImage(systemName: "lock") ?? UIImage(), data: "••••••••"))
    }
    
}

// MARK: - EXTENSIONS

extension ConfigViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 2 {
            performSegue(withIdentifier: "currentPasswordSegue", sender: nil)
        } else if indexPath.section == 1 && indexPath.row == 0 {
            performSegue(withIdentifier: "createPasswordSegue", sender: nil)
        } else if indexPath.section == 2 && indexPath.row == 0 {
            performSegue(withIdentifier: "deleteAllSegue", sender: nil)
        }
    }
    
}

extension ConfigViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "   Geral"
        } else if section == 1 {
            return "   Segurança"
        } else if section == 2 {
            return "   Outras opções"
        } else {
            return nil
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UITableViewHeaderFooterView()
        vw.contentView.backgroundColor = UIColor.black
        vw.textLabel?.textColor = UIColor.white
        return vw
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return generalList.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.cellIdentifier, for: indexPath) as? ProfileTableViewCell else {
                return UITableViewCell()
            }
            cell.setupCell(with: generalList[indexPath.row])
            return cell
            
        } else if indexPath.section == 1 {
            guard let cellSecurity = tableView.dequeueReusableCell(withIdentifier: SecurityTableViewCell.identifier, for: indexPath) as? SecurityTableViewCell else {
                return UITableViewCell()
            }
            cellSecurity.securityLabel.text = "Bloqueio por senha"
            return cellSecurity
            
        } else if indexPath.section == 2 {
            guard let cellOtherOptions = tableView.dequeueReusableCell(withIdentifier: OthersOptionsTableViewCell.identifier, for: indexPath) as? OthersOptionsTableViewCell else {
                return UITableViewCell()
            }
            cellOtherOptions.othersOptionsLabel.text = "Excluir todas as movimentações"
            return cellOtherOptions
        } else {
            guard let cellExit = tableView.dequeueReusableCell(withIdentifier: ExitTableViewCell.identifier, for: indexPath) as? ExitTableViewCell else {
                return UITableViewCell()
            }
            cellExit.exitLabel.text = "Sair"
            return cellExit
        }
    }
}

