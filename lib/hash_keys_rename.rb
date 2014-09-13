require "hash_keys_rename/version"

module HashKeysRename; end

class Hash
  def deep_rename(with)
    self.inject({}) do |acc, pair|
      k, v = pair
      replacement = with.fetch(k){k}
      if replacement.is_a? Hash
        if replacement.keys.length == 1 && replacement.values.first.is_a?(Hash)
          hsh = Hash[replacement.keys.first, v.deep_rename(replacement.values.first)]
        else
          hsh = Hash[k, v.deep_rename(replacement)]
        end
      else
        hsh = Hash[replacement, v]
      end
      acc.merge! hsh
    end
  end
end

class Array
  def deep_rename(with)
    self.map{|el| el.respond_to?(:deep_rename) ? el.deep_rename(with) : el  }
  end
end