module PostsHelper
    def display_line_breaks(post_body)
      safe_join(post_body.split("\r\n"), raw("<br />"))
    end
end
