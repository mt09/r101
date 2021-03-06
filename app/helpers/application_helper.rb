module ApplicationHelper
  def notice_message
    alert_types = { notice: :success, alert: :danger }

    close_botton_options =
    { class: "close", "data-dismiss" => "alert", "aria-hidden" => true }
    close_botton = content_tag(:botton, "x", close_botton_options)

    alerts = flash.map do |type, message|
      alert_content = close_botton + message

      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      content_tag(:div, alert_content, class: alert_class)
    end

     alerts.join("\n").html_safe
  end

end
