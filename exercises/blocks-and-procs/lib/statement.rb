require 'json'

class Statement

  def initialise
    @current_bill

  end

  def generate 

    Statement.new do
      date Date.today
      due(date + 30.days)
      from Date.parse('2015-01-26')
      to Date.parse('2015-02-25')

      call_charges do
        call '07716393769' do
          date Date.parse('2015-02-01')
          duration "00:23:03"
          cost 1.13
        end
      end
    end

  end

  

  def to_json
    # generate |statement| do
    #   statement.to_json
    # end
  end

end