class PagesController < ApplicationController


  def save
    @attempt = Attempt.new
    @attempt.correct = params["attempt"]
    @attempt.user_id = current_user.id
    @attempt.character_id = params["id"]

    respond_to do |format|
      if @attempt.save
        format.js {render 'create'}
      else
        format.js {render 'error'}
      end
    end
  end

  def savepoints

    @chips = params["chipswon"].to_i

    if current_user.xp == nil
      z = current_user
      z.xp = 0
      z.save
    end

      z = current_user
      z.xp = z.xp + @chips
      z.save


    respond_to do |format|
      if @chips
        format.js {render 'create'}
      else
        format.js {render 'error'}
      end
    end
  end

def update_page

  @user_character = Attempt.where(:user_id => current_user.id).select(:character_id).distinct
  @character = Character.all
  @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

  @unique_id_array = []

  @unique_id_0 = Attempt.where(:character_id => 0)

  @user_character.each do |row|
    @unique_id_array.push(row.character_id)
  end

  if Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count == 0
    attempt = Attempt.new
    attempt.correct = false
    attempt.user_id = current_user.id
    attempt.character_id = Character.take(@characters_known + 1).last.id
    attempt.save
    @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

    attempt = Attempt.new
    attempt.correct = false
    attempt.user_id = current_user.id
    attempt.character_id = Character.take(@characters_known + 1).last.id
    attempt.save
    @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

    attempt = Attempt.new
    attempt.correct = false
    attempt.user_id = current_user.id
    attempt.character_id = Character.take(@characters_known + 1).last.id
    attempt.save
    @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

    attempt = Attempt.new
    attempt.correct = false
    attempt.user_id = current_user.id
    attempt.character_id = Character.take(@characters_known + 1).last.id
    attempt.save
    @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

    attempt = Attempt.new
    attempt.correct = false
    attempt.user_id = current_user.id
    attempt.character_id = Character.take(@characters_known + 1).last.id
    attempt.save
    @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count
  end

  @easy = []
  @hard = []
  @user_character = Attempt.where(:user_id => current_user.id).select(:character_id).distinct

  @user_character.each do |row|
    if Attempt.where(:character_id => row.character_id, :user_id => current_user).count > 10 &&
    (Attempt.where(:character_id => row.character_id, :user_id => current_user, :correct => true).count.to_f/Attempt.where(:character_id => row.character_id, :user_id => current_user).count.to_f) > 0.7
        @easy.push(row.character_id)
    else
        @hard.push(row.character_id)
    end
  end

  if @hard.length < 4
    attempt = Attempt.new
    attempt.correct = false
    attempt.user_id = current_user.id
    attempt.character_id = Character.take(@characters_known + 1).last.id
    attempt.save
    @hard.push(attempt.character_id)
    #@characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count
    #attempt = Attempt.new
    #attempt.correct = false
    #attempt.user_id = current_user.id
    #attempt.character_id = Character.take(@characters_known + 1).last.id
    #attempt.save
    #@hard.push(attempt.character_id)
  end

  #@hard = [2,3,6,7,8,9]
  @max_hard = 5;
  @total_questions = 5;
  @question_char_id = [];
  @rand = rand(@max_hard);

  @sampleArray = [0,1,2]

  if @hard.length <= @max_hard
    for i in 0..(@hard.length-1)
      @question_char_id.push(@hard[i])
    end
  else
    for i in 0..@max_hard
      @rand = rand(@hard.length)
      @question_char_id.push(@hard[@rand])
      @hard.slice!(@rand)
    end
  end

  if @easy.length > 0
    @rand = rand(@easy.length)
    @question_char_id.push(@easy[@rand])
  end

  #@sampleRuby = @question_char_id.count

  @game_input = []

  @game_input_character = []
  @game_input_phonetic = []
  @game_input_translation = []
  @game_input_char_id = []

  for i in 0..@question_char_id.count-1
    @game_input.push(Character.find_by(:id => @question_char_id[i]).character)
    @game_input.push(Character.find_by(:id => @question_char_id[i]).english_spelling)
    @game_input.push(Character.find_by(:id => @question_char_id[i]).translation)
    @game_input.push(@question_char_id[i])
  end

    for i in 0..@question_char_id.count-1
    @game_input_character.push(Character.find_by(:id => @question_char_id[i]).character)
    @game_input_phonetic.push(Character.find_by(:id => @question_char_id[i]).english_spelling)
    @game_input_translation.push(Character.find_by(:id => @question_char_id[i]).translation)
    @game_input_char_id.push(@question_char_id[i])
  end

  @sampleRuby = @game_input_character[0]

end

def op
end


  def dashboard
  end

def show


@user_character = Attempt.where(:user_id => current_user.id).select(:character_id).distinct
  @character = Character.all
  @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

  @unique_id_array = []

  @unique_id_0 = Attempt.where(:character_id => 0)

  @user_character.each do |row|
    @unique_id_array.push(row.character_id)
  end

  if Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count == 0
    attempt = Attempt.new
    attempt.correct = false
    attempt.user_id = current_user.id
    attempt.character_id = Character.take(@characters_known + 1).last.id
    attempt.save
    @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

    attempt = Attempt.new
    attempt.correct = false
    attempt.user_id = current_user.id
    attempt.character_id = Character.take(@characters_known + 1).last.id
    attempt.save
    @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

    attempt = Attempt.new
    attempt.correct = false
    attempt.user_id = current_user.id
    attempt.character_id = Character.take(@characters_known + 1).last.id
    attempt.save
    @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

    attempt = Attempt.new
    attempt.correct = false
    attempt.user_id = current_user.id
    attempt.character_id = Character.take(@characters_known + 1).last.id
    attempt.save
    @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

    attempt = Attempt.new
    attempt.correct = false
    attempt.user_id = current_user.id
    attempt.character_id = Character.take(@characters_known + 1).last.id
    attempt.save
    @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count
  end

  @easy = []
  @hard = []
  @user_character = Attempt.where(:user_id => current_user.id).select(:character_id).distinct

  @user_character.each do |row|
    if Attempt.where(:character_id => row.character_id, :user_id => current_user).count > 10 &&
    (Attempt.where(:character_id => row.character_id, :user_id => current_user, :correct => true).count.to_f/Attempt.where(:character_id => row.character_id, :user_id => current_user).count.to_f) > 0.7
        @easy.push(row.character_id)
    else
        @hard.push(row.character_id)
    end
  end

  if @hard.length < 4 && Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count < 6
    attempt = Attempt.new
    attempt.correct = false
    attempt.user_id = current_user.id
    attempt.character_id = Character.take(@characters_known + 1).last.id
    attempt.save
    @hard.push(attempt.character_id)
    #@characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count
    #attempt = Attempt.new
    #attempt.correct = false
    #attempt.user_id = current_user.id
    #attempt.character_id = Character.take(@characters_known + 1).last.id
    #attempt.save
    #@hard.push(attempt.character_id)
  end

  #@hard = [2,3,6,7,8,9]
  @max_hard = 5;
  @total_questions = 5;
  @question_char_id = [];
  @rand = rand(@max_hard);

  @sampleArray = [0,1,2]

  if @hard.length <= @max_hard
    for i in 0..(@hard.length-1)
      @question_char_id.push(@hard[i])
    end
  else
    for i in 0..@max_hard
      @rand = rand(@hard.length)
      @question_char_id.push(@hard[@rand])
      @hard.slice!(@rand)
    end
  end

  if @easy.length > 0
    @rand = rand(@easy.length)
    @question_char_id.push(@easy[@rand])
    @easy.slice!(@rand)
  end

  if @easy.length > 0
    @rand = rand(@easy.length)
    @question_char_id.push(@easy[@rand])
    @easy.slice!(@rand)
  end

  if @easy.length > 0
    @rand = rand(@easy.length)
    @question_char_id.push(@easy[@rand])
    @easy.slice!(@rand)
  end

  if @easy.length > 0
    @rand = rand(@easy.length)
    @question_char_id.push(@easy[@rand])
    @easy.slice!(@rand)
  end

  if @easy.length > 0
    @rand = rand(@easy.length)
    @question_char_id.push(@easy[@rand])
    @easy.slice!(@rand)
  end


  #@sampleRuby = @question_char_id.count

  @game_input = []

  @game_input_character = []
  @game_input_phonetic = []
  @game_input_translation = []
  @game_input_char_id = []

  for i in 0..@question_char_id.count-1
    @game_input.push(Character.find_by(:id => @question_char_id[i]).character)
    @game_input.push(Character.find_by(:id => @question_char_id[i]).english_spelling)
    @game_input.push(Character.find_by(:id => @question_char_id[i]).translation)
    @game_input.push(@question_char_id[i])
  end

    for i in 0..@question_char_id.count-1
    @game_input_character.push(Character.find_by(:id => @question_char_id[i]).character)
    @game_input_phonetic.push(Character.find_by(:id => @question_char_id[i]).english_spelling)
    @game_input_translation.push(Character.find_by(:id => @question_char_id[i]).translation)
    @game_input_char_id.push(@question_char_id[i])
  end

  @sampleRuby = @game_input_character[0]

end



=begin
def show
@user_character = Attempt.where(:user_id => current_user.id).select(:character_id).distinct
    @character = Character.all
    @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

    @unique_id_array = []

    @unique_id_0 = Attempt.where(:character_id => 0)

    @user_character.each do |row|
      @unique_id_array.push(row.character_id)
    end

    if Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count == 0
      attempt = Attempt.new
      attempt.correct = false
      attempt.user_id = current_user.id
      attempt.character_id = Character.take(@characters_known + 1).last.id
      attempt.save
          @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

            attempt = Attempt.new
      attempt.correct = false
      attempt.user_id = current_user.id
      attempt.character_id = Character.take(@characters_known + 1).last.id
      attempt.save
          @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

            attempt = Attempt.new
      attempt.correct = false
      attempt.user_id = current_user.id
      attempt.character_id = Character.take(@characters_known + 1).last.id
      attempt.save
          @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count

            attempt = Attempt.new
      attempt.correct = false
      attempt.user_id = current_user.id
      attempt.character_id = Character.take(@characters_known + 1).last.id
      attempt.save
          @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count
                      attempt = Attempt.new
      attempt.correct = false
      attempt.user_id = current_user.id
      attempt.character_id = Character.take(@characters_known + 1).last.id
      attempt.save
          @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count


    end



    # while @characters_known < 5 do
    #   attempt = Attempt.new
    #   attempt.correct = false
    #   attempt.user_id = current_user.id
    #   attempt.character_id = Character.take(@characters_known + 1).last.id
    #   attempt.save
    #   @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count
    # end

    @easy = []
    @hard = []
    @user_character = Attempt.where(:user_id => current_user.id).select(:character_id).distinct
    @user_character.each do |row|
      if Attempt.where(:character_id => row.character_id, :user_id => current_user).count > 10 && (Attempt.where(:character_id => row.character_id, :user_id => current_user, :correct => true).count.to_f/Attempt.where(:character_id => row.character_id, :user_id => current_user).count.to_f) > 0.7
        @easy.push(row.character_id)
      else
        @hard.push(row.character_id)
      end
    end

    if @hard.length < 4
      attempt = Attempt.new
      attempt.correct = false
      attempt.user_id = current_user.id
      attempt.character_id = Character.take(@characters_known + 1).last.id
      attempt.save
      @hard.push(attempt.character_id)
      @characters_known = Attempt.where(:user_id => current_user.id).select(:character_id).distinct.count
      attempt = Attempt.new
      attempt.correct = false
      attempt.user_id = current_user.id
      attempt.character_id = Character.take(@characters_known + 1).last.id
      attempt.save
      @hard.push(attempt.character_id)
    end

#@hard = [2,3,6,7,8,9]
@max_hard = 5;
@total_questions = 5;
@question_char_id = [];
@rand = rand(@max_hard);

@sampleArray = [0,1,2]

if @hard.length <= @max_hard
  for i in 0..(@hard.length-1)
    @question_char_id.push(@hard[i])
  end
else
  for i in 0..@max_hard
    @rand = rand(@hard.length)
    @question_char_id.push(@hard[@rand])
    @hard.slice!(@rand)
  end
end

if @easy.length > 0
  @rand = rand(@easy.length)
  @question_char_id.push(@easy[@rand])
end

@sampleRuby = current_user.id

@game_input = []

for i in 0..@question_char_id.count-1
  @game_input.push(Character.find_by(:id => @question_char_id[i]).character)
  @game_input.push(Character.find_by(:id => @question_char_id[i]).english_spelling)
  @game_input.push(Character.find_by(:id => @question_char_id[i]).translation)
  @game_input.push(@question_char_id[i])
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

=end
end
