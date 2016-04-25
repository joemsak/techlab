$stdout.write("Syncing channels from AudioAddict...\n")

sync = SynchronizeChannels.new

sync.call do |channel|
  $stdout.write("Created #{channel.name}\n")
end
