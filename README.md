# JCMBayes bot

## Behaviour

### Channel message gatekeeping

The purpose of this bot is to monitor the messages sent to a specific channel
in a discord server and check that they adhere to the arbitrary rules which are
as follows:

1) the message starts with either "JCMB" or "Bayes" (case insensitive and non-optional)
2) followed by one or more spaces, then a word (optional)
3) followed by one punctuation mark

Any messages sent to the channel in question which do not adhere to these rules
receive a sequence of demeining reactions.
And then, after a delay, the message is deleted by this bot.

#### Rule clarifications

This bot will also clarify the rules from the previous section if it sees the message "!rules".
In this case, it does not react to, or delete this message despite breaking the rules.

## Setup

On top of the usual setup for all discord bots (through the discord developer
portal), this bot needs the channel ID of the channel it is monitoring and the
bot token (as found in discord developer portal).

Inside this repo directory, copy the sample config file:

``cp auth.json.sample auth.json``

And modify the values of the "channel" and "token" fields to contain the
channel ID and bot token mentioned above.

Then install the dependencies with npm (required):

```npm install```

## Run

Requires node+npm:

``npm run start``

## Development
`npm run dev` will run nodemon in order to restart node every time a file is changed.
The entrypoint for this bot is [app.js](./app.js).
