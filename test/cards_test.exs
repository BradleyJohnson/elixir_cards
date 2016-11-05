defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "can load a saved deck" do
    deck = Cards.create_deck
    Cards.save(deck, "saved_deck")
    assert deck == Cards.load("saved_deck")
  end

  test "cannot load a non-exitant deck" do
    assert "That file does not exist" = Cards.load("djh275nas2")
  end
end
