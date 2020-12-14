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
    var likesSV: UIStackView!
    var dislikesSV: UIStackView!
    var reportsSV: UIStackView!

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        previewLabel = UILabel()
        previewLabel.translatesAutoresizingMaskIntoConstraints = false
        previewLabel.font = .systemFont(ofSize: 14)
        previewLabel.textAlignment = .center
        previewLabel.textColor = UIColor.text()
        contentView.addSubview(previewLabel)
        
        likesImageView = UIImageView()
        likesImageView.image = UIImage(named: "likeIconDark")
        likesImageView.contentMode = .scaleAspectFit
        likesImageView.clipsToBounds = true
        likesImageView.translatesAutoresizingMaskIntoConstraints = false
        
        dislikesImageView = UIImageView()
        dislikesImageView.image = UIImage(named: "dislikeIconDark")
        dislikesImageView.contentMode = .scaleAspectFit
        dislikesImageView.clipsToBounds = true
        dislikesImageView.translatesAutoresizingMaskIntoConstraints = false
        
        reportsImageView = UIImageView()
        reportsImageView.image = UIImage(named: "reportIconDark")
        reportsImageView.contentMode = .scaleAspectFit
        reportsImageView.clipsToBounds = true
        reportsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.font = .systemFont(ofSize: 15)
        likesLabel.textColor = UIColor.text()
        
        dislikesLabel = UILabel()
        dislikesLabel.translatesAutoresizingMaskIntoConstraints = false
        dislikesLabel.font = .systemFont(ofSize: 15)
        dislikesLabel.textColor = UIColor.text()
            
        reportsLabel = UILabel()
        reportsLabel.translatesAutoresizingMaskIntoConstraints = false
        reportsLabel.font = .systemFont(ofSize: 15)
        dislikesLabel.textColor = UIColor.text()
        
        likesSV = UIStackView()
        likesSV.translatesAutoresizingMaskIntoConstraints = false
        likesSV.axis = .horizontal
        likesSV.alignment = .fill
        likesSV.addArrangedSubview(likesLabel)
        likesSV.addArrangedSubview(likesImageView)
        dislikesSV = UIStackView()
        dislikesSV.translatesAutoresizingMaskIntoConstraints = false
        dislikesSV.axis = .horizontal
        dislikesSV.alignment = .fill
        dislikesSV.addArrangedSubview(dislikesLabel)
        dislikesSV.addArrangedSubview(dislikesImageView)
        reportsSV = UIStackView()
        reportsSV.translatesAutoresizingMaskIntoConstraints = false
        reportsSV.axis = .horizontal
        reportsSV.alignment = .fill
        reportsSV.addArrangedSubview(reportsLabel)
        reportsSV.addArrangedSubview(reportsImageView)
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(likesSV)
        stackView.addArrangedSubview(dislikesSV)
        stackView.addArrangedSubview(reportsSV)
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
            previewLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.70),
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.60),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            likesSV.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.3),
            dislikesSV.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.3),
            reportsSV.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.3)
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
