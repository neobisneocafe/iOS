//
//  QRCodeViewController.swift
//  NeoCafe
//
//  Created by Adinay on 8/6/23.
//

import UIKit
import SnapKit
import AVFoundation

class QRCodeViewController: BaseViewController {
    
    private lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Заказ через QR Code"
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        lb.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        return lb
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Пожалуйста наведите камеру на QR-код, который на столе, чтобы забронировать стол за вами"
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lb
    }()
    
    private let scanerView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "scaner")
        return iv
    }()
    
    private lazy var qrCodeScanner: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var noteLabel: UILabel = {
        let label = UILabel()
        label.text = "Заказ по QR Code начислит вам бонусные баллы за оформленный заказ"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    // MARK: -  Private Methods
    
    private let viewModel = QRCodeViewModel()
    private let locationsViewModel = LocationsViewModel()
    private let tableResponseViewModel = TableResponseVM()
    private var currentQRCodTable: QRCodTableResponse?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async { [weak self] in
            self?.setupVideo()
            self?.createScanning()
            self?.book()
        }
    }
    
    
    // MARK: - Характеристики
    
    private var video = AVCaptureVideoPreviewLayer()
    private var session = AVCaptureSession()
    private var captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(scanerView)
        view.addSubview(qrCodeScanner)
        view.addSubview(noteLabel)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets).offset(computedHeight(32))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(68))
            $0.height.equalTo(computedHeight(24))
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(computedHeight(24))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
            $0.height.equalTo(computedHeight(58))
        }
        scanerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(computedHeight(computedWidth(250)))
        }
        qrCodeScanner.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(computedHeight(computedWidth(192)))
        }
        noteLabel.snp.makeConstraints {
            $0.top.equalTo(qrCodeScanner.snp.bottom).offset(56)
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
            $0.height.equalTo(computedHeight(40))
        }
    }
    
    
    private func setupVideo() {
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        } catch {
            fatalError(error.localizedDescription)
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        video = AVCaptureVideoPreviewLayer(session: session)
        video.videoGravity = .resizeAspectFill
        qrCodeScanner.layer.addSublayer(video)
        video.frame = qrCodeScanner.layer.bounds
        DispatchQueue.global(qos:.background).async {
            self.session.startRunning()
        }
    }
    
    
   private func createScanning () {
        let height: CGFloat = 14
        let opacity: Float = 0.6
        let layer = CAGradientLayer()
        layer.opacity = opacity
        let squareWidth = view.frame.width * 0.6
        layer.frame = CGRect(x: qrCodeScanner.bounds.origin.x - 20,
                             y: qrCodeScanner.bounds.origin.y,
                             width: qrCodeScanner.frame.width + 40,
                             height: 5)
        self.qrCodeScanner.layer.insertSublayer(layer, at: 3)
        let initialYPosition = layer.position.y
        let finalYPosition = initialYPosition + squareWidth - height - 10
        let duration: CFTimeInterval = 3
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.fromValue = initialYPosition as NSNumber
        animation.toValue = finalYPosition as NSNumber
        animation.duration = duration
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        layer.add(animation, forKey: nil)
    }
    
    private func book() {
        // TODO: поменять один филиал на несколько
        locationsViewModel.fetchBranches { [weak self] branches in
            guard
                let branch = branches.first,
                let id = branch.id,
                let uniqueCode = self?.currentQRCodTable?.uniqueCode
            else {
                return
            }
            
            // сделать заказ
            let tableOrdersRequest = TableOrdersRequest(
                uniqueCode: uniqueCode,
                dishId: [1, 2],
                bonusPoints: 0
            )
            self?.tableResponseViewModel.fetchTableOrders(requst: tableOrdersRequest, branchId: id) { orders in
                print(orders)
            }
            
            // бронь столика
            let request = BookQrRequest(branchId: id, uniqueCode: uniqueCode)
            self?.viewModel.book(request: request) { error in
                print(error)
            }
        }
    }
}


// MARK: - Читатель QRCode

extension QRCodeViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count != 0 {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                
                if object.type == AVMetadataObject.ObjectType.qr,
                   let nameText = object.stringValue {
                    let alert = UIAlertController(title: "Заказ успешно оформлен",
                                                  message: "\(nameText)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Хорошо",
                                                  style: .default) {  [weak self] _ in
                        self?.dismiss(animated: true)
                    })
                    present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
