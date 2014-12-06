require 'spec_helper'
require 'parser'

describe Parser::Vorlagen do
  let(:vorlage_html) { File.open(File.dirname(__FILE__) + '/vorlagen.html').read }
  subject { Parser::Vorlagen.new }

  it "saves new vorlagen", vcr: { cassette_name: "vorlagen_detail" } do
    expect {
      subject.new_vorlagen
    }.to change(Vorlage, :count).by(57)
  end
  context 'vorlagen_detail', vcr: { cassette_name: "vorlagen_detail" } do
    let(:vorlage) { subject.result["vorlagen"][0] }
    it "saves vorlagen detail" do
      expect(vorlage).to have_key("detail")
    end
    context "first vorlage" do
      let(:detail) { vorlage["detail"][0] }
      it "has beratungen key" do
        expect(detail).to have_key("beratungen")
      end
      it "has naechste beratungen key" do
        expect(detail).to have_key("naechste_beratungen")
      end
      context 'beratungen' do
        let(:beratungen) { detail["beratungen"] }
        it "has no beratungen" do
          expect(beratungen).to be_empty
        end
      end
      context 'naechste beratungen' do
        let(:naechste_beratungen) { detail["naechste_beratungen"] }
        it "has naechste beratungen" do
          expect(naechste_beratungen).to_not be_empty
        end
        context 'first naechste beratung' do
          let(:beratung) { naechste_beratungen[0] }
          it "has key datum" do
            expect(beratung).to have_key("datum")
          end
          it "datum is not nil" do
            expect(beratung["datum"]).to_not be_nil
          end
        end
      end
    end
    context "second vorlage" do
      let(:second_vorlage) { subject.result["vorlagen"][2] }
      let(:detail) { second_vorlage["detail"][0] }
      context 'beratungen' do
        let(:beratungen) { detail["beratungen"] }
        it "has beratungen" do
          expect(beratungen).to_not be_empty
        end
        context 'first beratung' do
          let(:beratung) { beratungen[0] }
          it "has key datum" do
            expect(beratung["datum"]).to_not be_empty
          end
        end
      end
    end
  end
end
