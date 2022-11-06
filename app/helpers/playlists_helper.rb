module PlaylistsHelper
  def random_color
    color = "#{rand(1...255)} #{rand(1...255)} #{rand(1...255)}"
  end
end
