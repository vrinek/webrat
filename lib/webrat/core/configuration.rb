module Webrat
  
  # Configures Webrat. If this is not done, Webrat will be created
  # with all of the default settings. 
  def self.configure(configuration = Webrat::Configuration.new)
    yield configuration if block_given?
    @@configuration = configuration
  end
      
  def self.configuration
    @@configuration ||= Webrat::Configuration.new
  end
  
  class Configuration
    attr_accessor :parse_with_nokogiri
    
    attr_accessor :mode
    
    # Sets whether to save and open pages with error status codes in a browser
    attr_accessor :open_error_files
    
    def initialize
      self.open_error_files = true
      self.parse_with_nokogiri = !Webrat.on_java?
    end
    
  end
  
end