module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to "Github", "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def project_link
    link_to "Test Guru", root_path, class: "navbar-brand"
  end

  def flash_class(key)
    case key.to_sym
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-danger"
    end
  end
end
