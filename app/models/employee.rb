class Employee < ApplicationRecord
    attribute :completed, :boolean
  
    validates :name, presence: true
    validates :lastname, presence: true
    validates :hiredate, presence: true
    validates :salary, numericality: { greater_than: 0 }
    
  end
