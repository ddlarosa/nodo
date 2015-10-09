require 'active_record'
require '/home/nodo/nodepanel/app/models/node'
require '/home/nodo/nodepanel/app/models/node_result'

ActiveRecord::Base.establish_connection(
        :adapter  => "postgresql",
        :host     => "localhost",
        :port     => 5432,
        :database => "nodo",
        :username => "nodo",
        :password => ""
    )

