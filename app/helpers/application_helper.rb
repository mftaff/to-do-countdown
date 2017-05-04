module ApplicationHelper
    def log_info(data)
        if data.is_a? Array
            data.each do |d|
                Rails.logger.info ">>>>>>> #{d}"
            end
        else
            Rails.logger.info ">>>>>>> #{data}"
        end
    end
end
