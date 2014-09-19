class AddFieldManager
  constructor: (options) ->
    @removeTrigger = options.removeTrigger
    @field = options.field
    @target = $(options.target)
    @previewLocation = $(options.previewLocation)
    @form = $(options.form)
    @fieldDataSource = $(options.fieldDataSource)
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
      that = @
      reader = new FileReader()
      reader.onload = (e) =>
        $parent = $(field).parents(".#{@target[0].className}")

        $parent.addClass "preview-mode"
        $viewer.prop "src", e.target.result
        $parent.find(".#{@previewLocation[0].className}").append $viewer
        @addFields @fieldDataSource.html(), $parent

      reader.readAsDataURL(field.files[0]) if field.files[0]

  addFields: (fieldData, $afterElem) ->
    time = new Date().getTime()
    regexp = new RegExp("0", "g")
    $afterElem.after(fieldData.replace(regexp, time))

  removeField: (trigger) ->
    $trigger = $(trigger)
    $trigger.parents(".#{@target[0].className}").hide()
    $trigger.prev("[id*='destroy']").val('1')

@AddFieldManager = AddFieldManager

