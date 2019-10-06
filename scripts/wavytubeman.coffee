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
    tubeManOnOff()

  robot.hear /:armflailingtubeman:/i, (res) ->
    tubeManOnOff()

  robot.hearReaction (res) ->
    robot.send "I see a reaction: #{res.message.reaction}"

    # res.message is a ReactionMessage instance that represents the reaction Hubot just heard
    if res.message.type == "added" and res.message.item.type == "message" and (res.message.reaction == ':armflailingtubeman:' or res.message.reaction == ':wavytubeman:')

      tubeManOnOff()
