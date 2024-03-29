# frozen_string_literal: true

module TottorubyRps
  module Player
    def self.players
      TottorubyRps::Player.constants.reject { _1 == :Base }.map { TottorubyRps::Player.const_get(_1) }.sort_by { _1.name }
    end

    class Base
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def shoot = raise NotImplementedError
      def win_count = @win_count.to_i
      def win = @win_count = win_count.succ
    end

    class Computer < Base
      def shoot = TottorubyRps::Gesture::GESTURES.sample
    end

    class Console < Base
      def shoot
        loop do
          print '1: rock, 2: paper, 3: scissors.... [1,2,3] ? : '
          case gets.to_i
          when 1
            return TottorubyRps::Gesture.new(:rock)
          when 2
            return TottorubyRps::Gesture.new(:paper)
          when 3
            return TottorubyRps::Gesture.new(:scissors)
          end
        end
      end
    end
  end
end