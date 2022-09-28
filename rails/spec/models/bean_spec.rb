require 'rails_helper'

RSpec.describe Bean, type: :model do
  let(:user ) { create(:user) }
  let(:bean) { create(:bean,user: user) }
  let(:bean_build) { build(:bean) }

  it "is invalid with a name" do
    bean_build.name = ''
    expect(bean_build.valid?).to be false
  end

  it "is invalid with a country" do
    bean_build.country = ''
    expect(bean_build.valid?).to be false
  end

  it "is invalid with a roast" do
    bean_build.roast = ''
    expect(bean_build.valid?).to be false
  end

  it "search bean for keyword" do
    bean1 = create(:bean, name: "tokyo blend",user: user)
    bean2 = create(:bean, name: "kyoto blend",user: user)
    bean3 = create(:bean, name: "my blend",user: user)
    expect(Bean.keywords_search(name_cont: "blend").result).to eq [bean1, bean2, bean3]
    expect(Bean.keywords_search(name_cont: "kyoto").result).to eq [bean2]
  end

end
