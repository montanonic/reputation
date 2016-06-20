defmodule Reputation.Network.StackExchange do
  @moduledoc """
  https://api.stackexchange.com/

  StackExchange will likely be the most complicated network to hardcode, since
  we'll want to granularly get a user's reputation from any subsite in the
  Stack Network. The most common subsite will be StackOverflow, but we should
  support selective reputation audits for any subsite in the network.
  """
end
