//
//  VotingCluster.swift
//  winston
//
//  Created by Daniel Inama on 10/08/23.
//

import SwiftUI
import Defaults

/// A cluster consisting of the upvote, downvote button and the amount of upvotes with an optional upvote ratio
struct VotesCluster: View {
  var data: PostData
  var likeRatio: CGFloat? //if the upvote ratio is nil it will be hidden
  var post: Post
  var vertical = false
  @Default(.showUpvoteRatio) var showUpvoteRatio
  
  var body: some View {
    let layout = vertical ? AnyLayout(VStackLayout(spacing: 2)) : AnyLayout(HStackLayout(spacing: showUpvoteRatio ? 4 : 8))
//    let votes = calculateUpAndDownVotes(upvoteRatio: data.upvote_ratio, score: data.ups)
    layout {
      VoteButton(color: data.likes != nil && data.likes! ? .orange : .gray, voteAction: .up,image: "arrow.up", post: post)
      
      if !vertical {
        VStack {
          Text(formatBigNumber(data.ups))
            .contentTransition(.numericText())
            .foregroundColor(data.likes != nil ? (data.likes! ? .orange : .blue) : .gray)
            .fontSize(16, .semibold)
          //          .viewVotes(votes.upvotes, votes.downvotes)
          
          if likeRatio != nil, let ratio = likeRatio {
            Label(title: {
              Text(String(Int(ratio * 100)) + "%")
            }, icon: {
              Image(systemName: "face.smiling")
            })
            .labelStyle(CustomLabel(spacing: 1))
            .fontSize(12, .medium)
            .foregroundColor(.gray)
          }
        }
        .padding(.horizontal, 0)
      } else {
        Spacer()
      }
      
      VoteButton(color: data.likes != nil && !data.likes! ? .blue : .gray, voteAction: .down, image: "arrow.down", post: post)
      if vertical {
        Spacer()
      }
    }
  }
  
}
