$LOAD_PATH.unshift(File.dirname(__FILE__))

def pry(obj)
  require 'pry'
  obj.pry
end

class PryIntoWarbler
  PUBLIC_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..', 'public'))

  def rebase(path)
    File.join(PUBLIC_DIR, path)
  end

  def run
    pry(binding)
  end
end

PryIntoWarbler.new.run

