# Description:
#   Is IT!?!?!?


module.exports = (robot) ->

  robot.hear /is mercury in retrograde.*/i, (msg) ->
    msg.http('https://mercuryretrogradeapi.com/').get() (err, res, body) ->
      if JSON.parse(body)["is_retrograde"]
        msg.send "Mercury is in retrograde, probably best to call it a day and charge your crystals. :crystal:"
      else
        msg.send "Mercury is not in retrograde, you loon. Conquer your own dark psychic forces. :crystal:"
