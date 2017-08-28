# array2hash
Efficient conversion of a Ruby Array to a lookup table-like Hash written in Rubex.

This Ruby gem is a C extension written in [Rubex]() that can convert a Ruby Array to a Hash lookup table. Basically the following Array:
``` ruby
["1", 2, :three, "4"]
```
...will be converted into a Hash that looks like this:
``` ruby
{
  "1" => 0,
   2 => 1,
   :three => 2,
   "4" => 3
}
```

The reason for making this gem is mainly speed. The conventional way of the above conversion would be as follows:
``` ruby
a = ["1", 2, :three, "4"]
a.each_with_index.to_h 
```

This extension makes the above process upto 50% faster with a C extension. Here is the benchmarking code:
``` ruby
require 'benchmark/ips'
a = (1..1000).to_a.map(&:to_s)
Benchmark.ips do |x|
  x.report("convert") do
    Array2Hash.convert a
  end

  x.report("each_with_index.to_h") do
    a.each_with_index.to_h
  end

  x.compare!
end
```

The results are as follows:
```
Warming up --------------------------------------
             convert   368.000  i/100ms
each_with_index.to_h   236.000  i/100ms
Calculating -------------------------------------
             convert      3.488k (± 9.8%) i/s -     17.296k in   5.012260s
each_with_index.to_h      2.192k (± 8.3%) i/s -     11.092k in   5.097432s

Comparison:
             convert:     3487.8 i/s
each_with_index.to_h:     2192.3 i/s - 1.59x  slower
```

# Usage

Install with `gem install array2hash`.

The use with the `convert` class method:
``` ruby
require 'array2hash'

a = (1..1000).to_a.map(:&to_s)
Array2Hash.convert a
```