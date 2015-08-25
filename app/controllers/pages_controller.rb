class PagesController < ApplicationController

  def save
    @attempt = Attempt.new
    @attempt.correct = params["attempt"]
    @attempt.user_id = current_user.id
    @attempt.character_id = params["id"]
    @attempt.save
  end

  def dashboard
    @unique_id = Attempt.where(:user_id => current_user.id).select(:character_id).distinct
    @character = Character.all
    @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

    @sampleRuby = current_user.id

    while @characters_known < 5 do
      attempt = Attempt.new
      attempt.correct = false
      attempt.user_id = current_user.id
      attempt.character_id = Character.take(@characters_known + 1).last.id
      attempt.save
      @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count
    end


    # if@characters_known < 5
    #   @sampleRuby = "too few"
    #   attempt = Attempt.new
    #   attempt.correct = false
    #   attempt.user_id = current_user.id
    #   attempt.character_id = Character.take(@characters_known + 1).last.id
    #   attempt.save
    #end

    # while @characters_known < 5 do
    #   attempt = Attempt.new
    #   attempt.correct = false
    #   attempt.user_id = current_user.id
    #   attempt.character_id = Character.take(@characters_known + 1).last.id


    # i = 1
    # if Attempt.where(user_id = current_user.id).count < 5
    #   while i < 5 do
    #     attempt = Attempt.new
    #     attempt.correct = false
    #     attempt.user_id = current_user.id
    #     attempt.character_id = i
    #     i = i + 1
    #     attempt.save
    #  end
    # end



    @q1 = Attempt.find_by(1).character.character

    @characterArray = []
    @englishSpellingArray = []
    @translationArray = []
    @character_idArray = []

    @attempts = Attempt.where(:user_id => current_user.id).select(:character_id).distinct

    @counter = 0

    @attempts.each do |row|
      if Attempt.where(:character_id => row.character_id, :user_id => current_user.id).count > 10
        @counter = @counter + 1
      end
    end

    # @attempts.each do |attempt|
    #   if attempt.correct.count >10
    #     @counter = @counter + 1
    #   end
    # end

    @attempts.each do |attempt|
      @characterArray.push(attempt.character.character)
    end

    @attempts.each do |attempt|
      @englishSpellingArray.push(attempt.character.english_spelling)
    end

    @attempts.each do |attempt|
      @translationArray.push(attempt.character.translation)
    end

    @attempts.each do |attempt|
      @character_idArray.push(attempt.character.id)
    end

  end
end
