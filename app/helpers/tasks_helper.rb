module TasksHelper
    def time_factor(time_left, task)
        t = time_left.split.last
        class_name = ""
        
        if task.expires_at > Time.now
            if t == "day" || t == "hours"
                class_name = "bg-warning" 
            elsif t == "hour" || t == "minute" || t == "minutes" 
                class_name = "bg-danger"
            end
            "<td class='#{class_name}'>#{time_left}</td>".html_safe
        else
            "<td class='bg-danger'>EXPIRED!</td>".html_safe
        end
    end
    
    def expired_task_button
        "<div id='toggle-expired'>Show Expired Tasks</div>".html_safe unless @expired_tasks.blank?
    end
end
