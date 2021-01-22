module ApplicationHelper

  ALERT_STYLES = {notice: 'success', alert: 'danger'}.freeze

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to t('helpers.githab_url.name_project'), "http://github.com/#{author}/#{repo}"
  end

  def style_alerts(type, message)
    p type
    class_type = ALERT_STYLES[type.to_sym] || 'primary'
    content_tag :div, message, class: "alert alert-#{class_type}", role: 'alert'
  end
end
