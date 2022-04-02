//
//  Constants.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 31/03/2022.
//

import Foundation
import UIKit

struct Constants {
    
    enum CharacterList {
        
        static let cellId = "CharacterListCollectionViewCell"
        static let titleText = "character_list_view_controller_title_text".localized()
    }
    
    enum CharacterDetail {
        
        static let doneButtonTitle = "done_button_text".localized()
        static let doneButtonColor = UIColor(red: 138/255, green: 103/255, blue: 190/255, alpha: 1)
        static let tableViewCellId = "UITableViewCell"
        static let dropDownTitleText = "drop_down_title_text".localized()
    }
    
    enum AlertView {
        
        static let title = "alert_view_title_text".localized()
        static let dismissButtonTitle = "dismiss_button_title_text".localized()
    }
    
    enum DropDownButton {
        
        static let backgroundColor = UIColor(red: 28/255, green: 30/255, blue: 31/255, alpha: 1)
        static let dropDownMenuOpenedArrowImage = "drop_down_menu_opened_arrow"
        static let dropDownMenuClosedArrowImage = "drop_down_menu_closed_arrow"
    }
    
    enum PlaceholderImage {
        
        static let name = "placeholder_image"
    }
}
