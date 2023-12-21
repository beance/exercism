# frozen_string_literal: true

class LocomotiveEngineer
  def self.generate_list_of_wagons(*args)
    args
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    one, two, three, *c = each_wagons_id
    [three, *missing_wagons, *c, one, two]
  end

  def self.add_missing_stops(routing, **stops)
    { **routing, stops: stops.values }
  end

  def self.extend_route_information(route, more_route_information)
    { **route, **more_route_information }
  end
end
