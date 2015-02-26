# Description
#   Respond when people say "let me know"
#
# Configuration:
#   None
#
# Commands:
#   lmk|let <someone> know - Random quote about knowledge
#   hubot: lmk|let <someone> know - Cheeky comment
#
# Notes:
#   None
#
# Author:
#   Eric Watson

knowledge = [
  {
    text: "Any fool can know. The point is to understand."
    attr: "Albert Einstein"
  }
  {
    text: "Write what you know. That should leave you with a lot of free time."
    attr: "Howard Nemerov"
  }
  {
    text: "There is much pleasure to be gained from useless knowledge."
    attr: "Bertrand Russell"
  }
  {
    text: "To know what you know and what you do not know, that is true knowledge."
    attr: "Confucius"
  }
  {
    text: "If you have knowledge, let others light their candles at it."
    attr: "Margaret Fuller"
  }
  {
    text: "Knowledge and timber shouldn't be much used till they are seasoned."
    attr: "Oliver Wendell Holmes"
  }
  {
    text: "If money is your hope for independence you will never have it. The only real security that a man will have in this world is a reserve of knowledge, experience, and ability."
    attr: "Henry Ford"
  }
  {
    text: "Information is not knowledge."
    attr: "Albert Einstein"
  }
  {
    text: "To acquire knowledge, one must study; but to acquire wisdom, one must observe."
    attr: "Marilyn vos Savant"
  }
  {
    text: "The man (sic) of knowledge must be able not only to love his enemies but also to hate his friends."
    attr: "Friedrich Nietzsche"
  }
  {
    text: "Confidence is ignorance. If you're feeling cocky, it's because there's something you don't know."
    attr: "Eoin Colfer"
  }
  {
    text: "The possession of knowledge does not kill the sense of wonder and mystery. There is always more mystery."
    attr: "Anaïs Nin"
  }
  {
    text: "People don't care how much you know until they know how much you care."
    attr: "Theodore Roosevelt"
  }
  {
    text: "Four be the things I am wiser to know: \\ Idleness, sorrow, a friend, and a foe."
    attr: "Dorothy Parker"
  }
  {
    text: "Knowledge is power."
    attr: "Sir Francis Bacon"
  }
  {
    text: "Ignorance is the curse of God; knowledge is the wing wherewith we fly to heaven."
    attr: "William Shakespeare"
  }

]

formats = [
  (quote) ->
    "#{quote.text} (#{quote.attr})"
  (quote) ->
    "#{quote.text} #{quote.attr}"
  (quote) ->
    "#{quote.attr} once said, \"#{quote.text}\""
  (quote) ->
    "As good old #{quote.attr.split(" ")[0]} used to say, \"#{quote.text}\""
]

randomKnowledge = (msg) ->
  quote = msg.random knowledge
  format = msg.random formats
  format quote

module.exports = (robot) ->
  robot.respond /lmk/, (msg) ->
    msg.reply "You may know."
    # Mark as done so the `hear` handler doesn't also fire
    msg.message.finish()

  robot.hear /lmk/, (msg) ->
    msg.send randomKnowledge(msg)

  robot.hear /let (.*) know/, (msg) ->
    msg.send randomKnowledge(msg)
