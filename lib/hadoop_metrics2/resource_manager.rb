require "hadoop_metrics2/api"

module HadoopMetrics2
  class ResourceManager
    include API

    NODE_TYPE = 'rm'
    JSON_FILED_VALUES = %W(LiveNodeManagers)

    def info
      query_jmx('Hadoop:service=ResourceManager,name=RMNMInfo', JSON_FILED_VALUES).first
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
