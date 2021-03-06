require "active_record"
require "date"

class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true
  belongs_to :user
  def self.overdue
    where("due_date < ? AND completed = false", Date.today)
  end

  def self.due_today
    where("due_date =?", Date.today)
  end

  def self.due_later
    where("due_date >?", Date.today)
  end
  def self.completed
    all.where(completed: true)
  end

  def is_due_today?
    due_date == Date.today
  end

  def is_completed?
    Todo.where(completed == true)
  end

  def self.mark_as_complete(todo_id)
    Todo.update(todo_id, :completed => true)
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end
end
