//
//  ChallChampFeedPostTableViewCell.swift
//  Chall Champ
//
//  Created by Marcus Hauen-Limkilde on 7/4/23.
//

import UIKit

final class ChallChampFeedPostTableViewCell: UITableViewCell {
    
    static let identifier = "ChallChampFeedPostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        // Configure the cell
    }
    
}

