//
//  NotifacationTableViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 9/7/23.
//

import UIKit
import SnapKit

class NotifacationTableViewCell: UITableViewCell {
    static let identifier = "NotifacationTableViewCell"
    
    public lazy var yourOrderIsReady: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ готов"
        label.textColor = UIColor(named: "blue")
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    public lazy var timeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "19:02"
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        lb.textColor = UIColor(named: "blue")
        return lb
    }()
    public lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 6
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()
    public lazy var cappuccinoLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.text = "Капучино,х1"
        lb.textColor = UIColor(named: "black")
        lb.font = .systemFont(ofSize: 14, weight: .bold)
        return lb
    }()
    public lazy var americanoLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Капучино,х2"
        lb.numberOfLines = 0
        lb.textColor = UIColor(named: "black")
        lb.font = .systemFont(ofSize: 14, weight: .bold)
        return lb
    }()
    public lazy var latteLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Багровый за.."
        lb.textColor = UIColor(named: "black")
        lb.font = .systemFont(ofSize: 14, weight: .bold)
        lb.numberOfLines = 0
        return lb
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUp() {
        setupViews()
        setupConstrains()
    }
    private func setupViews() {
        contentView.backgroundColor = .clear
        contentView.addSubview(yourOrderIsReady)
        contentView.addSubview(timeLabel)
        contentView.addSubview(mainStackView)
        contentView.addSubview(cappuccinoLabel)
        contentView.addSubview(americanoLabel)
        contentView.addSubview(latteLabel)
        [cappuccinoLabel,
         americanoLabel,
         latteLabel]
        .forEach {mainStackView.addArrangedSubview($0)}
    }
    private func setupConstrains() {
        yourOrderIsReady.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(computedHeight(16))
            make.leading.equalToSuperview().offset(computedWidth(32))
            make.height.equalTo(computedHeight(18))
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(computedHeight(16))
            make.trailing.equalToSuperview().inset(computedWidth(48))
            make.height.equalTo(computedHeight(14))
        }
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(yourOrderIsReady.snp.bottom).offset(computedHeight(12))
            $0.leading.equalToSuperview().offset(computedWidth(32))
            $0.height.equalTo(computedHeight(16))
        }
    }
}

