# encoding: UTF-8
require 'parser'
namespace :parser do
  task :new_vorlagen=> :environment do
    Parser::Vorlagen.new.new_vorlagen

  end

end
