class CreateColorManageService

  def initialize
  end

  def color_manage_data_create(params)
    color_manage = ColorManage.new(params)

    color_manage
  end

end