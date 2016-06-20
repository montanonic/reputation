defmodule Reputation.Network do

  @moduledoc """
  This module holds behaviours for connecting an application to our network.

  Initially, a set of the largest / most popular applications that use
  reputation will have hardcoded implementations of this, but in the longer term
  our REST API will provide a means to connect any application to this network
  by using HTTP commands. For that case, we'll have a generic callback module
  for the Reputation.Network behaviour.
  """

  @typedoc "Soon we'll make this an actual application user struct."
  @type user :: %Struct{}
  @typedoc "Likewise, soon this will also have a meaningful struct."
  @type reputation :: map

  @doc """
  Links a user to the current application
  """
  @callback link_user(user) :: :ok | {:error, String.t}

  @callback fetch_reputation(user) :: reputation

end
