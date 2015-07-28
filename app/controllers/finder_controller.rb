class FinderController < ApplicationController
	before_action(:authenticate_user!)
	def search
		@ip = request.remote_ip
		p @ip.inspect
		@location = Geokit::Geocoders::MultiGeocoder.geocode('131.94.186.13')
	end
end
