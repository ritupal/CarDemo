//
//  CarListCell.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import UIKit

class CarListCell: UITableViewCell, Identifiable {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLicence: UILabel!
    @IBOutlet weak var lblFuelType: UILabel!
    @IBOutlet weak var imageViewCar: LazyImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ vm: CarListCellViewModel) {
        self.lblName.text = vm.name
        self.lblLicence.text = vm.licencePlate
        self.lblFuelType.text = vm.fuelType
        
        guard let urlString = vm.carImage, let imageUrl = URL(string: urlString) else { return }
        self.imageViewCar.loadImage(imageURL: imageUrl, placeHolderImage: Constants.ImageNames.carPlaceholder)
    }
}
