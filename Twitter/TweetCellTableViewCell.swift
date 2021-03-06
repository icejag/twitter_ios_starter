//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Arun Deepak Sampath Kumar on 10/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit


class TweetCellTableViewCell: UITableViewCell {


    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var retwetButton: UIButton!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    var favorited:Bool = false
    var tweetId: Int = -1
    var retweeted:Bool = false
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (Error) in
                print("favorite did not sucseed:\(Error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (Error) in
                print("unfavorite did not succeed:\(Error)")
            })
        }
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        let toBeRetweeted = !retweeted
         if(toBeRetweeted){
             TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
                 self.setRetweet(true)
             }, failure: { (Error) in
                 print("retweet did not sucseed:\(Error)")
             })
         }
         else{
             TwitterAPICaller.client?.unretweet(tweetId: tweetId, success: {
                 self.setRetweet(false)
             }, failure: { (Error) in
                 print("unretweet did not succeed:\(Error)")
             })
         }
    }

    func setFavorite(_ isfavorited:Bool){
        favorited = isfavorited
        if(favorited){
        favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else
        {
favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
        
    }
    func setRetweet(_ isretweeted:Bool){
       retweeted = isretweeted
        if(retweeted){
            retwetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
           // retwetButton.isEnabled = false
            
        }
        else{
         retwetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
           // retwetButton.isEnabled = true
            
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
