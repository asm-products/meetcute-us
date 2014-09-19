class AlertsWatcher
  constructor: (options) ->
    @delay = options.delay
    @id = options.id
    @transitionOutClass = options.transitionOutClass
    @alert = $(options.id)
    @delegateEvents()

  delegateEvents: ->
    @checkForVisibleAlerts()

  checkForVisibleAlerts: ->
    @beginCountDown() if @alert.length

  beginCountDown: ->
    that = @
    setTimeout =>
      that.alert.addClass that.transitionOutClass
    , that.delay

@AlertsWatcher = AlertsWatcher
