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
    if@characters_known < 3
      @sampleRuby = "too few"
    end
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

    @attempts = Attempt.all

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
