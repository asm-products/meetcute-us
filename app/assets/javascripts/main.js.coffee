$ -> 
  new App()

App = (options) ->
  self = @

  self.init = ->
    # ko.applyBindings(new FixedFormVewModel())

  self.init()

  self

FixedFormVewModel = (options) ->
  self = @

  self.formType = ko.observable()
  self.formTransitionState = ko.observable()

  self.defaultOptions = 
    fixedFormContainer: ".fixed-form"
    signUpFormContainer: "#sign-up"
    signInFormContainer: "#sign-in"
    fixedFormTriggers: ".main-nav-right a, .container--banner .button--light"

  self.config = $.extend {}, self.defaultOptions, options

  self.$fixedFormContainer = $(self.config.fixedFormContainer)
  self.$fixedFormTriggers = $(self.config.fixedFormTriggers)
  self.$formCloseTrigger = self.$fixedFormContainer.find(".icon-close")
  self.$signUpFormContainer = $(self.config.signUpFormContainer)
  self.$signInFormContainer = $(self.config.signInFormContainer)

  self.init = ->
    self.delegateEvents()

  self.delegateEvents = ->
    self.$fixedFormTriggers.on "click", self.showForm
    self.$formCloseTrigger.on "click", self.hideForm

  self.showForm = (event) ->
    event.preventDefault()
    type = $(event.target).data("type")
    self.formType(if type is "signIn" then "signIn" else "signUp")
    self.formTransitionState("transition-in")

  self.hideForm = (event) ->
    event.preventDefault()
    self.formTransitionState("transition-out")

  self.signIn = (form) ->
    request = $.ajax
      type: "POST"
      url: "/users/sign_in"
      data: $(form).serialize()

    request.done (response) ->
      console.log response

  self.init()

  self