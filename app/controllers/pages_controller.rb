class PagesController < ApplicationController
  def dashboard

    @sampleRuby = 5
    i = 1
    if Attempt.where(user_id = current_user.id).count < 5
      while i < 5 do
        attempt = Attempt.new
        attempt.correct = false
        attempt.user_id = current_user.id
        attempt.character_id = i
        i = i + 1
        attempt.save
     end
    end

    @q1 = Attempt.find_by(1).character.character

    @characterArray = []
    @englishSpellingArray = []
    @translationArray = []

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

  end
end
