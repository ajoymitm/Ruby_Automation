class Custom_Exception < Exception
  class << self

    # def initialize(mes)
    #   puts mes
    # end
    def handle_exception()
      $LOG.info "STEP NAME WHICH FAILED => " +"#{$step_title}"
      $LOG.error $sys_message


    end
  end
end