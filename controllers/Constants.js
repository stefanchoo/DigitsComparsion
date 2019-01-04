// 位置，0~24 不能重复
// 数字，1~100 不能重复
// 数量，参与比较的数字数量
function randomGameData(gameData) {
    var view_point_list = []
    for(var i = 0; i < gameData.size; i++) {
        var random_place = Math.round(Math.random() * (gameData.range ? 14 : 24)) + (gameData.range ? 10 : 0)
        while (gameData.place_list.indexOf(random_place) !== -1) {
           random_place = Math.round(Math.random() * (gameData.range ? 14 : 24)) + (gameData.range ? 10 : 0)
        }
        gameData.place_list.push(random_place)
    }
    var max_index = 0;
    var max_value = 0;
    var number_list = []
    var target_point_list = []
    for(var j = 0; j < gameData.size; j++) {
        view_point_list.push(caculateViewPoints(gameData.place_list[j]))
        var random_number = Math.round(Math.random() * (gameData.max_number - 1)) + 1
        while(number_list.indexOf(random_number) !== -1) {
            random_number = Math.round(Math.random() * (gameData.max_number - 1)) + 1
        }
        if(max_value < random_number) {
            max_value = random_number
            max_index = gameData.place_list[j]
        }
        number_list.push(random_number)
    }
    target_point_list.push(caculateTargetPoints(max_index))
    gameData.view_point_list = view_point_list
    gameData.number_list = number_list
    gameData.target_point_list = target_point_list
    console.info(gameData.number_list)
    return gameData
}

// index 0 ~ 24
function caculateViewPoints(index) {
    var x = 260 + (index % 5) * 140
    var y = 100 + Math.floor(index / 5) * 140
    return [x, y]
}

function caculateTargetPoints(index) {
    var x = 320 + (index % 5) * 140
    var y = 160 + Math.floor(index / 5) * 140
    return [x, y]
}
