//
//  PostDetailViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/12/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var postsViewModel: PostsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let post = postsViewModel?.selectedPost {
            titleLabel.text = post.title
            likesLabel.text = "\(post.likes)"
            commentsLabel.text = "\(post.comments.count)"
            descriptionTextView.text = post.description
            if let imageURL = try? post.image.asURL() {
                postImage.af_setImage(withURL: imageURL)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let postCommentVC = segue.destination as? PostCommentsTableViewController {
            postCommentVC.postsViewModel = postsViewModel
        }
    }
    
    @IBAction func onTapComments(recognizer: UITapGestureRecognizer)   {
        performSegue(withIdentifier: "PostCommentsSegue", sender: nil)
    }
}
