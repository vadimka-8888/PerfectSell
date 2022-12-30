# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu class: "menu_1", priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content class: "content_1", title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Basic statistical information"
      end
    end

    columns do
      column do
        panel "Most popular stores" do
          ul do
            top_stores.map do |s|
              li s.name
            end
          end
        end
      end
    end

    columns do
      column do
        div class: "panel_1" do
          panel "Most active people" do
            ul do
              top_people.map do |p|
                li p.full_name
              end
            end
          end
        end
      end

      columns do
        column do
          div class: "panel_1" do
            panel "Quantity of stores" do
              ul class: "ul_1" do
                li id: "li1" do Store.select("*").count("id") end
              end
            end
          end
        end
        column do
          div class: "panel_1" do
            panel "Quantity of proposers" do
              ul class: "ul_1" do
                li id: "li1" do Proposer.select("*").count("id") end
              end
            end
          end
        end
        column do
          div class: "panel_1" do
            panel "Quantity of offers" do
              ul class: "ul_1" do
                li id: "li1" do Offer.select("*").count("id") end
              end
            end
          end
        end
        column do
          div class: "panel_1" do
            panel "Average Price" do
              ul class: "ul_1" do
                li id: "li1" do Offer.select("*").average("price") end
              end
            end
          end
        end
      end
    end
  end # content
end

def top_stores
  Store.joins(:bargains).select("name, count(name) as q").group(:name).order("q desc").limit(1)
end

def top_people
  Proposer.joins(:offers).select("full_name, count(full_name) as q").group("full_name").order("q desc").limit(2)
end