defaults = YAML.load_file(Rails.root.join("config", "vars_defaults.yml")).with_indifferent_access

if vars = defaults[:vars]
  persisted_vars = GlobalVar.all
  missing_keys = vars.keys - persisted_vars.map(&:key)

  missing_keys.each do |key|
    GlobalVar.create(key: key, value: vars[key])
  end
end

