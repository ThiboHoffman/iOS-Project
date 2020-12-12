//
//  CardTableViewCell.swift
//  iosApps
//
//  Created by Thibo Hoffman on 21/11/2020.
//

import UIKit

class MyCardTableViewCell: UITableViewCell {

    var previewLabel: UILabel!
    var likesImageView: UIImageView!
    var likesLabel: UILabel!
    var dislikesImageView: UIImageView!
    var dislikesLabel: UILabel!
    var reportsImageView: UIImageView!
    var reportsLabel: UILabel!
    var stackView: UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        previewLabel = UILabel()
        previewLabel.translatesAutoresizingMaskIntoConstraints = false
        previewLabel.font = .systemFont(ofSize: 14)
        previewLabel.textAlignment = .center
        contentView.addSubview(previewLabel)
        
        likesImageView = UIImageView()
        likesImageView.image = UIImage(named: "likeIcon")
        likesImageView.contentMode = .scaleAspectFit
        likesImageView.clipsToBounds = true
        likesImageView.translatesAutoresizingMaskIntoConstraints = false
        
        dislikesImageView = UIImageView()
        dislikesImageView.image = UIImage(named: "dislikeIcon")
        dislikesImageView.contentMode = .scaleAspectFit
        dislikesImageView.clipsToBounds = true
        dislikesImageView.translatesAutoresizingMaskIntoConstraints = false
        
        reportsImageView = UIImageView()
        reportsImageView.image = UIImage(named: "reportIcon")
        reportsImageView.contentMode = .scaleAspectFit
        reportsImageView.clipsToBounds = true
        reportsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        likesLabel = UILabel()
        previewLabel.translatesAutoresizingMaskIntoConstraints = false
        previewLabel.font = .systemFont(ofSize: 12)
        
        dislikesLabel = UILabel()
        previewLabel.translatesAutoresizingMaskIntoConstraints = false
        previewLabel.font = .systemFont(ofSize: 12)
        
        reportsLabel = UILabel()
        previewLabel.translatesAutoresizingMaskIntoConstraints = false
        previewLabel.font = .systemFont(ofSize: 12)
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(likesLabel)
        stackView.addArrangedSubview(likesImageView)
        stackView.addArrangedSubview(dislikesLabel)
        stackView.addArrangedSubview(dislikesImageView)
        stackView.addArrangedSubview(reportsLabel)
        stackView.addArrangedSubview(reportsImageView)
        contentView.addSubview(stackView)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            previewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            previewLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.95),
            previewLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45)
        ])
        
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.95),
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45)
        ])
    }
    
    func configure(for card: CardOnline) {
        previewLabel.text = card.text;
        likesLabel.text = String(card.likes)
        dislikesLabel.text = String(card.dislikes)
        reportsLabel.text = String(card.reports)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
