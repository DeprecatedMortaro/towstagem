require "./towsta.rb"

def sync_with_towsta params={}
  Towsta::Synchronizer.new(params: params, request: :all).status
  (Dir["./controllers/*.rb"] + Dir["./models/*.rb"]).each {|file| load file}
  sync.status
end
