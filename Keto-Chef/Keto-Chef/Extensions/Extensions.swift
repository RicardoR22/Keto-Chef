//
//  Extensions.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension UITextField {
    func leftPadding(space: CGFloat) {
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: space, height: self.frame.size.height))
        self.leftView = padding
        self.leftViewMode = .always
    }
}

extension RecipeFormViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        guard let image_data = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        let imageData:Data = image_data.pngData()!
        let imageStr = imageData.base64EncodedString()
        self.dismiss(animated: true, completion: nil)
    }
}
