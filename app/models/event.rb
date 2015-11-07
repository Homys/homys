class Event < ActiveRecord::Base

	belongs_to :owner, class_name: "User"
	belongs_to :house

	def to_ics
  event = Icalendar::Event.new
  event.start = self.date
  event.end = self.end_date
  event.summary = self.title
  event.description = self.summary
  event.created = self.created_at
  event.last_modified = self.updated_at
  event.uid = event.url = "#{PUBLIC_URL}events/#{self.id}"
  event
end
end
