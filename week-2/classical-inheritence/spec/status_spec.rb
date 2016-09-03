require_relative '../bobolink'
require_relative '../nighthawk'
require_relative '../otter'
require_relative '../squirrel'
require_relative '../rage_status'
require_relative '../levitating_status'

describe RageStatus do
  let(:bobolink) { Bobolink.new() }
  let(:nighthawk) { Nighthawk.new() }
  let(:otter) { Otter.new() }

  it 'can change status to rage' do
    expect{ bobolink.rage }.to change { bobolink.status }.to :rage
    expect{ nighthawk.rage }.to change { nighthawk.status }.to :rage
    expect{ otter.rage }.to change { otter.status }.to :rage
  end

  it 'can change status back to normal' do
    bobolink.rage
    nighthawk.rage
    otter.rage
    expect{ bobolink.reset_status }.to change { bobolink.status }.to :normal
    expect{ nighthawk.reset_status }.to change { nighthawk.status }.to :normal
    expect{ otter.reset_status }.to change { otter.status }.to :normal
  end


end

describe LevitatingStatus do
  let(:otter) { Otter.new() }
  let(:squirrel) { Squirrel.new() }

  it 'can change status to levitate' do
    expect{ otter.levitate }.to change { otter.status }.to :levitating
    expect{ squirrel.levitate }.to change { squirrel.status }.to :levitating
  end

  it 'can change status back to normal' do
    otter.levitate
    squirrel.levitate
    expect{ otter.reset_status }.to change { otter.status }.to :normal
    expect{ squirrel.reset_status }.to change { squirrel.status }.to :normal
  end

end

