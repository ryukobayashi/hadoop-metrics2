# hadoop-metrics2

hadoop-metrics2 is a wrapper for Hadoop Metrics2 API.

## Installation

### gem

```
gem install hadoop-metrics2
```

## Usage

### ResourceManager

```
require 'hadoop_metrics2/resource_manager'

rm = HadoopMetrics2::ResourceManager.new('localhost', 8088, true)
puts JSON.pretty_generate(rm.application)
```

### NodeManager

```
require 'hadoop_metrics2/node_manager'

nm = HadoopMetrics::NodeManager.new('localhost', 8042, false)
puts JSON.pretty_generate(nm.application)
```

### NameNode

```
require 'hadoop_metrics2/name_node'

nn = HadoopMetrics2::NameNode.new('localhost', 50070, true)
puts JSON.pretty_generate(nn.dfs)
```

### DataNode

```
require 'hadoop_metrics2/data_node'

dn = HadoopMetrics2::DataNode.new('localhost', 50075, false)
puts JSON.pretty_generate(dn.info)
```

## Copyright

<table>
  <tr>
    <td>Author</td><td>Ryu Kobayashi <beter.max@gmail.com></td>
  </tr>
  <tr>
    <td>Original Author</td><td>Masahiro Nakagawa <repeatedly@gmail.com></td>
  </tr>
  <tr>
    <td>Original Repository</td><td>https://github.com/repeatedly/hadoop-metrics</td>
  </tr>
  <tr>
    <td>Copyright</td><td>Copyright (c) 2014- Ryu Kobayashi</td>
  </tr>
  <tr>
    <td>License</td><td>Apache2 License</td>
  </tr>
</table>
