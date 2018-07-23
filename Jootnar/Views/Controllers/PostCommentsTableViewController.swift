//
//  PostCommentsTableViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/12/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit

class PostCommentsTableViewController: UITableViewController {

    let postCommentTableViewCell = "PostCommentTableViewCell"
    var postsViewModel: PostsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postsViewModel?.numberOfComments(in: postsViewModel?.selectedPost) ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: postCommentTableViewCell, for: indexPath) as? PostCommentTableViewCell else {
            fatalError("The dequeued cell is not an instance of PostCommentTableViewCell.")
        }
        
        if let commentDate = postsViewModel?.selectedPost?.comments[indexPath.row].comment.createdAt {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: commentDate)
            let month = calendar.component(.month, from: commentDate)
            let day = calendar.component(.day, from: commentDate)
            
            cell.dateLabel.text = "\(month)/\(day)/\(year)"
        }
        

        cell.usernameLabel.text = postsViewModel?.selectedPost?.comments[indexPath.row].user.username
        cell.commentTextView.text = postsViewModel?.selectedPost?.comments[indexPath.row].comment.content

        return cell
    }
}
