var Game = function(board) {
  if (board) {
    this.board = board
  } else {
    this.board = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    this.spawnTile();
    this.spawnTile();
  };
  this.gameWon = null
}

Game.prototype.turn = function(direction) {

  // move tiles
  switch (direction) {
    case 'up':
      this.board = this.moveUp();
      break;
    case 'down':
      this.board = this.moveDown();
      break;
    case 'left':
      this.board = this.moveLeft();
      break;
    case 'right':
      this.board = this.moveRight();
      break;
  }

  this.spawnTile();

  if (this.checkWin()) {
    this.gameWon = true
  }
  if (this.checkLoss()) {
    this.gameWon = false
  }
}

// What happens if you do a move but everything is already hugging that 'wall'?

Game.prototype.moveUp = function() {
  var array = this.board;

  var columnOne = getColumnOne(array);
  var columnTwo = getColumnTwo(array);
  var columnThree = getColumnThree(array);
  var columnFour = getColumnFour(array);

  columnOne = this.condense(columnOne);
  columnTwo = this.condense(columnTwo);
  columnThree = this.condense(columnThree);
  columnFour = this.condense(columnFour);

  var newArray = [];
  for (var i = 0; i < 4 ; i++) {
    newArray = newArray.concat([columnOne[i], columnTwo[i], columnThree[i], columnFour[i]]);
  }

  return newArray;
}

Game.prototype.moveDown = function() {
  var array = this.board;

  var columnOne = getColumnOne(array).reverse();
  var columnTwo = getColumnTwo(array).reverse();
  var columnThree = getColumnThree(array).reverse();
  var columnFour = getColumnFour(array).reverse();

  columnOne = this.condense(columnOne);
  columnTwo = this.condense(columnTwo);
  columnThree = this.condense(columnThree);
  columnFour = this.condense(columnFour);

  var newArray = [];
  for (var i = 3; i > -1; i--) {
    newArray = newArray.concat([columnOne[i], columnTwo[i], columnThree[i], columnFour[i]]);
  }

  return newArray;
}

Game.prototype.moveLeft = function() {
  var array = this.board;

  var rowOne = getRowOne(array);
  var rowTwo = getRowTwo(array);
  var rowThree = getRowThree(array);
  var rowFour = getRowFour(array);

  rowOne = this.condense(rowOne);
  rowTwo = this.condense(rowTwo);
  rowThree = this.condense(rowThree);
  rowFour = this.condense(rowFour);

  return rowOne.concat(rowTwo.concat(rowThree.concat(rowFour)));
}

Game.prototype.moveRight = function() {
  var array = this.board;

  var rowOne = getRowOne(array).reverse();
  var rowTwo = getRowTwo(array).reverse();
  var rowThree = getRowThree(array).reverse();
  var rowFour = getRowFour(array).reverse();

  rowOne = this.condense(rowOne);
  rowTwo = this.condense(rowTwo);
  rowThree = this.condense(rowThree);
  rowFour = this.condense(rowFour);

  return rowOne.reverse().concat(rowTwo.reverse().concat(rowThree.reverse().concat(rowFour.reverse())));
}

Game.prototype.condense = function(array) {
  // remove all zeros from array
  var newArray = array.filter(function(value){
    return value != 0;
  })

  // if remaining array contains matching, adjacent values - add them together
  newArray = smushRowOrColumn(newArray);

  // add however many zeros necessary for length of 4
  var length = (4 - newArray.length);
  for (var i = 0; i < length; i++) {
      newArray.push(0)
  }

  return newArray
}

function smushRowOrColumn(array) {
  for (var i = 0; i < array.length; i++) {
    var firstElement = array[i];
    var secondElement = array[i+1];
    if (firstElement === secondElement) {
      array[i] = firstElement + secondElement;
      array.splice(i+1, 1);
    }
  }
  return array;
}

function getColumnOne(boardArray) {
  return [boardArray[0], boardArray[4], boardArray[8], boardArray[12]];
}

function getColumnTwo(boardArray) {
  return [boardArray[1], boardArray[5], boardArray[9], boardArray[13]];
}

function getColumnThree(boardArray) {
  return [boardArray[2], boardArray[6], boardArray[10], boardArray[14]];
}

function getColumnFour(boardArray) {
  return [boardArray[3], boardArray[7], boardArray[11], boardArray[15]];
}

function getRowOne(boardArray) {
  return boardArray.slice(0,4);
}

function getRowTwo(boardArray) {
  return boardArray.slice(4,8);
}

function getRowThree(boardArray) {
  return boardArray.slice(8,12);
}

function getRowFour(boardArray) {
  return boardArray.slice(12,16);
}

Game.prototype.checkWin = function() {
  var board = this.board;
  return board.includes(256);
}

Game.prototype.checkLoss = function() {
  if (this.board.includes(0)) {
    return false
  } else {
    if (this.condenseImpossible()) {
      return true
    } else {
      return false
    }
  }
}

Game.prototype.condenseImpossible = function() {
  var boardArray = this.board;

  var columnOne = getColumnOne(boardArray);
  var columnTwo = getColumnTwo(boardArray);
  var columnThree = getColumnThree(boardArray);
  var columnFour = getColumnFour(boardArray);

  var rowOne = getRowOne(boardArray);
  var rowTwo = getRowTwo(boardArray);
  var rowThree = getRowThree(boardArray);
  var rowFour = getRowFour(boardArray);

  var resultsArray = []

  resultsArray.push(arraysIdentical(this.condense(columnOne), columnOne));
  resultsArray.push(arraysIdentical(this.condense(columnTwo), columnTwo));
  resultsArray.push(arraysIdentical(this.condense(columnThree), columnThree));
  resultsArray.push(arraysIdentical(this.condense(columnFour), columnFour));

  resultsArray.push(arraysIdentical(this.condense(rowOne), rowOne));
  resultsArray.push(arraysIdentical(this.condense(rowTwo), rowTwo));
  resultsArray.push(arraysIdentical(this.condense(rowThree), rowThree));
  resultsArray.push(arraysIdentical(this.condense(rowFour), rowFour));

  if (resultsArray.includes(false)) {
    return false
  } else {
    return true
  }
}

function arraysIdentical(array1, array2) {
  var i = array1.length;
  while (i--) {
      if (array1[i] !== array2[i]) return false;
  }
  return true;
}

Game.prototype.spawnTile = function() {
  var emptyTileIndex;
  emptyTileIndex = this.selectEmptyTile();

  this.board[emptyTileIndex] = this.insertTwoOrFour();
}

Game.prototype.selectEmptyTile = function() {
  var boardIndex;
  while(this.board[boardIndex] != 0) {
    boardIndex = Math.floor(Math.random() * 16);
  };
  return boardIndex;
}

Game.prototype.insertTwoOrFour = function() {
  var insertArray = [2,2,2,2,2,4,2,2,2,2];
  var rand = insertArray[Math.floor(Math.random() * insertArray.length)];
  return rand
}


