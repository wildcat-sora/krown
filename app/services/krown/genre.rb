module Genre

  def params_genre
    params.require(:genre).permit(
        :user_id,
        :in_genre,
        :created_at,
        :updated_at
    )
  end

end