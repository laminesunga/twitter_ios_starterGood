//
//  TableViewCellUITableViewCell.swift
//  Twitter
//
//  Created by Undergrad-Staff on 9/20/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TableViewCellUITableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    @IBOutlet weak var tweetContent: UILabel!
    
    
    @IBOutlet weak var retweetButton: UIButton!
    
    
    @IBOutlet weak var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1
    //var retweeted:Bool = false
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setfavorite(true)
            }, failure: { (error) in
                print ("Favorite did not succed: \(error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setfavorite(false)
            }, failure: { (error) in
                print ("unfavorite did not succed: \(error)")
            })
            
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error is retweeting: \(error)")
            
        })
        
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    
    func setfavorite(_ isForited:Bool){
        favorited = isForited
        if (favorited){
            favButton.setImage(UIImage (named:"favor-icon-red"), for:UIControl.State.normal )
        }
        else{
            favButton.setImage(UIImage (named:"favor-icon"), for:UIControl.State.normal)
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
