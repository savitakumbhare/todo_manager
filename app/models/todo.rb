require "active_record"
require "date"

class Todo < ActiveRecord::Base
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
end
