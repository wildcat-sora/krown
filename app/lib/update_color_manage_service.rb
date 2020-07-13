class UpdateColorManageService

  def initialize
  end

  def update_color_manage(params:)
    color_manage = ColorManage.find(params[:id])

    params.each do |key,value|
      if value != (color_manage[key.to_sym]).to_s
        color_manage.update_attributes(key.to_s => value)
      end
    end

  end

end