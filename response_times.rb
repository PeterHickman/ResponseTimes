#!/usr/bin/env ruby

# Parse Rails 3 production logs and produce min, average and maximum response
# times for the whole request, view portion and active record portion for
# each controller and action

class MiniumAverageMaximum
  attr_reader :min, :max, :sum, :count

  def initialize
    @min = nil
    @max = nil
    @count = 0
    @sum = nil
  end

  def add(value)
    if @count == 0
      @min = value
      @max = value
      @sum = value
    else
      @max = value if value > @max
      @min = value if value < @min
      @sum += value
    end

    @count += 1
  end

  def average
    @sum / @count
  end
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
    unless data.has_key?(controller_and_action)
      data[controller_and_action] = {:total => MiniumAverageMaximum.new, :view => MiniumAverageMaximum.new, :ar => MiniumAverageMaximum.new}
    end

    data[controller_and_action][:total].add($1.to_f)
    data[controller_and_action][:view].add($2.to_f)
    data[controller_and_action][:ar].add($3.to_f)
  end
end

data.keys.sort.each do |controller_and_action|
  values = data[controller_and_action]

  puts "%50s : Requests .: %8d" % [controller_and_action, values[:total].count]

  puts "%50s : Overall ..: %8.2f %8.2f %8.2f" % [ "", values[:total].min, values[:total].average, values[:total].max]
  puts "%50s : View .....: %8.2f %8.2f %8.2f" % [ "", values[:view].min,  values[:view].average,  values[:view].max]
  puts "%50s : AR .......: %8.2f %8.2f %8.2f" % [ "", values[:ar].min,    values[:ar].average,    values[:ar].max]
  puts
end
