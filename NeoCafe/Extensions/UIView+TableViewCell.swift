//
//  UIView+TableViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 21/6/23.
//

import UIKit

extension UIView {
    func addCornerRadius(_ radius: CGFloat) {
            layer.cornerRadius = radius
            layer.masksToBounds = true
    }
}


//extension UITableView {
//    enum ReusableViewType: String {
//        case UITableViewElementKindSectionHeader
//    }
//    
//    func registerTableReusable<Cell: UITableViewCell>(CellType: Cell.Type) {
//            register(CellType, forCellReuseIdentifier: CellType.identifier())
//        }
//        
//        func dequeueIdentifiableCell<Cell: UITableViewCell>(_ type: Cell.Type, for indexPath: IndexPath) -> Cell {
//            let reuseId = Cell.identifier()
//            guard let cell = dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? Cell else { fatalError() }
//            return cell
//        }
//        
//    func registerReusableView<View: UITableViewHeaderFooterView>(ViewType: View.Type, type: ReusableViewType ) {
//            register(ViewType, forHeaderFooterViewReuseIdentifier: View.identifier())
//        }
//        
//    
//    func dequeueReusableView<View: UITableViewHeaderFooterView>(ViewType: ReusableViewType.Type) -> View {
//            let reuseId = View.identifier()
//            guard let view = dequeueReusableHeaderFooterView(withIdentifier: reuseId) as? View
//            else { fatalError() }
//            return view
//        }
//}
