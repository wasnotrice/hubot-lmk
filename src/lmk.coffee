# Description
#   Heckle "let me know" phraseology
#
# Configuration:
#   None
#
# Commands:
#   let me know - Random comment about "let me know"
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Eric Watson[@<org>]

knowledge = [
  {
    text: "Any fool can know. The point is to understand."
    attr: "Albert Einstein"
  },
  {
    text: "Write what you know. That should leave you with a lot of free time."
    attr: "Howard Nemerov"
  },
]

randomKnowledge = (msg) ->
  quote = msg.random knowledge
  "#{quote.text} (#{quote.attr})"

module.exports = (robot) ->
  robot.respond /lmk/, (msg) ->
    msg.reply "You may know."
    # Mark as done so the `hear` handler doesn't also fire
    msg.message.finish()

  robot.hear /lmk/, (msg) ->
    msg.send randomKnowledge(msg)

  robot.hear /let (.*) know/, (msg) ->
    msg.send randomKnowledge(msg)
