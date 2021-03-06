require "neoid/version"
require "neoid/model_config"
require "neoid/model_additions"
require "neoid/node"
require "neoid/relationship"

module Neoid
  class << self
    attr_accessor :db
    attr_accessor :logger
    attr_accessor :ref_node
    
    def db
      raise "Must set Neoid.db with a Neography::Rest instance" unless @db
      @db
    end
    
    def logger
      @logger ||= Logger.new(ENV['NEOID_LOG'] ? $stdout : '/dev/null')
    end
    
    def ref_node
      @ref_node ||= Neography::Node.load(Neoid.db.get_root['self'])
    end
  end
end
