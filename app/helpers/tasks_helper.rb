module TasksHelper
    def time_factor(time)
        t = time.split.last
        class_name = ""
        if t == "day" || t == "hours"
            class_name = "bg-warning" 
        elsif t == "hour" || t == "minute" || t == "minutes" 
            class_name = "bg-danger"
        end
        "<td class='#{class_name}'>#{time}</td>".html_safe
    end
end
