$ -> 
  new App()

App = (options) ->
  self = @
  
  @defaultOptions = {
    signUpForm: ".fixed-form"
  }

  @config = $.extend {}, @defaultOptions, options

  @$signUpButtons = $(".main-nav-right .button--light, .container--banner .button--light")
  @$formCloseTrigger = $(".fixed-form .icon-close")

  @init = ->
    self.delegateEvents()
  
  @delegateEvents = ->
    @$signUpButtons.on "click", { container: self.config.signUpForm }, self.showFixedForm
    @$formCloseTrigger.on "click", { container: self.config.signUpForm }, self.hideFixedForm

  @showFixedForm = (event) ->
    event.preventDefault();
    $(event.data.container).toggleClass "transition-in"

  @hideFixedForm = (event) ->
    event.preventDefault()
    $(event.data.container).removeClass "transition-in"

  @init()

  self