module RaceStatus
  module WorkoutMetrics
    METERS_PER_MILE = 1609.34

    def workout_metrics(workout)
      metrics = {
        distance: (workout['aggregates']['distance_total'] / METERS_PER_MILE).round(2),
        speed: (workout['aggregates']['active_time_total'] / 60).round(2)
      }
      metrics[:pace] = (metrics[:speed] / metrics[:distance]).round(2)
      metrics
    end

    def sum_distances(workouts)
      all_distances = workouts.pluck(:distance)
      (all_distances.reduce(:+)).round(2)
    end

    def sum_times(workouts)
      all_times = workouts.pluck(:speed)
      (all_times.reduce(:+) + all_times.length * 0.15).round(2)
    end

  end
end
