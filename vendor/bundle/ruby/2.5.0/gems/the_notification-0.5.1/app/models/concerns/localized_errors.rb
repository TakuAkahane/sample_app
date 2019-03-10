module TheNotification
  module LocalizedErrors
    extend ActiveSupport::Concern

    # include TheNotification::LocalizedErrors

    # @post.localized_errors(except: [:'comment.title'])
    def localized_errors opts = {}
      opts.symbolize_keys!
      excepts = opts.delete(:except) || []

      errors.inject({}) do |hash, (k, v)|
        unless excepts.include?(k.to_sym)
          k = self.class.human_attribute_name k
          hash[k].blank? ? hash[k] = [v] : hash[k].push(v)
        end
        hash
      end
    end
  end
end
