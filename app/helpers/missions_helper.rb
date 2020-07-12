module MissionsHelper
  def current_user_missions(missions)
    missions.select {|mission| mission.user.id == current_user.id }
  end
end
