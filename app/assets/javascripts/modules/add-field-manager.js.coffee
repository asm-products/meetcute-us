class AddFieldManager
  constructor: (options) ->
    @removeTrigger = options.removeTrigger
    @field = options.field
    @target = $(options.target)
    @previewLocation = $(options.previewLocation)
    @form = $(options.form)
    @fieldDataSource = $(options.fieldDataSource)
    @hasTextField = options.hasTextField
    @fieldCount = 0
    @delegateEvents()

  delegateEvents: =>
    that = @
    @form.on "change", @field, ->
      that.previewFile(this, $("<img/>", { "class": "image-preview" }))

    @form.on "click", @removeTrigger, (e) ->
      e.preventDefault()
      that.removeField(this)

  previewFile: (field, $viewer) ->
    if field.files
      reader = new FileReader()
      reader.onload = (e) =>
        $parent = $(field).parents(".#{@target[0].className}")

        $parent.addClass "preview-mode"
        $viewer.prop "src", e.target.result
        $parent.find(".#{@previewLocation[0].className}").append $viewer

        @addFields @fieldDataSource.html(), $parent
        @initPanelEvents($parent) if @hasTextField

      reader.readAsDataURL(field.files[0]) if field.files[0]

  addFields: (fieldData, $afterElem) ->
    @fieldCount++
    regexp = new RegExp(1, "g")
    $afterElem.after(fieldData.replace(regexp, @fieldCount))

  removeField: (trigger) ->
    $trigger = $(trigger)
    $trigger.parents(".#{@target[0].className}").hide()
    $trigger.prev("[id*='destroy']").val('1')

  initPanelEvents: ($context) ->
    eventData =
      transitionClass: "transition-in"
      cancelBtn: $context.find ".button-neutral"
      saveBtn: $context.find ".button-positive"
      textField: $context.find "textarea"
      addCaptionLink: $context.find ".js-add-caption"
      panel: $context.find ".add-field--text"
      image: $context.find "img"

    eventData.addCaptionLink.on "click", eventData, @setShowPanelState
    eventData.cancelBtn.on "click", eventData, @resetFieldState
    eventData.saveBtn.on "click", eventData, @saveFieldState

  resetFieldState: (event) =>
    event.preventDefault()
    if event.data.textField.val() is ""
      event.data.addCaptionLink.html "<i class='fa fa-plus'> Add Caption</i>"

    @togglePanelState(event.data.panel, event.data.image, "hide")

  saveFieldState: (event) =>
    event.preventDefault()
    unless event.data.textField.val() is ""
      event.data.addCaptionLink.text "View Caption"

    @togglePanelState(event.data.panel, event.data.image, "hide")

  setShowPanelState: (event) =>
    event.preventDefault()
    @togglePanelState(event.data.panel, event.data.image, "show")

  togglePanelState: (panel, image, state) ->
    value = if state is "show" then 0 else "100%"

    image.toggleClass "blur"

    panel.velocity
      top: value
    ,
      easing: "easeOutQuint"
      duration: 500

@AddFieldManager = AddFieldManager

