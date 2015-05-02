# Description:
#   Slack logger
#
# TODO: 発言者もログに残す。現在は 時間 slack-logger メッセージ が記録される
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

    fs.appendFile "message.txt", "\n" + str + " " + msg.envelope.user.name + " " + msg.match[1].replace(/slack-logger/, ""), (error) ->
      msg.send "Error writing file" if error
