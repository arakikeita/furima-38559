class Address < ApplicationRecord
    belongs_to :buy
  
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :area
  
  


    
   
    
end
