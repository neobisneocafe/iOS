//
//  LocationsViewController.swift
//  NeoCafe
//
//  Created by Adinay on 8/6/23.
//

import UIKit
import SnapKit
import SwiftyJSON

class LocationsViewController: BaseViewController {
    
//    var branch = [BranchDTO]()
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(backTap))
        iv.addGestureRecognizer((imageTap))
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        label.text = "Филиалы"
        return label
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "push"), for: .normal)
        button.addTarget(self, action: #selector(pushTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var branchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        label.text = "Филиалы"
        return label
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.registerCollectionReusable(CellType: LocationsCell.self)
        view.backgroundColor = .white
        return view
    }()

    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        view.addSubview(backImage)
        view.addSubview(titleLabel)
        view.addSubview(pushButton)
        view.addSubview(branchLabel)
        view.addSubview(collection)
//        fetcSpeakers()
    }
    
    override func setupConstrains() {
        backImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(50))
            $0.leading.equalToSuperview().offset(computedWidth(24))
        }
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(computedHeight(40))
            make.leading.equalTo(backImage.snp.leading).offset(132)
            make.height.equalTo(computedHeight(40))
        }
        pushButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(computedHeight(50))
            make.trailing.equalToSuperview().inset(computedWidth(16))
        }
        branchLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(82))
            $0.leading.equalToSuperview().offset(computedWidth(16))
            $0.height.equalTo(computedHeight(34))
        }
        collection.snp.makeConstraints {
            $0.top.equalTo(branchLabel.snp.bottom).offset(computedHeight(10))
            $0.bottom.trailing.leading.equalToSuperview()
        }
    }
    
//    func fetcSpeakers() {
//        let url = URL(string: "https://neo-cafe-neobis-d301ec8e3f9a.herokuapp.com/api/branch")
//        var request = URLRequest(url: url!)
//        request.httpMethod = "GET"
////        DataStoreUserDefaults.shared.setAccessToken(accessToken)
//        request.setValue("Bearer \(DSGenerator.sharedInstance.getAccessToken()!)", forHTTPHeaderField: "Authorization")
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else  {
//                print("Произошла ошибка при доступе к данным")
//                return
//            }
//            let json = JSON(data)
//            print(json)
//            if let httpResponse = response as? HTTPURLResponse {
//                    print(httpResponse.statusCode)
//                }
//            do {
//                let branch  = try JSONDecoder().decode([BranchDTO].self, from: data)
//                self.branch = branch
//            }
//            catch {
//                print("Ошибка при декодировании Json в структуру Swift")
//            }
//            DispatchQueue.main.async { [weak self] in
//                self?.collection.reloadData()  // обновляет таблицу
//            }
//        }
//        task.resume()
//    }
}


// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension LocationsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationsCell.identifier, for: indexPath) as! LocationsCell
        cell.delegate = self
//        cell.locationNameLabel.text = branch[indexPath.row].name
//        cell.adressLabel.text = String(branch[indexPath.row].adress!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { CGSize(width: screenWidth, height: 195) }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize { CGSize(width: screenWidth, height: 40) }
}


// MARK: - LocationsCellDelegate

extension LocationsViewController: LocationsCellDelegate {
    func didTapAppButton() {
        let alertController = UIAlertController(title: "Мы переведем вас в 2ГИС",
                                                message:"Вы сможете быстро сориентироваться и найти быстрый маршрут к нам! Ждем вас!", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Перейти",
                                      style: .default) { (_) in
            // Открытие другого приложения
            if let url = URL(string: "https://2gis.kg/bishkek") {
                UIApplication.shared.open(url,
                                          options: [:],
                                          completionHandler: nil)
            }
        }
        let noAction = UIAlertAction(title: "Остаться",
                                     style: .cancel,
                                     handler: nil)
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        present(alertController, animated: true, completion: nil)
    }

    func didTapPhoneNumBerButton() {
         
    }

    }
    
   

// MARK: - Selector

extension LocationsViewController {
    @objc func backTap() {
//        let vc = MainViewController()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func pushTap(){
        let vc = NotifacationVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
