# HashKeysRename

Gem append ability to rename keys in an instance of Hash. It's also possible to rename hash keys in case when hash is
an element of Array. Gem can be useful in json preprocessing.  

## Installation

Add this line to your application's Gemfile:

    gem 'hash_keys_rename'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_keys_rename

## Usage

Require it:

```ruby
require 'hash_keys_rename'
```

**Hash Example:**  
  
```ruby   
source = {old_key_a: 1, old_key_b: {old_key_c: 3, no_rename: 4}}    
replace_keys = {:old_key_a => :new_key_a, :old_key_b => {:new_key_b => {:old_key_c => :new_key_c}}}     
source.deep_rename replace_keys     
{:new_key_a=>1, :new_key_b=>{:new_key_c=>3, :no_rename=>4}}
```      
**Array Example:**
  
```ruby   
source = [{old_key_a: 1, old_key_b: 2}, 2]  
replace_keys = {:old_key_a => :new_key_a, :old_key_b => :new_key_b}   
source.deep_rename replace_keys   
[{new_key_a: 1, new_key_b: 2}, 2]
```  
  
           
## Contributing

1. Fork it ( https://github.com/olsv/hash_keys_rename/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
