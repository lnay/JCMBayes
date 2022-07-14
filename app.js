const {Client, Intents} = require('discord.js');
const {token, channel} = require('./auth.json');

// Create a new client instance
const client = new Client({ intents: [Intents.FLAGS.GUILDS, Intents.FLAGS.GUILD_MESSAGES] });

// When the client is ready, run this code (only once)
client.once('ready', () => {
	console.log('Ready! e');
});

client.on('messageCreate', (message) => {
	console.log('message event');
	console.log(message.content);
});

// Login to Discord with your client's token
client.login(token);
