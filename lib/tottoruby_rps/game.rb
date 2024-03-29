# frozen_string_literal: true

module TottorubyRps
  class Even < RuntimeError; end

  class Game
    def call
      player_a = choice_player_type('Player-A')
      player_b = choice_player_type('Player-B')

      5.times do |i|
        puts "******** #{i + 1}回目 ********"

        puts "\tじゃんけん。。。"
        begin
          s1 = player_a.shoot
          s2 = player_b.shoot

          puts "\t#{player_a.name} は #{s1.name}"
          puts "\t#{player_b.name} は #{s2.name}"

          result = s1.judge(s2)

          if result.positive?
            puts "\t#{player_a.name} のかち"
            player_a.win
          elsif result.negative?
            puts "\t#{player_b.name} のかち"
            player_b.win
          else
            raise Even
          end
        rescue Even
          puts "\tあいこで。。。"
          retry
        end
      end

      puts
      puts '(ハマタ) けっかはっぴょぅ'
      puts

      case player_a.win_count <=> player_b.win_count
      when 1
        puts "#{player_a.name} の勝ち！うぇーいｗｗｗ"
      when -1
        puts "#{player_b.name} の勝ち！うぇーいｗｗｗ"
      else
        puts "ひきわけ！！！！１"
      end
    end

    def run = call

    private

    def choice_player_type(name)
      players = TottorubyRps::Player.players

      loop do
        puts 'choice player type ? : '
        players.each.with_index do |player, index|
          puts "\t#{index} : #{player.name}"
        end
        choiced = players[gets.to_i]
        if choiced
          puts "#{choiced.name} - OK"
          return choiced.new(name)
        end
      end
    end
  end
end
