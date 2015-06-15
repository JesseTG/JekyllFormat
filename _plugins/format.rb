module Jekyll
  module Format
    def format(input, *args)
      input.taint
      args.taint
      
      args.each_index {|i| args[i] = (Hash[args[i].map {|k,v| [k.to_sym, v]}]) if args[i].instance_of?(Hash) }

      begin
        return Kernel::format(input, *args)
      rescue => exception
        return Kernel::format "%s: %s", exception.class, exception
      end
    end

    def sprintf(input, *args)
      format(input, *args)
    end
  end
end

Liquid::Template.register_filter(Jekyll::Format)
