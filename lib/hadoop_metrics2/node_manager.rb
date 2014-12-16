require "hadoop_metrics2/api"

module HadoopMetrics2
  class NodeManager
    include API

    NODE_TYPE = 'nm'

    def info
      query_jmx('Hadoop:service=NodeManager,name=NodeManagerMetrics').first
    end

    def application(opts = {})
      column = get_column(opts)
      column = HadoopMetrics2.to_snake_case(column) if @snake_case
      metrics(get_force(opts))
    end

    private

    def get_column(opts)
      opts[:column]
    end
  end
end
