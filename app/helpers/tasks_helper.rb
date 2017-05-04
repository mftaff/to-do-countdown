module TasksHelper
    def time_factor(time_left, created_at)
        t = time_left.split.last
        class_name = ""
        
        if created_at > Time.now - 7.days
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
end
