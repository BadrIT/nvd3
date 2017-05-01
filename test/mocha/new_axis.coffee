describe 'NVD3', ->
  describe 'New-Axis', ->
    sampleData1 = [
      {"values":[{"x":1,"y":2},{"x":3,"y":4},{"x":5,"y":6}],"key":"key 1"}
      {"values":[{"x":7,"y":8},{"x":9,"y":10},{"x":11,"y":12}],"key":"key 2"}
      {"values":[{"x":13,"y":14},{"x":15,"y":16},{"x":17,"y":18}],"key":"key 3"}
    ]

    sampleData2 = [
      key: 'series 1'
    ,
      key: 'series 2'
    ,
      key: 'series 3'
    ,
      key: 'series 4'
    ]

    axisOptions =
      margin:
        top: 0
        right: 0
        bottom: 0
        left: 0
      width: 100
      height: 100
#      key: (d) -> d.key
#      color: nv.utils.defaultColor()
#      align: true
#      rightAlign: false
#      updateState: true
#      radioButtonMode: false

    builder = null
    beforeEach ->
      builder = new ChartBuilder nv.models.axis()
      builder.build axisOptions, sampleData1
      console.log(builder)
#      axis = builder.model
#      for opt, val of axisOptions
#        axis[opt](val)

    afterEach ->
      builder.teardown()
      
    describe 'prints items', ->
      it 'svg should exist', ->
        element = d3.select(builder.svg)
        should.exist element[0][0]


      it 'nv-wrap and nv-axis exist', ->
        element = d3.select(builder.svg).select('.nvd3.nv-wrap.nv-axis')
        should.exist element[0][0]

      it 'has zero tick', ->
        element = d3.select(builder.svg).select('.tick.zero')
        should.exist element[0][0]

      it 'domain exist', ->
        element = d3.select(builder.svg).select('.domain')
        should.exist element[0][0]

      it 'nv-axislabel exist', ->
        element = d3.select(builder.svg).select('.nv-axislabel')
        should.exist element[0][0]

      it 'nv-axisMaxMin, nv-axisMaxMin-x and nv-axisMin-x exist', ->
        element = d3.select(builder.svg).select('.nv-axisMaxMin.nv-axisMaxMin-x.nv-axisMin-x')
        should.exist element[0][0]

      it 'nv-axisMaxMin ,nv-axisMaxMin-x and nv-axisMax-x', ->
        element = d3.select(builder.svg).select('.nv-axisMaxMin.nv-axisMaxMin-x.nv-axisMax-x')
        should.exist element[0][0]

      it 'nv-axisMaxMin, nv-axisMaxMin-x and nv-axisMin-x translate', ->
        element = d3.select(builder.svg).select('.nv-axisMaxMin.nv-axisMaxMin-x.nv-axisMin-x').attr('transform')
        element.should.be.equal 'translate(0,0)'

      it 'nv-axisMaxMin ,nv-axisMaxMin-x and nv-axisMax-x translate', ->
        element = d3.select(builder.svg).select('.nv-axisMaxMin.nv-axisMaxMin-x.nv-axisMax-x').attr('transform') 
        element.should.be.equal 'translate(1,0)'

      it 'text tags should have correct y value', ->
        element = d3.select(builder.svg).selectAll('.nv-axisMaxMin text')
        for item in element[0]
          y = d3.select(item).attr('y')
          dy = d3.select(item).attr('dy')
          y.should.be.equal '3'
          dy.should.be.equal '.71em'