module TrainPlugins
  module TrainKubernetes
    class KubectlClient
      attr_reader :pod, :container
      def initialize(pod:, container: nil)
        @pod = pod
        @container = container
      end

      def execute(command, stdin: true, tty: true)
        instruction = ["kubectl exec"].tap do |arr|
          arr << '--stdin' if stdin
          arr << "--tty" if tty
          arr << pod if pod
          arr << command
        end.join("\s")
        system(instruction)
      end
    end
  end
end