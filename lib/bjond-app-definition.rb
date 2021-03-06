require 'securerandom'

module BjondApi
  class BjondAppDefinition
    attr_accessor :id, :author, :name, :description, :rootEndpoint, :configURL, :iconURL, :rootEndpoint, :integrationEvent, :integrationConsequence

    def initialize()
      self.id = SecureRandom.uuid
      self.configURL    = "#{self.get_hostname}/bjond-app/services"
      self.rootEndpoint = "#{self.get_hostname}/bjond-app/services"
      self.integrationEvent = []
      self.integrationConsequence = []
    end

    def get_hostname()
      Rails.application.config.action_controller.default_url_options ? Rails.application.config.action_controller.default_url_options[:root_url] : nil || `hostname`
    end
  end
end