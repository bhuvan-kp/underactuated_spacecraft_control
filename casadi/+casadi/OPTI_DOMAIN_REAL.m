function v = OPTI_DOMAIN_REAL()
  persistent vInitialized;
  if isempty(vInitialized)
    vInitialized = casadiMEX(0, 163);
  end
  v = vInitialized;
end
