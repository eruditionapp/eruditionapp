class CurrentDifficulty < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  DIFFICULTY_LEVELS = {
    'Superficial details about title, author, context'                                            => 1,
    'Superficial details about book content (character names, basic chapter titles/themes, etc.)' => 2,
    'Chapter-level factual detail'                                                                => 3,
    'Short section/paragraph-level factual detail'                                                => 4,
    'Chapter-level critical engagement questions'                                                 => 5,
    'Short section/paragraph-level critical engagement questions'                                 => 6,
    'Questions on alternative interpretations'                                                    => 7,
    'Easier questions based on/about secondary commentary'                                        => 8,
    'Medium questions based on/about secondary commentary'                                        => 9,
    'Hard/Esoteric questions based on/about secondary commentary'                                 => 10
  }

end
