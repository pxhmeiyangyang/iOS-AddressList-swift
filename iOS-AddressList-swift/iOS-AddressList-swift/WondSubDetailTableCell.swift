//
//  WondSubDetailTableCell.swift
//  UniKar
//
//  Created by pxh on 2016/11/2.
//  Copyright © 2016年 pxh. All rights reserved.
//

import UIKit

class WondSubDetailTableCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var musicImage: UIImageView!
    
    
    var _isPlay : Bool?
    var isPlay : Bool?{
        set{
            _isPlay = newValue
            musicImage.isHidden = true
            if newValue == true{
                musicImage.isHidden = false
                cellTitle.textColor = UIColor.cyan
            }else if newValue == false{
                cellTitle.textColor = UIColor.black
            }
        }
        get{
            return _isPlay
        }
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
