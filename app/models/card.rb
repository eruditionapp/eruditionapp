class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :quote

  validates_presence_of :card_type
  validates_presence_of :difficulty

  after_initialize :set_status, if: :new_record?

  enum card_type: { flashcard:     0,
                    short_answer:  1,
                    organize:      2,
                    fill_in_blank: 3 }

  enum status: { needs_review: 0,
                 unpublished:  1,
                 published:    2 }

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

  def set_status
    self.status ||= :needs_review
  end

end
