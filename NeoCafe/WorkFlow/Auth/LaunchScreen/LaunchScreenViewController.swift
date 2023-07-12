//
//  LaunchScreenViewController.swift
//  NeoCafe
//
//  Created by Adinay on 3/6/23.
//

import UIKit
import SnapKit

final class LaunchScreenViewController: BaseViewController {
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "кофейня neocafe")
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.addSubview(mainImage)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){ [weak self] in
            let vc = StartViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
//            self.animate()
//        })
//    }
    
//    private func animate() {
//        UIView.animate(withDuration: 56, animations: {
//            let size = self.view.frame.size.width * 33
//            let diffX = size - self.view.frame.size.width
//            let diffY = self.view.frame.size.height - size
//            self.mainImage.frame = CGRect(x: -(diffX/2),
//                                          y: diffY/2,
//                                          width: size,
//                                          height: size)
//        })
           
//    }
    
    override func setupConstrains() {
        super.setupConstrains()
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(288))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(102))
            $0.centerX.equalToSuperview()
        }
    }
}
