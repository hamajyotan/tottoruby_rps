# frozen_string_literal: true

module TottorubyRps
  class Gesture
    def initialize(value)
      unless %i[rock paper scissors].include?(value)
        raise ArgumentError, "invalid gesture value. (#{value.inspect})"
      end

      @value = value
    end

    def judge(other)
      case [value, other.value]
      when [:rock, :scissors], [:scissors, :paper], [:paper, :rock]
        1
      when [:rock, :paper], [:scissors, :rock], [:paper, :scissors]
        -1
      else
        0
      end
    end

    def name
      @names ||= {
        rock: '👊',
        paper: '🖐️',
        scissors: '️✌️',
      }[value]
    end

    attr_reader :value

    ROCK = self.new(:rock)
    PAPER = self.new(:paper)
    SCISSORS = self.new(:scissors)
    GESTURES = [ROCK, PAPER, SCISSORS]
  end
end
