module ApplicationHelper
  
  def main_menu
    links = []
    
    options = params[:controller] == "friends" ? { class: "active" } : {}
    links << content_tag(:li, link_to("Friends", friends_path), options).html_safe
    
    content_tag(:ul, links.join("\n").html_safe, class: "nav")
  end
  
end
