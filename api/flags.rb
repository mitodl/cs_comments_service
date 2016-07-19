put "#{APIPREFIX}/threads/:thread_id/abuse_flag" do |thread_id|
  flag_as_abuse thread

  # Mark thread as read for requesting user on flag thread as abusive
  user.mark_as_read(thread)
  thread.reload.to_hash.to_json
end

put "#{APIPREFIX}/threads/:thread_id/abuse_unflag" do |thread_id|
  un_flag_as_abuse thread

  # Mark thread as read for requesting user on unflag thread as abusive
  user.mark_as_read(thread)
  thread.reload.to_hash.to_json
end

put "#{APIPREFIX}/comments/:comment_id/abuse_flag" do |comment_id|
  flag_as_abuse comment

  # Mark thread as read for requesting user on flag comment as abusive
  user.mark_as_read(comment.comment_thread)
  comment.reload.to_hash.to_json
end

put "#{APIPREFIX}/comments/:comment_id/abuse_unflag" do |comment_id|
  un_flag_as_abuse comment

  # Mark thread as read for requesting user on unflag comment as abusive
  user.mark_as_read(comment.comment_thread)
  comment.reload.to_hash.to_json
end
