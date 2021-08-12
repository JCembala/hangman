# frozen_string_literal: true

# Printing graphics representation of hangman
class Graphics
  def self.print_hangman(current_turn)
    case current_turn
    when 0
      hangman =
        "             \n"\
        "             \n"\
        "             \n"\
        "             \n"\
        "             \n"\
        "             \n"\
        "_____________\n"

    when 1
      hangman =
        "             \n"\
        "             \n"\
        "             \n"\
        "             \n"\
        "|            \n"\
        "|            \n"\
        "|____________\n"

    when 2
      hangman =
        "             \n"\
        "|            \n"\
        "|            \n"\
        "|            \n"\
        "|            \n"\
        "|            \n"\
        "|____________\n"

    when 3
      hangman =
        "------       \n"\
        "|            \n"\
        "|            \n"\
        "|            \n"\
        "|            \n"\
        "|            \n"\
        "|____________\n"

    when 4
      hangman =
        "-----------  \n"\
        "|            \n"\
        "|            \n"\
        "|            \n"\
        "|            \n"\
        "|            \n"\
        "|____________\n"

    when 5
      hangman =
        "-----------  \n"\
        "|         |  \n"\
        "|            \n"\
        "|            \n"\
        "|            \n"\
        "|            \n"\
        "|____________\n"

    when 6
      hangman =
        "-----------  \n"\
        "|         |  \n"\
        "|         O  \n"\
        "|            \n"\
        "|            \n"\
        "|            \n"\
        "|____________\n"

    when 7
      hangman =
        "-----------  \n"\
        "|         |  \n"\
        "|         O  \n"\
        "|         |  \n"\
        "|            \n"\
        "|            \n"\
        "|____________\n"

    when 8
      hangman =
        "-----------  \n"\
        "|         |  \n"\
        "|         O  \n"\
        "|       --|  \n"\
        "|            \n"\
        "|            \n"\
        "|____________\n"

    when 9
      hangman =
        "-----------  \n"\
        "|         |  \n"\
        "|         O  \n"\
        "|       --|--\n"\
        "|            \n"\
        "|            \n"\
        "|____________\n"

    when 10
      hangman =
        "-----------  \n"\
        "|         |  \n"\
        "|         O  \n"\
        "|       --|--\n"\
        "|         |  \n"\
        "|            \n"\
        "|____________\n"

    when 11
      hangman =
        "-----------  \n"\
        "|         |  \n"\
        "|         O  \n"\
        "|       --|--\n"\
        "|         |  \n"\
        "|        /   \n"\
        "|____________\n"

    when 12
      hangman =
        "-----------  \n"\
        "|         |  \n"\
        "|         O  \n"\
        "|       --|--\n"\
        "|         |  \n"\
        "|        / \\ \n"\
        "|____________\n"

    end
    hangman
  end
end
