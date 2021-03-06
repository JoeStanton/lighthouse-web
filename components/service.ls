React = require "react"

{div, span, p, a, img, ul, li} = React.DOM
{h1, h2, h3, h4}               = React.DOM
{form, label, input, textarea} = React.DOM

{status-to-colour} = require './helpers.ls'

module.exports = React.create-class do
  displayName: 'Service'
  render: ->
    service = @props.service

    li key: service.name, className: "repo #{status-to-colour service.status}",
      a className: "slug" href: "/#{service.slug}", service.name
      p className: "summary", service.description
