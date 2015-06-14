module Jekyll
  module Format
    def format(input, *args)
      input.taint
      args.taint
      
      begin
        Kernel::format(input, *args)
      rescue => exception
        Kernel::format "%s: %s", exception.class, exception
      end
    end

    def sprintf(input, *args)
      format(input, *args)
    end
  end
end

Liquid::Template.register_filter(Jekyll::Format)