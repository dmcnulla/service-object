require 'yml_reader'

module ServiceObject
  extend YmlReader
  
  def initialize(file_name)
  extend YmlReader
  # extend StandardTranslation
  # extend DateTranslation

  attr_reader :parent

  # I18n.enforce_available_locales = false if I18n.respond_to? :enforce_available_locales

  # def self.locale=(value)
  #   Faker::Config.locale = value
  # end
  
  # def self.included(cls)
  #   @parent = cls
  #   translators.each do |translator|
  #     Translation.send :include, translator
  #   end
  # end

  def data_for(key, additional={})
    if key.is_a?(String) && key.match(%r{/})
      filename, record = key.split('/')
      ServiceObject.load("#{filename}.yml")
    else
      record = key.to_s
      ServiceObject.load(the_file) unless ServiceObject.yml
    end
    data = ServiceObject.yml[record]
    raise ArgumentError, "Undefined key #{key}" unless data
    prep_data data.merge(additional).clone
  end

  private

  def the_file
    ENV['SERVICE_OBJECT_FILE'] ? ENV['SERVICE_OBJECT_FILE'] :  'default.yml'
  end

  def prep_service(service)
    service.each do |key, value|
      unless value.nil?
        next if !value.respond_to?('[]') || value.is_a?(Numeric)
        if value.is_a?(Hash)
          data[key] = prep_data(value)
        else  
          data[key] = translate(value[1..-1]) if value[0,1] == "~"
        end
      end
    end
    data
  end

  def translate(value)
    translation.send :process, value
  end

  def translation
    @translation ||= Translation.new parent
  end

  class << self
    attr_accessor :yml
  
    def default_directory
      'config/services'
    end

    def add_translator(translator)
      translators << translator
    end

    def translators
      @translators ||= []
    end
  end

end