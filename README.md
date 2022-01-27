# Project UBA

Multiplayer robot punching game.

This is a prototype for a framework for multiplayer games based on the WebRTC protocol.

The aim of this framework is to allow anyone to make games that anyone can enjoy with their friends without ever having to copy and paste IPs, configure port forwarding, or spend any money on hosting, neither as a player or as a developer.

This is made possible by the WebRTC protocol, a modern solution for reliably estabilishing peer-to-peer connections among players. Only a very lightweight signaling server is necessary, which has the advantage of being fully reutilizable from one game to another, even if made by a different developer, since it's only concerned with estabilishing the P2P connections and not with sending any game data.

The game is downloadable at https://kekelp.itch.io/project-uba.

For a (slightly less polished) game built with the same ideas in mind, but that can be played from within the browser, see https://github.com/gabriele-tasca/rhymepong, or play it at https://kekelp.itch.io/rhymepong.