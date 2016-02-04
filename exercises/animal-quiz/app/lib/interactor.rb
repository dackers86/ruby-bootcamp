module Quiz
  class Interactor

    def ask?(question)
      puts question
      yn_prompt
    end

    def yn_prompt
      value = String.new
      begin
        value = gets.chomp.to_s
      end until (validate_yn(value))
      value.to_s == "y"
    end

    def validate_yn(value)
      ["y","n"].include? value
    end

    def output_message(message)
      puts message
    end

    def ask(question)
      output_message(question)
      gets
    end
  end
end