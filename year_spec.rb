require 'rspec'
require '../leap_year_check/year' 

describe Year do 

  describe 'divisible_by(number)' do 
    it 'true if year is divisible by number' do 
      Year.new(1996).divisible_by(4).should be_true
      Year.new(2000).divisible_by(100).should be_true
    end

    it 'false if year is not divisible by number' do 
      Year.new(1997).divisible_by(4).should be_false
      Year.new(1900).divisible_by(400).should be_false
    end
  end

  describe 'leap?' do 
    context 'year is divisible_by 4' do 
      context 'not divisible_by 100' do 
        it 'returns true' do 
          Year.new(1996).divisible_by(4).should be_true
          Year.new(1996).divisible_by(100).should be_false
          Year.new(1996).leap?.should be_true
        end
      end

      context 'divisible_by 100' do 
        context 'divisible_by 400' do 
          it 'returns true' do 
            Year.new(2000).divisible_by(4).should be_true
            Year.new(2000).divisible_by(400).should be_true
            Year.new(2000).leap?.should be_true
          end
        end

        context 'not divisible_by 400' do 
          it 'returns false' do 
            Year.new(1900).divisible_by(4).should be_true
            Year.new(1900).divisible_by(100).should be_true
            Year.new(1900).divisible_by(400).should be_false
            Year.new(1900).leap?.should be_false
          end
        end
      end
    end

    context 'year is not divisible_by 4' do 
      it 'returns false' do 
        Year.new(1997).divisible_by(4).should be_false
        Year.new(1997).leap?.should be_false
      end
    end
  end
end