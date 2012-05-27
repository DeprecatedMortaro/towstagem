def sync_with_towsta params={}
  Towsta::Synchronizer.new(params: params, request: :all).status
end
