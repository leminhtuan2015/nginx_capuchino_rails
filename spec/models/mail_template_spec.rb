require "spec_helper"

describe MailTemplate do
  describe "Validation" do
    context "when name is nil" do
      subject{build :mail_template, name: nil}
      it {is_expected.to_not be_valid}
    end

    context "when name is empty" do
      subject{build :mail_template, name: ""}
      it {is_expected.to_not be_valid}
    end
  end
end
