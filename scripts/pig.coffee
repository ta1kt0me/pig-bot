# Description:
#   Pig script
#
# Notes:
#
#
#
module.exports = (robot) ->
  robot.respond /hello, I am (.*)/i, (msg) ->
    name = msg.match[1]
    msg.send 'Test'
    msg.send 'ちょりーっす'

  robot.respond /pig/i, (msg) ->
    msg.send 'ﾌﾞﾋｯ'

  robot.respond /tiqav (.*)/i, (msg) ->
    request = require('request')
    request.get "http://api.tiqav.com/search.json?q=#{msg.match[1]}", (error, response, body) ->
      if error or response.statusCode != 200
        return msg.send("can't find a picture...XO")
      data = JSON.parse(body)[0]
      msg.send "I got it!!! http://img.tiqav.com/#{data.id}.#{data.ext}"

  robot.hear /war/i, (msg) ->
    msg.send 'Pig!!!'
