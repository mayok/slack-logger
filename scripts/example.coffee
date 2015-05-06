# Description:
#   Slack logger
#
fs = require "fs"

module.exports = (robot) ->

  robot.hear /(.+)/i, (msg) ->
    d = new Date
    year  = d.getFullYear()
    month = d.getMonth()+1
    date  = d.getDate()
    hour  = d.getHours()
    min   = d.getMinutes()
    sec   = d.getSeconds()

    str  = "#{year}年#{month}月#{date}日"
    str += "#{hour}時#{min}分#{sec}秒"

    channel = msg.envelope.message.room

    fs.appendFile "#{channel}-message.txt", "\n" + str + " " + msg.envelope.user.name + " " + msg.match[1].replace(/slack-logger/, ""), (error) ->
      msg.send "Error writing file" if error
