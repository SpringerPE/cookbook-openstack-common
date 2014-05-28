module ::Openstack

   def set_from_hash(dst, hash)
       hash.each do |key, value|
           if not value.is_a?(Hash)
               dst[key] = value
           else
               set_from_hash(dst[key], value)
           end
       end
   end

end

