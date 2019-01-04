.import QtQuick 2.0 as Quick
.import "GameScreen.js" as GameScreen
.import "Constants.js" as Constants

var gameCanvas
var endEffectObject

function start() {
    console.debug("游戏开始")
    gameCanvas = GameScreen.createGameScreen(screen, createGameData(screen.level))
}


function levelUp() {
    console.info("level up ...")
    screen.level++
    GameScreen.endEffectObject.destroy()
    GameScreen.gameScreenObject.destroy()
    gameCanvas = new Object
    gameCanvas = GameScreen.createGameScreen(screen, createGameData(screen.level))
}


function updateData() {
   console.info("update data ...")
   screen.updateTimes++
   GameScreen.endEffectObject.destroy()
   GameScreen.gameScreenObject.destroy()
   gameCanvas = new Object
   gameCanvas = GameScreen.createGameScreen(screen, createGameData(screen.level))
}


function handlePress(xPos, yPos) {
    GameScreen.handlePress(xPos, yPos)
}

function handleTargetMatch(xPos, yPos) {
    GameScreen.handleTargetMatch(xPos, yPos)
}

function handleMatchTimeout() {
     GameScreen.handleChoose()
     GameScreen.circleTargetObject.frequency = 500
}

function handleTouchTimeout() {
    GameScreen.circleTargetObject.frequency = 500
    GameScreen.handleChooseTimeout()
}

function createGameData(level) {
    var gameData = Object
    gameData.place_list = []
    gameData.range = false
    if(level === 1) {
        gameData.size = 2
        gameData.max_number = 10
        gameData.range = true
    } else if(level === 2) {
        gameData.size = 2
        gameData.max_number = 20
        gameData.range = true
    } else if(level === 3) {
        gameData.size = 2
        gameData.max_number = 20
    } else if(level === 4) {
        gameData.size = 3
        gameData.max_number = 20
    } else if(level === 5) {
        gameData.size = 3
        gameData.max_number = 50
    } else {
        gameData.size = level - 2
        gameData.max_number = 100
    }
    return Constants.randomGameData(gameData)
}

// 15s 计时到，显示加油标志
function addOil() {
    GameScreen.addOil()
}
