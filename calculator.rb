class Calculator

  $intUserNumber = 0
  $intUserNumber2 = 0
  $intRunningTotal = 0
  $strUserOperation = ""
  $strFormula = ""
  $bMainOk = false

  # MAIN METHOD
  def self.main
    wholeOperation
    while !$bMainOk
      getNextStep
    end
  end

  # n + n = n (gather requirements to do a complete formula)
  def self.wholeOperation
    getUserInteger(1)
    getUserOperation
    getUserInteger(2)
    doOperation(1, $strUserOperation)
  end

  # what's next? (generate total / accept more operations)
  def self.getNextStep
    bOk = false
    while !bOk
      puts 'Would you like to get the current total (T) or continue adding operations (C) ?'
      strContinue = gets.chomp.downcase
      if strContinue == "t"
        puts "Total is: #{$intRunningTotal}"
        puts "Using the formula: #{$strFormula}"
        !$bMainOk = true
        !bOk = true
      elsif strContinue == "c"
        pieceOperation
      else
        puts 'Invalid Selection!'
      end
    end
  end

  # + n = n (add more operations)
  def self.pieceOperation
    getUserOperation
    getUserInteger(1)
    doOperation(2, $strUserOperation)
  end

  # get integer from user
  def self.getUserInteger(number)
    bOk = false

    while !bOk
      puts 'Please provide an integer'
      begin
        if number == 1
          $intUserNumber = Integer(gets.chomp)
        else
          $intUserNumber2 = Integer(gets.chomp)
        end
        bOk = true
      rescue
        puts 'Invalid Integer!'
      end
    end

  end

  # get operation from user
  def self.getUserOperation
    bOk = false

    while !bOk
      puts 'Please enter an operation ( + or - or x or / )'
      strOp = gets.chomp.downcase
      if (strOp == "+") || (strOp == "-") || (strOp == "x") || (strOp == "/")
        $strUserOperation = strOp
        bOk = true
      else
        puts 'Invalid Operation!'
      end
    end
  end

  # do operation
  def self.doOperation(number, operation)
    if number == 1
      case operation
        when "+"
          $intRunningTotal = $intUserNumber + $intUserNumber2
          $strFormula << stringBuilder(1, $intUserNumber, operation, $intUserNumber2)
        when "-"
          $intRunningTotal = $intUserNumber - $intUserNumber2
          $strFormula << stringBuilder(1, $intUserNumber, operation, $intUserNumber2)
        when "x"
          $intRunningTotal = $intUserNumber * $intUserNumber2
          $strFormula << stringBuilder(1, $intUserNumber, operation, $intUserNumber2)
        when "/"
          $intRunningTotal = $intUserNumber / $intUserNumber2
          $strFormula << stringBuilder(1, $intUserNumber, operation, $intUserNumber2)
      end
    else
      case operation
        when "+"
          $intRunningTotal += $intUserNumber
          $strFormula << stringBuilder(2, $intUserNumber, operation)
        when "-"
          $intRunningTotal -= $intUserNumber
          $strFormula << stringBuilder(2, $intUserNumber, operation)
        when "x"
          $intRunningTotal *= $intUserNumber
          $strFormula << stringBuilder(2, $intUserNumber, operation)
        when "/"
          $intRunningTotal /= $intUserNumber
          $strFormula << stringBuilder(2, $intUserNumber, operation)
      end
    end

  end

  # string builder
  def self.stringBuilder(version, num1, op, num2 = 0)
    if version == 1
      return "#{num1} #{op} #{num2} "
    else
      return "#{op} #{num1} "
    end
  end

  # CALL MAIN METHOD
  main

end