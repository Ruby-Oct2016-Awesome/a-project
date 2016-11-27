module TripsHelper

	def distance_by_day
		line_chart distance_by_day_user_trips_path, library: {
			title: {text: 'Distance by Day', x: -20},
			yAxis: {
				crosshair: true,
				title: {
					text: 'Distance Traveled'
				}
			},
			xAxis: {
				crosshair: true,
				title: {
					text: 'Day'
				}
			}
		}
	end
end
