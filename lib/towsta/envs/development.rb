def sync_with_towsta params={}
  sync = Towsta::Synchronizer.new params: params, request: :all
  (Dir["./controllers/*.rb"] + Dir["./models/*.rb"]).each {|file| load file}
  sync.status
end
