React = window.React = require "react" # Expose for Chrome DevTools
{div, span, p, a, img, ul, li} = React.DOM
{h1, h2, h3, h4}               = React.DOM
{form, label, input, textarea} = React.DOM

api = require "./api.ls"

Top = require "./top.ls"

system-to-colour = -> "red"

System = React.create-class do
  render: ->
    system = @props.system

    li className: "repo #{system-to-colour system.status}",
      a className: "slug" href: "/#{system.id}", system.name
      p className: "summary", system.description

Left = React.create-class do
  render: ->
    div id: "left",
      div id: "search_box",
        input placeholder: "Search all..." type: "text"
      div className: "tab"
        ul id: "repos",
          @props.systems.map (s) -> new System system: s

module.exports = React.create-class do
  getInitialState: ->
    systems: []

  sync: ->
    api.get "/services/", (error, services) ~>
      return console.error error if error
      @setState systems: services

  componentWillMount: -> @sync!

  render: ->
    div className: "application",
      new Top
      Left systems: @state.systems
      @props.children
