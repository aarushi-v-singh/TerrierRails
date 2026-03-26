require 'csv'

namespace :db do
  desc "Import data from CSV files"
  task import_csv: :environment do
    tech_file = Rails.root / 'db' / 'csvs' / 'technicians.csv'
    loc_file = Rails.root / 'db' / 'csvs' / 'locations.csv'
    wo_file = Rails.root / 'db' / 'csvs' / 'work_orders.csv'
    
    CSV.foreach(tech_file, headers: true) do |row|
      Technician.find_or_create_by!(id: row['id']) do |tech|
        tech.name = row['name']
      end
    end

    CSV.foreach(loc_file, headers: true) do |row|
      Location.find_or_create_by!(id: row['id']) do |loc|
        loc.name = row['name']
        loc.city = row['city']
      end
    end

    CSV.foreach(wo_file, headers: true) do |row|
      WorkOrder.find_or_create_by!(id: row['id']) do |wo|
        wo.technician_id = row['technician_id']
        wo.location_id = row['location_id']
        wo.time = DateTime.strptime(row['time'], '%m/%d/%y %H:%M')
        wo.duration = row['duration'].to_i
        wo.price = row['price'].to_i
      end
    end
  end
end
