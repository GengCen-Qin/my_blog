class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  include Pagy::Backend
  Pagy::DEFAULT[:items] = Settings.default.page_size # items per page
  Pagy::DEFAULT[:size] = [1, 4, 4, 1] # nav bar links

  def upload_file
    file = params[:file]
    if file.nil?
      render json: { code: -200, message: '参数不为空' }
    else
      # 获取保存文件的目录路径
      upload_dir = Rails.root.join('public', 'uploads')

      # 创建上传目录（如果不存在）
      FileUtils.mkdir_p(upload_dir)

      # 使用FileUtils类的cp方法将上传的文件保存到指定位置
      FileUtils.cp(file.tempfile.path, upload_dir.join(file.original_filename))

      render json: { code: 200, message: "上传成功", address: "/uploads/#{file.original_filename}" }
    end
  end
end
