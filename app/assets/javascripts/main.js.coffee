App = ->
  self = @

  self.init = ->
    alertsWatcher = new AlertsWatcher
      delay: 5000
      id: "#notice"
      transitionOutClass: "transition-out"

    galleryFieldManager = new AddFieldManager
      removeTrigger: ".js-remove-fields"
      field: ".add-field input[type='file']"
      target: ".add-field--content"
      previewLocation: ".add-field"
      form: "form[class*='gallery']"
      fieldDataSource: ".additional-fields"
      hasTextField: true

  self.init()

  return self

$ ->
  new App()

