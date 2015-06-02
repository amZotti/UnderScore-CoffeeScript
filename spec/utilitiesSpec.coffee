describe 'utilities', ->
  describe 'identity', ->
    it 'should take value which returns itself', ->
      expect(_.identity(5)).toEqual(5)

