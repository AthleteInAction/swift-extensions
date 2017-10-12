//
//  WamblTable.swift
//
//  Created by William Robinson on 10/11/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import UIKit

protocol WamblTableDelegate {
    func wamblTableRefresh()
    func wamblTableLoadingChanged(is_loading: Bool)
}
class WamblTable: UITableView {

    var wambl_delegate: WamblTableDelegate?

    var color: UIColor = UIColor.bg { didSet { loader.color = color } }
    var viewController: UIViewController?
    var tv: UIView?

    lazy var loader: UIActivityIndicatorView = {
        let a = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        a.color = self.color
        return a
    }()

    lazy var refresher: UIRefreshControl = {
        let a = UIRefreshControl()
        a.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return a
    }()
    @objc func refresh(){ wambl_delegate?.wamblTableRefresh() }

    var isNavigationLoaderEnabled: Bool = false

    var loading: Bool = false {

        didSet {

            loading ? loader.startAnimating() : loader.stopAnimating()
            loading ? () : refresher.endRefreshing()
            wambl_delegate?.wamblTableLoadingChanged(is_loading: loading)

            guard isNavigationLoaderEnabled else { return }

            if loading {

                tv = viewController?.navigationItem.titleView
                viewController?.navigationItem.titleView = loader

            } else {

                viewController?.navigationItem.titleView = tv

            }

        }

    }
    var loadCount: Int = 0 {

        didSet {

            if loadCount != 0 {

                if loader.isAnimating { return }

                tv = viewController?.navigationItem.titleView
                loader.startAnimating()
                viewController?.navigationItem.titleView = loader

            } else {

                refresher.endRefreshing()
                viewController?.navigationItem.titleView = tv
                loader.stopAnimating()

            }

            wambl_delegate?.wamblTableLoadingChanged(is_loading: loadCount != 0)

        }

    }

    init(viewController _viewController: UIViewController? = nil, view _view: UIView? = nil, cells _cells: [AnyClass]? = nil, style _style: UITableViewStyle = .plain){
        super.init(frame: CGRect.zero, style: _style)

        backgroundColor = style == .grouped ? UIColor.Table.grouped.color : UIColor.clear
        separatorStyle = .none
        estimatedRowHeight = 44
        rowHeight = UITableViewAutomaticDimension

        for cell in _cells ?? [] { register(cell, forCellReuseIdentifier: "\(cell)") }

        addSubview(refresher)

        if let _view = _viewController {
            viewController = _view
            delegate = _view as? UITableViewDelegate
            dataSource = _view as? UITableViewDataSource
            wambl_delegate = _view as? RWTableDelegate
        }
        if let _view = _view {
            delegate = _view as? UITableViewDelegate
            dataSource = _view as? UITableViewDataSource
            wambl_delegate = _view as? RWTableDelegate
        }

    }

    override init(frame: CGRect, style: UITableViewStyle) { super.init(frame: frame, style: style) }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

}
