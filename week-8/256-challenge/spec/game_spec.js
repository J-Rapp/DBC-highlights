describe("a game", function() {
  // var freshGame;
  // var currentGame;
  // var winningGame;
  // var losingGame;

  beforeEach(function() {
    freshGame = new Game();
    currentGame = new Game([16,8,8,2,8,0,8,4,8,2,0,4,0,0,2,4]);
    winningGame = new Game([256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
    oneMovePossibleGame = new Game([32,4,8,2,32,16,2,16,4,8,32,8,16,32,4,2]);
    losingGame = new Game([8,2,4,2,32,16,2,16,4,8,32,6,16,32,4,2]);
  });

  it("has an initial board state", function() {
    expect(freshGame.board.length).toEqual(16);
    expect(freshGame.board).toContain(2 || 4);
  });

  it("has a current board state", function() {
    expect(currentGame.board).toEqual([16,8,8,2,8,0,8,4,8,2,0,4,0,0,2,4]);
  });

  describe("spawnTile", function() {
    it("finds an empty tile and replaces it", function() {
      currentGame.spawnTile();
      currentGame.spawnTile();
      currentGame.spawnTile();
      currentGame.spawnTile();
      expect(currentGame.board).not.toContain(0);
    })
  });

  describe("checkWin", function() {
    it("returns false if array doesn't contain 256", function() {
      expect(freshGame.checkWin()).toBe(false);
    })
    it("returns true if board contains a 256", function () {
      expect(winningGame.checkWin()).toBe(true);
    })
  });

  describe("checkLoss", function() {
    it("returns false if game board is incomplete", function() {
      expect(currentGame.checkLoss()).toBe(false);
    });
    it("returns false if game board is full but moves are possible", function() {
      expect(oneMovePossibleGame.checkLoss()).toBe(false);
    });
    it("returns true if game board is full and moves are impossible", function() {
      expect(losingGame.checkLoss()).toBe(true);
    });
  });

  describe("condense", function() {
    it("returns an array of zeros if no values exist", function() {
      expect(currentGame.condense([0,0,0,0])).toEqual([0,0,0,0]);
    })
    it("returns a condensed array with no matching addition", function() {
      expect(currentGame.condense([2,0,0,8])).toEqual([2,8,0,0]);
    })
    it("smushes pairs together", function() {
      expect(currentGame.condense([0,2,0,2])).toEqual([4,0,0,0]);
    })
    it("smushes first pair together and leave other values alone", function() {
      expect(currentGame.condense([0,2,2,2])).toEqual([4,2,0,0]);
    })
    it("smushes multiple like pairs together", function() {
      expect(currentGame.condense([4,4,2,2])).toEqual([8,4,0,0]);
    })
    it("smushes complex stuff", function() {
      expect(currentGame.condense([8,4,4,2])).toEqual([8,8,2,0]);
    })
  });

  describe("moveLeft", function() {
    it("shifts everything to the left", function(){
      expect(currentGame.moveLeft(currentGame.board)).toEqual([16,16,2,0,16,4,0,0,8,2,4,0,2,4,0,0]);
    })
  });

  describe("moveLeft", function() {
    it("shifts everything to the right", function(){
      expect(currentGame.moveRight(currentGame.board)).toEqual([0,16,16,2,0,0,16,4,0,8,2,4,0,0,2,4]);
    })
  });

  describe("moveUp", function() {
    it("shifts everything up", function(){
      expect(currentGame.moveUp(currentGame.board)).toEqual([16,8,16,2,16,2,2,8,0,0,0,4,0,0,0,0]);
    })
  });

  describe("moveDown", function() {
    it("shifts everything down", function(){
      expect(currentGame.moveDown(currentGame.board)).toEqual([0,0,0,0,0,0,0,2,16,8,16,4,16,2,2,8])
    })
  });

  describe('turn', function() {
    it("condenses correctly over multiple turns", function (){
      currentGame.turn('left');
      currentGame.turn('up');
      expect(currentGame.board[0]).toEqual(32)
    })
    it("adds a tile", function() {
      winningGame.turn('right')
      expect(winningGame.board).toContain(2 || 4)
    })
    it("something on lose", function() {
      oneMovePossibleGame.turn('up')
      expect(oneMovePossibleGame.gameWon).toBe(false)
    })
    it("something on win", function(){
      winningGame.turn('right')
      expect(winningGame.gameWon).toBe(true)
    })
  });

});
