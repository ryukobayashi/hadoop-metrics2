require "hadoop_metrics2/api"

module HadoopMetrics2
  class NodeManager
    include API

    NODE_TYPE = 'nm'
    JSON_FILED_VALUES = %W(ContainersLaunched ContainersCompleted ContainersFailed ContainersKilled ContainersIniting ContainersRunning AllocatedGB AllocatedContainers AvailableGB)

    def info
      query_jmx('service=NodeManager,name=NodeManagerMetrics', JSON_FILED_VALUES).first
    end

    def application(opts = {})
      column = get_column(opts)
      column = HadoopMetrics2.to_snake_case(column) if @snake_case
      group_by('nodeInfo', column, get_force(opts))
    end

    private

    def get_column(opts)
      opts[:column]
    end
  end
end
