module ApplicationHelper
	def svg(name)
		file_path = "airbike/app/assets/images/#{name}.svg"
		return File.read(file_path).html_safe if File.exists?(file_path)
		'(not found)'
	end
end
