function v = OP_DUMP()
  persistent vInitialized;
  if isempty(vInitialized)
    vInitialized = casadiMEX(0, 115);
  end
  v = vInitialized;
end
