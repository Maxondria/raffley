defmodule RaffleyWeb.CustomComponents do
  use RaffleyWeb, :html

  # If I had loaded these globally in HTML helpers
  # use Phoenix.Component

  # Suppose we have a directory structure, like this:

  # components
  # ├── custom_components.ex
  # ├── icons
  #     ├── moon_icon.html.heex
  #     └── star_icon.html.heex

  # We can load the components in the custom_components.ex file eg:

  # embed_templates "icons/*"

  # The CustomComponents module now defines moon_icon and star_icon function components that can be rendered like so:
  #  <.moon_icon />
  # <.star_icon />

  # And if necessary, we can declare attributes for the components using bodyless function definitions, like this:

  # attr :spinning, :boolean, default: false
  # def moon_icon(assigns)

  # attr :points, :integer, required: true
  # def star_icon(assigns)

  attr :status, :atom, required: true, values: [:upcoming, :open, :closed]
  attr :class, :string, default: nil

  # By default, when you declare an attribute of type :global, it will accept all the global attributes common to all HTML elements, plus any phx-* bindings.
  attr :rest, :global

  def badge(assigns) do
    ~H"""
    <div
      class={[
        "rounded-md px-2 py-1 text-xs font-medium uppercase inline-block border",
        @status == :open && "text-lime-600 border-lime-600",
        @status == :upcoming && "text-amber-600 border-amber-600",
        @status == :open && "text-gray-600 border-gray-600",
        @class
      ]}
      {@rest}
    >
      <%= @status %>
    </div>
    """
  end
end
