module ApplicationHelper

  def display_hashtags(race)
    race.hash_tags.map { |tag| '#' + tag.tag }.join(' ')
  end
end
