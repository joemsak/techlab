$stdout.write("Syncing channels from AudioAddict...\n")

sync = Channels::Sync.new

sync.call do |channel|
  $stdout.write("Created #{channel.name}\n")
end
