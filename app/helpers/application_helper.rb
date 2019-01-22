module ApplicationHelper

  def bootstrap_flash_messages(flash_css)

    case flash_css
      when 'success'
        'alert-success'
      when 'error'
        'alert-danger'
      when 'alert'
        'alert-warning'
    else
      flash_css.to_s
    end
  end
end
