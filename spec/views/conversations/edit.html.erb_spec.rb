require 'rails_helper'

RSpec.describe "conversations/edit", :type => :view do
  before(:each) do
    @conversation = assign(:conversation, Conversation.create!(
      :board => nil,
      :user => nil,
      :title => "MyString",
      :last_commenter_id => 1
    ))
  end

  it "renders the edit conversation form" do
    render

    assert_select "form[action=?][method=?]", conversation_path(@conversation), "post" do

      assert_select "input#conversation_board_id[name=?]", "conversation[board_id]"

      assert_select "input#conversation_user_id[name=?]", "conversation[user_id]"

      assert_select "input#conversation_title[name=?]", "conversation[title]"

      assert_select "input#conversation_last_commenter_id[name=?]", "conversation[last_commenter_id]"
    end
  end
end
