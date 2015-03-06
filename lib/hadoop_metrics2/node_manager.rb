require "hadoop_metrics2/api"

module HadoopMetrics2
  class NodeManager
    include API

    NODE_TYPE = 'nm'

    def info
      query_jmx('Hadoop:service=NodeManager,name=NodeManagerMetrics').first
    end

    def application(opts = {})
      metrics(get_force(opts))['nodeInfo']
    end
  end
end
