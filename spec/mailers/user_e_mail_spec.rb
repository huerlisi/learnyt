require "spec_helper"

describe UserEMail do
  describe "student_mail" do
    let(:mail) { UserEMail.student_mail }

    it "renders the headers" do
      mail.subject.should eq("Student mail")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "parents_mail" do
    let(:mail) { UserEMail.parents_mail }

    it "renders the headers" do
      mail.subject.should eq("Parents mail")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
