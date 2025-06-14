Ping Pong 2D (LÖVE & Lua)

A classic 2D Ping Pong game developed using LÖVE and Lua.
Table of Contents

    About

    Installation

    How to Play

    Development

    Contributing

    License

About

Ping Pong 2D is a simple and fun two-player Ping Pong game created using LÖVE, a popular game framework for Lua. Players control paddles and try to bounce a ball past their opponent to score points. The game features fast-paced gameplay with a minimalist interface.
Features:

    Local multiplayer (2 players)

    Smooth physics and ball bouncing mechanics

    Easy-to-understand gameplay

    Customizable controls

    Works on all platforms supported by LÖVE

Installation

To play this game on your machine, follow these steps:

    Download LÖVE:
    Go to the LÖVE website and download the appropriate version of LÖVE for your operating system.

    Clone the repository:
    Open your terminal/command line and run the following command:

git clone https://github.com/KIHs0/T-T.git

Run the game:
Navigate to the project folder and run it using LÖVE:

    Windows: Drag the project folder onto love.exe file.

    macOS/Linux: Open a terminal and run:

        love .

How to Play

    Player 1 controls the left paddle using the W and S keys.

    Player 2 controls the right paddle using the Up and Down arrow keys.

    The objective is to bounce the ball past your opponent to score a point.

    The game ends when a player reaches a predefined score (e.g., 5 points).

    After scoring, the ball is reset to the center for the next round.

Development

The game is built with LÖVE (a Lua framework) and consists of the following files:

    main.lua: Contains the main game loop, ball physics, and paddle logic.

    conf.lua: LÖVE configuration file where window size and settings are defined.

    assets/: Folder containing any images or sounds used in the game (if applicable).

Key features in development:

    Paddle Movement: Paddle controls and collision with the ball.

    Ball Physics: Bouncing mechanics with realistic angles and speeds.

    Scoring System: Keeps track of the score for each player.

    Sound Effects: Optional sound effects for ball hits and scoring.

Feel free to tweak and customize the game’s physics, visuals, and controls!
Contributing

We welcome contributions! Here’s how you can contribute:

    Fork the repository.

    Create a feature branch (git checkout -b new-feature).

    Commit your changes (git commit -am 'Add new feature').

    Push to your branch (git push origin new-feature).

    Open a pull request to the main branch.

Please make sure that your code is well-commented and the game runs smoothly before submitting a pull request.
License

This project is licensed under the MIT License - see the LICENSE file for more information.
