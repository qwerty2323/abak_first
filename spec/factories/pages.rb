FactoryGirl.define do
  factory :page do
    sequence(:name) { |n| "page#{n}" }
    title "Page"
    body "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean et
      egestas nunc, ut fermentum orci. Fusce eleifend elit non turpis
      consectetur efficitur. Etiam malesuada vitae dolor id placerat. Interdum
      et malesuada **fames** ac ante ipsum primis in faucibus. Sed tincidunt
      nisi metus, id finibus mauris aliquet eu. Nam elementum interdum dapibus.
      Donec pulvinar dignissim felis ut vestibulum. Nam porttitor at lectus id
      sollicitudin. \\\\Aliquam\\\\ erat volutpat. Vestibulum egestas tortor massa,
      vel mattis mauris porttitor at. Nunc cursus finibus tempor. Nam bibendum
      ex neque, ut tincidunt augue ((asd/asd blandit)) eget. Duis purus justo, blandit a
      efficitur ac, pellentesque vel orci. Sed sit amet enim magna. Nunc sit
      amet porta felis."

    trait :with_two_children do
      after(:create) do |page|
        create_list :page, 2, parent: page
      end
    end
  end
end
