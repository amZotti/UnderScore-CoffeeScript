_.bind = (fn, context, partial...) ->
  return (full...) -> 
    args = partial.concat(full)
    fn.apply(context, args)
