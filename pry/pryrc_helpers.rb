class Array
  def ___require_gems
    missing = []
    self.each do |e|
      begin
        require e
      rescue LoadError => err
        missing << e
      end
    end
    if !missing.empty?
      puts 'Missing ' + missing.join(' ') + ' goodies :('
    end
  end

  def self.toy(n = 10, &block)
    block_given? ? Array.new(n, &block) : Array.new(n) { |i| i+1 }
  end
end

class Hash
  def self.toy(n = 10)
    Hash[Array.toy(n).zip(Array.toy(n){ |c| (96+(c+1)).chr })]
  end
end

class Object
  def o_methods
    (self.methods - Object.instance_methods).sort
  end

  def safe_require(gem, msg)
    begin
      require gem
    rescue LoadError
      puts 'No ' + "#{gem}" ' available.'
      puts msg
    end
  end
end

## YAML#to_yaml abstraction.
# y("language: ruby\nrvm:\n  - 2.0.0\n  - 1.9.3\nscript: rake test\n")
def y(obj)
  obj.to_yaml
end

def json_parse(obj)
  JSON.parse(obj)
end

### Benchmark

## Benchmark.measure abstraction.
# puts bm { "a"*1_000_000_000 }
def bm(&block)
  Benchmark.measure &block
end
