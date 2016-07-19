put "#{APIPREFIX}/comments/:comment_id/votes" do |comment_id|
  vote_for comment

  # Mark thread as read for requesting user on comment vote
  user.mark_as_read(comment.comment_thread)
  comment.reload.to_hash.to_json
end

delete "#{APIPREFIX}/comments/:comment_id/votes" do |comment_id|
  undo_vote_for comment

  # Mark thread as read for requesting user on undo comment vote
  user.mark_as_read(comment.comment_thread)
  comment.reload.to_hash.to_json
end

put "#{APIPREFIX}/threads/:thread_id/votes" do |thread_id|
  vote_for thread

  # Mark thread as read for requesting user on thread vote
  user.mark_as_read(thread)
  thread.reload.to_hash.to_json
end

delete "#{APIPREFIX}/threads/:thread_id/votes" do |thread_id|
  undo_vote_for thread

  # Mark thread as read for requesting user on undo thread vote
  user.mark_as_read(thread)
  thread.reload.to_hash.to_json
end
