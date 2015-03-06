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
      metrics(get_force(opts))['clusterMetrics']
    end

    def fairscheduler_active_apps(opts = {})
      targets = scheduler(get_force(opts))['scheduler']['schedulerInfo']['rootQueue']['childQueues']
      return targets nil if targets.nil?

      each_apps = {}
      targets.each { |target|
        name = target['queueName'].gsub(/root./, '')
        each_apps[name] ||= 0
        each_apps[name] += target['numActiveApps']
      }
      each_apps
    end
  end
end
