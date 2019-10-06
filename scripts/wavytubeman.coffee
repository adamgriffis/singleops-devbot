# Description:
#   Wavy Tube Man Bot

send = require('gmail-send')({
  user: 'singleopswavytubeman@gmail.com',
  pass: 'wavytubeman',
  to:   ' trigger@applet.ifttt.com',
});

tubeManOnOff = () ->
  send({
      subject: '#turnon'
      text:  '#turnon',  
    }, 
      (error, result, fullResult) ->
        if error
          console.error(error);
          console.log(result);
    )

    setTimeout(() -> 
      send({
      subject: '#turnoff'
      text:  '#turnoff',  
      }, (error, result, fullResult) ->
        if error 
          console.error(error);
          console.log(result);
      )
    , 20000)


module.exports = (robot) ->

  robot.hear /:wavytubeman:/i, (res) ->
    res.send "I see a wavy tube man"
    tubeManOnOff()

  robot.hear /:armflailingtubeman:/i, (res) ->
    res.send "I see a flaiing tube man"
    tubeManOnOff()

  robot.hearReaction (res) ->
    res.send "I see a reaction: #{res.message.reaction}"

