//
//  ProfileViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/12/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var postsTableView: UITableView!
    
    var userViewModel: UsersViewModel?
    var postsViewModel: PostsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTableView.dataSource = self
        
        avatarImage.layer.borderWidth = 0
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.cornerRadius = avatarImage.frame.width/2
        avatarImage.clipsToBounds = true
        
        let userViewModelDependencies = UsersViewModel.Dependencies()
        userViewModel = UsersViewModel(dependencies: userViewModelDependencies)
        userViewModel?.onUserDidUpdate = onUserDidUpdate

        let postsViewModelDependencies = PostsViewModel.Dependencies()
        postsViewModel = PostsViewModel(dependencies: postsViewModelDependencies)
        postsViewModel?.onPostsDidUpdate = onPostsDidUpdate
        
        userViewModel?.getProfile()
    }
    
    func buildProfile() {
        guard let user = userViewModel?.user, let following = userViewModel?.follows else { return }
        
        usernameLabel.text = user.username
        followersLabel.text = "\(following.followers.count)"
        followingLabel.text = "\(following.following.count)"
        
        if let avatarURL = try? user.avatar.asURL() {
            avatarImage.af_setImage(withURL: avatarURL)
        }
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsViewModel?.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePostTableViewCell") as? ProfilePostTableViewCell else {
            fatalError("Deque on ProfilePostTableViewCell failed.")
        }
        
        if let post = postsViewModel?.posts?[indexPath.row] {
            cell.postTitle.text = post.title
            cell.descriptionLabel.text = post.description
            cell.likesLabel.text = "\(post.likes)"
            cell.commentsLabel.text = "\(post.comments.count)"
            
            if let postImageURL = try? post.image.asURL() {
                cell.postImage.af_setImage(withURL: postImageURL)
            }
        }

        return cell
    }
}

extension ProfileViewController {
    func onUserDidUpdate() {
        buildProfile()
        postsViewModel?.findPosts(for: userViewModel?.user)
    }
    
    func onPostsDidUpdate() {
        self.postsTableView.reloadData()
    }
}
