//
//  CardsCarouselView.swift
//  Paisa Example
//
//  Created by Niranjan Ravichandran on 3/22/18.
//  Copyright © 2018 Aviato. All rights reserved.
//

import UIKit

class CardsCarouselView: UIView, UIScrollViewDelegate {

    private var scrollView: UIScrollView!
    private var cardWidth: CGFloat = 0
    private var cardHeight: CGFloat = 0
    private var xOffset: CGFloat = 15
    private var cards: [UIView] = [UIView]()
    private var lastContentOffset: CGFloat = 0
    private var currentPageIndex = 0
    
    /*
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInitView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInitView()
    }
    
    func customInitView() {
        self.clipsToBounds = true
        self.frame.size.height = (self.frame.width*2)/3
        let scrollWidth = frame.width - 80
        let scrollHeight = (scrollWidth*2)/3
        scrollView = UIScrollView(frame: CGRect.init(x: 0, y: 0, width: scrollWidth, height: scrollHeight))
        cardWidth = scrollWidth - 30
        cardHeight = scrollHeight - 30
        scrollView.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        scrollView.alwaysBounceHorizontal = true
        scrollView.clipsToBounds = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        self.addSubview(scrollView)
    }
    
    private func append(_ card: UIView) {
        self.cards.append(card)
        card.frame.size.width = cardWidth
        card.frame.size.height = cardHeight
        card.frame.origin.x = xOffset
        card.frame.origin.y = 15
        self.scrollView.addSubview(card)
        self.scrollView.contentSize.width += cardWidth + 30
        self.xOffset += cardWidth + 30
    }
    
    func appendCard(_ cards: UIView...) {
        for card in cards {
            self.append(card)
        }
    }
    
    //MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let isScrollingRight: Bool = self.lastContentOffset > scrollView.contentOffset.x ? false : true
        
//        if isScrollingRight {
//            print("Right>>")
//            if self.currentPageIndex + 1 < self.cards.count {
//                let v = self.cards[self.currentPageIndex + 1]
//                let position = v.center.x - scrollView.contentOffset.x
//                var offset = 2 - (abs(scrollView.center.x - position) * 1.0) / scrollView.center.x
//                if offset < 1.0 {
//                    offset = 1.0
//                }
//                
//                v.transform = CGAffineTransform.identity
//                v.transform = CGAffineTransform.init(scaleX: offset, y: offset)
//            }
//        }else {
//            print("Left<<")
//        }
        
        self.lastContentOffset = scrollView.contentOffset.x
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.currentPageIndex = Int(scrollView.contentOffset.x/scrollView.frame.width)
        print(currentPageIndex)
    }
    

}
