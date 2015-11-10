require 'rails_helper'

RSpec.describe Page, :type => :model do
  let (:page) { create(:page, :with_two_children) }
  let (:first_kid) { page.children.first }

  it "has right names path" do
    expect(page.names).to eql(page.name)
  end

  it "has right children names path" do
    expect(first_kid.names).to eql("#{page.name}/#{first_kid.name}")
  end

  it "finds parent page by names string" do
    names = "#{page.name}"

    expect(Page.find_by_names(names).id).to eql(page.id)
  end

  it "finds first kid page by names string" do
    names = "#{page.name}/#{first_kid.name}"

    expect(Page.find_by_names(names).id).to eql(first_kid.id)
  end

  it "returns nil if names string is empty" do
    names = nil

    expect(Page.find_by_names(names)).to be_nil
  end

  it "finds id kid page by names string" do
    names = "#{page.name}/#{first_kid.name}"

    expect(Page.find_id_by_names(names)).to eql(first_kid.id)
  end

  it "returns nil if names string is empty" do
    names = nil

    expect(Page.find_id_by_names(names)).to be_nil
  end

  it "has b tag in formatted body" do
    expect(page.formatted_body).to match(/<b>.+<\/b>/)
  end

  it "has not ** tags in formatted body" do
    expect(page.formatted_body).not_to match(/\*\*(?<text>.+)\*\*/)
  end

  it "has i tag in formatted body" do
    expect(page.formatted_body).to match(/<i>.+<\/i>/)
  end

  it "has not // tags in formatted body" do
    expect(page.formatted_body).not_to match(/\\\\\\\\(?<text>.+)\\\\\\\\/)
  end

  it "has a href tag in formatted body" do
    expect(page.formatted_body).to match(/<a href/)
  end
end
