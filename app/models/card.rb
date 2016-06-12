class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :quote
  has_many :card_responses
  has_many :users, through: :card_responses

  validates_presence_of :card_type
  validates_presence_of :difficulty

  after_initialize :set_status, if: :new_record?
  def set_status
    self.status ||= :needs_review
  end

  enum card_type: { flashcard:     0,
                    organize:      1,
                    fill_in_blank: 2 }

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

  scope :unanswered, -> (user_id, deck_id) {
    joins("left outer join (select * from card_responses where user_id = #{user_id}) r on cards.id = r.card_id and cards.deck_id = r.deck_id").
      where("cards.deck_id = #{deck_id}").where "r.id is null"
  }

  scope :due, -> (user_id, deck_id) {
    joins("left join (select * from card_responses where user_id = #{user_id}) r on cards.id = r.card_id and cards.deck_id = r.deck_id").
      where("cards.deck_id = #{deck_id}").
      where "r.id is null or r.card_due_value < '#{Time.now}'"
  }

  answered_join   = 'card_responses on cards.id = card_responses.card_id and cards.deck_id = card_responses.deck_id'

  scope :answered, -> (user_id, deck_id) {
    joins("join #{answered_join}").where("card_responses.user_id = #{user_id}").
      where("card_responses.deck_id = #{deck_id}").uniq
  }

  scope :answered_and_due, -> (user_id, deck_id) {
    joins("join #{answered_join}").where("card_responses.user_id = #{user_id}").
      where("card_responses.deck_id = #{deck_id}").
      where("card_responses.card_due_value < '#{Time.now}'").uniq
  }

  # .not_due.count errs, use .not_due.length
  scope :not_due, -> (user_id, deck_id) {
    select('distinct on (card_responses.card_id) *').joins("join #{answered_join}").
      where("card_responses.user_id = #{user_id}").
      where("card_responses.deck_id = #{deck_id}").
      where("card_responses.card_due_value > '#{Time.now}'").
      order('card_responses.card_id, card_responses.created_at desc')
  }

  def answers
    answers = strip_char(content.scan(/\*[a-zA-Z0-9\s]+\*/)) if fill_in_blank?
  end

  def random_blank
    answer = answers[rand 0...answers.count]
    prompt = strip_char(content.split "*#{answer}*")
    group = {
      id: id,
      pre_answer: prompt[0],
      post_answer: prompt[1],
      answer: answer
    }
  end

  def strip_char array, char = '*'
    array.each_with_index do |string, index|
      array[index] = array[index].gsub char, ''
    end
  end

end
