#!/usr/bin/env ruby

# Parse Rails 3 production logs and produce min, average and maximum response
# times for the whole request, view portion and active record portion for
# each controller and action

def mam(values)
  x = values.sort

  min = x.first
  max = x.last

  avg = x.inject(0.0){|a,b| a+b} / x.size

  return min,avg,max
end

controller_and_action = nil

data = Hash.new

ARGF.each do |line|
  # Started GET "/feed/stats/updates" for 31.222.181.55 at 2013-02-26 06:49:07 +0000
  #   Processing by FeedController#stats_updates as */*
  # Completed 200 OK in 6844ms (Views: 713.9ms | ActiveRecord: 1338.0ms)

  if line =~ /Processing by (\S+) /
    controller_and_action = $1
  elsif line =~ /Completed 200 OK in (\d+)ms \(Views: ([\d.]+)ms \| ActiveRecord: ([\d.]+)ms\)/
    if data.has_key?(controller_and_action)
      data[controller_and_action][:count] += 1.0
      data[controller_and_action][:total] << $1.to_f
      data[controller_and_action][:view] << $2.to_f
      data[controller_and_action][:ar] << $3.to_f
    else
      data[controller_and_action] = {:count => 1.0, :total => [$1.to_f], :view => [$2.to_f], :ar => [$34.to_f]}
    end
  end
end

data.keys.sort.each do |controller_and_action|
  values = data[controller_and_action]

  puts "%50s : Requests .: %8d" % [controller_and_action, values[:count]]

  puts "%50s : Overall ..: %8.2f %8.2f %8.2f" % [ "", *mam(values[:total])]
  puts "%50s : View .....: %8.2f %8.2f %8.2f" % [ "", *mam(values[:view])]
  puts "%50s : AR .......: %8.2f %8.2f %8.2f" % [ "", *mam(values[:ar])]
  puts
end
