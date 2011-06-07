load '/etc/irbrc'

begin
  # load wirble
  require 'wirble'

  # start wirble (with color)
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

require 'irb/completion'

#$:.unshift('.')
#require 'save-history'
#$:.shift
#http://redmine.ruby-lang.org/issues/show/1556
#http://metaskills.net/2010/02/06/simple-script-console-function/
require 'irb/ext/save-history'



IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb.hist"
IRB.conf[:PROMPT_MODE] = :SIMPLE

#Kernel.at_exit do
#  IRB::HistorySavingAbility.create_finalizer.call(IRB.CurrentContext.instance_variable_get(:@io).send(:binding))
#end
