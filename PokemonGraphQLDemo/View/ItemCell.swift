//
//  ItemCellTableViewCell.swift
//  PokemonGraphQLDemo
//
//  Created by ko on 2020/9/18.
//  Copyright © 2020 SM. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    var cellImgv :UIImageView!
    var titleLabel : UILabel!
    var numLabel : UILabel!
    var screen = UIScreen.main.bounds
    
    var cellStackView: UIStackView!
    private func setupLabel(style: UIFont.TextStyle) -> UILabel {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byCharWrapping
        lbl.textAlignment = .left

        lbl.adjustsFontForContentSizeCategory = true

        let pointSize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style).pointSize
        lbl.font = UIFont.preferredFont(forTextStyle: style).withSize(pointSize)

        return lbl
    }


    private func setupStackView(input: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: input)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        //name
        let titleLab = setupLabel(style: .headline)
        self.titleLabel = titleLab
        //number
        let numberLab = setupLabel(style:.callout)
        self.numLabel = numberLab
        //image
        let mainImage = UIImageView.init(frame: .zero)
        mainImage.contentMode = .scaleAspectFit
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.clipsToBounds = true
        mainImage.layer.masksToBounds = true
        self.cellImgv = mainImage
        self.contentView.addSubview(mainImage)

        let stackView = setupStackView(input: [titleLab, numberLab])
        self.cellStackView = stackView
        self.contentView.addSubview(stackView)

        //layout
        let ctv = self.contentView
        NSLayoutConstraint.activate([
            mainImage.widthAnchor.constraint(equalToConstant: screen.size.width/3),
            mainImage.heightAnchor.constraint(equalToConstant: screen.size.width/3),
            mainImage.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: ctv.topAnchor, multiplier: 1),
            mainImage.leadingAnchor.constraint(equalTo: ctv.layoutMarginsGuide.leadingAnchor),
            mainImage.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: ctv.layoutMarginsGuide.bottomAnchor, multiplier: 1),
 
            cellStackView.topAnchor.constraint(equalTo: ctv.topAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: ctv.trailingAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: ctv.bottomAnchor)
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {

        super.layoutSubviews()

    }

}

 
